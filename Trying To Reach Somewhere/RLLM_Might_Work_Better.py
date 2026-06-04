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
        self.model = AutoModelForCausalLM.from_pretrained(
            model_path,
            model_file=f"llm-compiler-7b-IMat.{quant}.gguf",
            model_type="llama",
            gpu_layers=50
        )
        self.dataset = self._load_dataset(dataset_path)

    def _load_dataset(self, path):
        return load_dataset("json", data_files=path)["train"]

    def __call__(self, ir_path, iterations=3):
        current_ir = ir_path
        prev_size = None

        for i in range(iterations):
            pass_list = self.generate_pass_list(current_ir)
            optimized_ir = self.apply_pass_list(current_ir, pass_list)

            # Early stopping: if no improvement in size, break
            size = Path(optimized_ir).stat().st_size
            if prev_size is not None and size >= prev_size:
                break
            prev_size = size

            # Feed back the result for further optimization
            current_ir = self.refine_based_on_feedback(current_ir, optimized_ir, pass_list)

        return optimized_ir

    def generate_pass_list(self, ir_path):
        with open(ir_path, "r") as f:
            ir_code = f.read()
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
        with open(new_ir, "r") as f:
            new_ir_code = f.read()

        feedback_prompt = (
            f"The previous optimization used this pass list:\n"
            f"{', '.join(old_pass_list)}\n\n"
            f"The resulting IR is below:\n\n"
            f"{new_ir_code[:1000]}\n\n"
            f"Suggest a refined pass list to further improve it."
        )

        response = self.model.generate(feedback_prompt, max_new_tokens=100)
        refined_pass_list = self._parse_pass_list(response)
        return self.apply_pass_list(new_ir, refined_pass_list)


# ✅ Initialize optimizer
optimizer = PassListOptimizer(
    model_path="llm-compiler-7b-IMat-GGUF",
    quant="Q4_K_M",
    dataset_path="finetune_pass_prediction.jsonl"
)

# ✅ Process LLVM .ll files
ll_files = glob("tsvb_dataset/**/*.ll", recursive=True)[:100]
results = []

for f in tqdm(ll_files):
    try:
        # Optimize and return path to optimized.bc
        optimized_path = optimizer(f)

        # Convert original to .bc
        original_bc = f.replace(".ll", ".bc")
        subprocess.run(["llvm-as", f, "-o", original_bc], check=True)

        size_before = Path(original_bc).stat().st_size
        size_after = Path(optimized_path).stat().st_size

        results.append({
            "file": f,
            "size_before": size_before,
            "size_after": size_after,
            "percent_reduced": round((size_before - size_after) / size_before * 100, 2)
        })

        # Save result
        shutil.move(optimized_path, f.replace(".ll", "_llmopt.bc"))

    except Exception as e:
        print(f"Error on {f}: {e}")

# ✅ Export results
df = pd.DataFrame(results)
print(df.head())
print(f"\nAverage reduction: {df['percent_reduced'].mean():.2f}%")
df.to_csv("llm_optimizer_results.csv", index=False)