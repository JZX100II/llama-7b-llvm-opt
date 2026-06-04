import os
import re
import difflib
import matplotlib.pyplot as plt
from pathlib import Path

def clean_ir_content(content):
    """Remove non-IR content like <code>, </code>, and preamble text."""
    content = re.sub(r'</?code>', '', content)
    content = re.sub(r'^.*?(?=; ModuleID)', '', content, flags=re.DOTALL)
    return content.strip()

def count_ir_lines(content):
    """Count non-empty, non-comment lines in IR."""
    lines = content.splitlines()
    return sum(1 for line in lines if line.strip() and not line.strip().startswith(';'))

def compare_ir_files(original_file, optimized_file):
    """Compare two IR files, print differences, and return line counts."""
    with open(original_file, 'r') as f:
        orig_content = f.read()
    with open(optimized_file, 'r') as f:
        opt_content = clean_ir_content(f.read())

    orig_lines = count_ir_lines(orig_content)
    opt_lines = count_ir_lines(opt_content)
    line_reduction = orig_lines - opt_lines

    differ = difflib.Differ()
    orig_lines_all = orig_content.splitlines()
    opt_lines_all = opt_content.splitlines()
    diff = list(differ.compare(orig_lines_all, opt_lines_all))

    print(f"\nComparing {original_file} ({orig_lines} IR lines) vs. {optimized_file} ({opt_lines} IR lines)")
    print(f"Line reduction: {line_reduction} lines")
    if any(line.startswith(('-', '+')) for line in diff):
        print("\nDifferences (lines starting with '-' are from original, '+' from optimized):")
        for line in diff:
            if line.startswith('-') or line.startswith('+'):
                print(line)
    else:
        print("\nNo differences found in IR content.")

    return orig_lines, opt_lines, line_reduction

def plot_line_counts_all(file_pairs, line_counts):
    """Create a single bar plot for all file pairs' line counts."""
    plt.figure(figsize=(20, 6))
    labels = [Path(orig).stem for orig, _ in file_pairs]
    orig_counts = [counts[0] for counts in line_counts]
    opt_counts = [counts[1] for counts in line_counts]

    x = range(len(labels))
    width = 0.35

    plt.bar([i - width/2 for i in x], orig_counts, width, label='Original', color='blue')
    plt.bar([i + width/2 for i in x], opt_counts, width, label='Optimized', color='green')

    plt.title('Line Count Comparison: Original vs. Optimized LLVM-IR')
    plt.xlabel('File')
    plt.ylabel('Number of IR Lines (non-comment, non-empty)')
    plt.xticks(x, labels, rotation=45, ha='right')
    plt.legend()

    for i, (orig, opt) in enumerate(zip(orig_counts, opt_counts)):
        plt.text(i - width/2, orig + 0.5, str(orig), ha='center', va='bottom')
        plt.text(i + width/2, opt + 0.5, str(opt), ha='center', va='bottom')

    plt.tight_layout()
    plot_file = "line_count_comparison_all.png"
    plt.savefig(plot_file)
    plt.close()
    print(f"\nSaved consolidated bar plot to {plot_file}")

def get_original_and_optimized_files(original_path=r'llama 7b compiler\Recurrent\LLVM IR\GitHub Stock',
                                     optimized_path=r'llama 7b compiler\Recurrent\LLVM IR\GitHub Run1'):
    """Get paired .ll files from original and optimized directories."""
    original_files = [f for f in os.listdir(original_path) if f.endswith('.ll')]
    optimized_files = [f for f in os.listdir(optimized_path) if f.endswith('.ll')]

    pairs = []
    for orig in original_files:
        base_name = Path(orig).stem
        opt_name = f"{base_name}_opt_run1.ll"
        if opt_name in optimized_files:
            pairs.append((orig, opt_name))
        else:
            print(f"Warning: No matching optimized file for {orig}")

    return pairs

if __name__ == "__main__":
    original_path = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Stock'
    optimized_path = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Run1'

    # Get paired files
    file_pairs = get_original_and_optimized_files(original_path, optimized_path)

    if not file_pairs:
        print("No matching .ll file pairs found. Check directories and file names.")
        exit()

    # Process each pair and collect line counts
    line_counts = []
    for orig_file, opt_file in file_pairs:
        orig_file_path = os.path.join(original_path, orig_file)
        opt_file_path = os.path.join(optimized_path, opt_file)

        if not os.path.exists(orig_file_path) or not os.path.exists(opt_file_path):
            print(f"Skipping pair: {orig_file} or {opt_file} does not exist")
            continue

        orig_lines, opt_lines, line_reduction = compare_ir_files(orig_file_path, opt_file_path)
        line_counts.append((orig_lines, opt_lines))

    # Plot all line counts in a single figure
    if line_counts:
        plot_line_counts_all(file_pairs, line_counts)
    else:
        print("No valid file pairs processed. Unable to generate plot.")