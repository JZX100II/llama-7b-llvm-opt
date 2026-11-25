# llama-7b-llvm-opt

This project evaluates Facebook's LLM Compiler 7B model for generating modified LLVM Intermediate Representation (IR) as an approach to LLVM IR optimization.

The experiments used code samples from MiBench and selected GitHub repositories. The model's generated outputs were compared with the original LLVM IR to examine textual differences, line counts, and structural changes.

## Approach

1. **Input Preparation** – Collect C code samples and generate their LLVM IR using Clang.
2. **Model Inference** – Provide LLVM IR samples to the LLM Compiler 7B model and collect its generated responses.
3. **Output Analysis** – Compare generated IR with the original files, examining line-count differences, textual changes, and observed structural changes.
4. **Visualization** – Generate line-count comparisons and summaries of the differences.

## Current Findings

The experiments produced mixed results. Some generated outputs appeared to simplify portions of the LLVM IR, while others showed little structural improvement or were incomplete or invalid.

One notable example is a simple addition function in which the generated IR omitted stack allocations and load/store operations present in the original IR. However, the generated outputs were not comprehensively validated for semantic equivalence or benchmarked against the original programs.

These experiments highlight the challenges of using language models to generate reliable LLVM IR transformations.

## Tools and Technologies

- Facebook LLM Compiler 7B (`facebook/llm-compiler-7b` and `facebook/llm-compiler-7b-ftd`)
- LLVM and Clang
- Python
- PyTorch
- Hugging Face Transformers