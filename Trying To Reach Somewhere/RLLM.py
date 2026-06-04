from ctransformers import AutoModelForCausalLM
from datasets import load_dataset
from glob import glob
from tqdm import tqdm
import shutil
import subprocess
from pathlib import Path
import pandas as pd

class PassListOptimizer:
    def __init__(self, model_path="llm-compiler-7b-IMat-GGUF", quant="Q4_K_M", dataset_path="finetune_pass_prediction.jsonl"):
        # Load quantized GGUF model
        self.model = AutoModelForCausalLM.from_pretrained(
            model_path,
            model_file=f"llm-compiler-7b-IMat.{quant}.gguf",
            model_type="llama",
            gpu_layers=50  # For Colab T4 GPU
        )
        self.dataset = self._load_dataset(dataset_path)  # For future use

    def _load_dataset(self, path):
        return load_dataset("json", data_files=path)["train"]

    def __call__(self, ir_path, iterations=3):
        current_ir = ir_path
        for i in range(iterations):
            pass_list = self.generate_pass_list(current_ir)
            optimized_ir = self.apply_pass_list(current_ir, pass_list)
            current_ir = self.refine_based_on_feedback(current_ir, optimized_ir, pass_list)
        return current_ir

    def generate_pass_list(self, ir_path):
        with open(ir_path, "r") as f:
            ir_code = f.read()

        # Send IR content to LLM (limit size if needed)
        prompt = f"Suggest an LLVM optimization pass list for the following IR:\n\n{ir_code[:1000]}"
        output = self.model.generate(prompt, max_new_tokens=100)
        return self._parse_pass_list(output)

    def _parse_pass_list(self, text):
        return [p.strip() for p in text.split(",") if "pass" in p or "-" in p]

    def apply_pass_list(self, ir_path, pass_list):
        output_file = "optimized.bc"
        opt_command = ["opt", *pass_list, ir_path, "-o", output_file]
        subprocess.run(opt_command, check=True)
        return output_file

    def refine_based_on_feedback(self, old_ir, new_ir, old_pass_list):
        # Placeholder for learning-based refinement
        return new_ir

# ✅ Initialize optimizer
optimizer = PassListOptimizer(
    model_path="llm-compiler-7b-IMat-GGUF",
    quant="Q4_K_M",
    dataset_path="finetune_pass_prediction.jsonl"
)

# ✅ Process .ll files
ll_files = glob("tsvb_dataset/**/*.ll", recursive=True)[:100]
results = []

for f in tqdm(ll_files):
    try:
        # Optimize
        optimized_path = optimizer(f)

        # Convert original to .bc for measurement
        original_bc = f.replace(".ll", ".bc")
        subprocess.run(["llvm-as", f, "-o", original_bc], check=True)

        size_before = Path(original_bc).stat().st_size
        size_after = Path(optimized_path).stat().st_size

        # Save result
        results.append({
            "file": f,
            "size_before": size_before,
            "size_after": size_after,
            "percent_reduced": round((size_before - size_after) / size_before * 100, 2)
        })

        # Move optimized .bc for inspection
        shutil.move(optimized_path, f.replace(".ll", "_llmopt.bc"))

    except Exception as e:
        print(f"Error on {f}: {e}")

# ✅ Report
df = pd.DataFrame(results)
print(df.head())
print(f"\nAverage reduction: {df['percent_reduced'].mean():.2f}%")
df.to_csv("llm_optimizer_results.csv", index=False)