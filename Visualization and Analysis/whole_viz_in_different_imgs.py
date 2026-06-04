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

def plot_line_counts(original_file, optimized_file, orig_lines, opt_lines):
    """Create a bar plot of line counts."""
    plt.figure(figsize=(8, 6))
    labels = [Path(original_file).name, Path(optimized_file).name]
    counts = [orig_lines, opt_lines]
    plt.bar(labels, counts, color=['blue', 'green'])
    plt.title(f'Line Count Comparison: {Path(original_file).name} vs. {Path(optimized_file).name}')
    plt.ylabel('Number of IR Lines (non-comment, non-empty)')
    plt.ylim(0, max(counts) * 1.2)
    for i, count in enumerate(counts):
        plt.text(i, count + 0.5, str(count), ha='center')
    plt.tight_layout()
    plot_file = f"line_count_comparison_{Path(original_file).stem}.png"
    plt.savefig(plot_file)
    plt.close()
    print(f"Saved bar plot to {plot_file}")

def get_original_and_optimized_files(original_path=r"llama 7b compiler\Recurrent\LLVM IR\Stock",
                                     optimized_path=r"llama 7b compiler\Recurrent\LLVM IR\Run 1"):
    """Get paired .ll files from original and optimized directories."""
    original_files = [f for f in os.listdir(original_path) if f.endswith('.ll')]
    optimized_files = [f for f in os.listdir(optimized_path) if f.endswith('.ll')]

    # Pair files by matching base names (e.g., sample1.ll with sample1_opt_run1.ll)
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
    original_path = r"llama 7b compiler\Recurrent\LLVM IR\Stock"
    optimized_path = r"llama 7b compiler\Recurrent\LLVM IR\Run 1"

    # Get paired files
    file_pairs = get_original_and_optimized_files(original_path, optimized_path)

    if not file_pairs:
        print("No matching .ll file pairs found. Check directories and file names.")
        exit()

    for orig_file, opt_file in file_pairs:
        orig_file_path = os.path.join(original_path, orig_file)
        opt_file_path = os.path.join(optimized_path, opt_file)

        # Check if files exist
        if not os.path.exists(orig_file_path) or not os.path.exists(opt_file_path):
            print(f"Skipping pair: {orig_file} or {opt_file} does not exist")
            continue

        # Compare and plot
        orig_lines, opt_lines, line_reduction = compare_ir_files(orig_file_path, opt_file_path)
        plot_line_counts(orig_file_path, opt_file_path, orig_lines, opt_lines)