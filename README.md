# llama-7b-llvm-opt

This project explores using **Facebook-Llama-Compiler 7B** from Hugging Face as a compiler to generate optimized **LLVM IR (Intermediate Representation)** code for existing programs.

## Overview

The repository attempts to leverage Facebook-Llama-Compiler 7B's code understanding capabilities to optimize LLVM intermediate representation. The project uses code samples from **MiBench** and GitHub repositories, and experiments with iterative refinement strategies to progressively improve optimization results.

## Approach

1. **Data Collection** - Gather LLVM IR from MiBench benchmarks and GitHub repositories
2. **Model Application** - Feed the code through Facebook-Llama-Compiler 7B compiler FTD model for optimization suggestions
3. **Iterative Refinement** - Recursively pass optimized IR back through the model for further optimization rounds until convergence
4. **Compilation & Validation** - Attempt to compile the optimized code and verify correctness
5. **Performance Analysis** - Benchmark optimized vs. original implementations
6. **Result Visualization** - Analyze and visualize performance metrics

## Repository Structure

- **Datasets** - MiBench and GitHub-sourced code samples
- **LLVM IR** - Intermediate representation files (original and optimized)
- **Working Versions** - Functional implementations and experiments
- **Analysis** - Analysis scripts and processing tools
- **Visualization and Analysis** - Performance benchmarking and metric visualization
- **Important results here** - Key findings and summary results
- **Performance Comparison** - Comparative analysis data

## Current Findings

The optimization results show mixed outcomes. While the Facebook-Llama-Compiler 7B model demonstrates capability in understanding LLVM IR structure, **several challenges emerged**:

- **Compilation Issues** - Many of the generated LLVM IR code samples failed to compile successfully
- **Optimization Limitations** - The model was unable to optimize a significant portion of the test codes
- **Code Generation Quality** - Outputs required extensive validation and debugging
- **Iterative Refinement** - Early experiments with iterative refinement showed potential but limited practical improvements

These limitations suggest that while LLMs show promise in compiler optimization, additional fine-tuning and validation strategies are needed to improve reliability.

## Tools & Technologies

- **Facebook-Llama-Compiler 7B** (Hugging Face) - Base language model
- **LLVM** - Compiler infrastructure for IR generation and optimization
- **MiBench** - Benchmark suite for code samples
- **Python** - Analysis and data processing scripts

## Getting Started

See the **"Important results here"** directory for detailed findings and the **"Working Versions"** folder for functional implementations.

---

*A research project investigating the feasibility of using large language models as LLVM IR optimizers.*
