import re
import difflib
import matplotlib.pyplot as plt
from pathlib import Path

def clean_ir_content(content):
    """Remove non-IR content like <code>, </code>, and preamble text."""
    # Remove <code> and </code> tags
    content = re.sub(r'</?code>', '', content)
    # Remove any preamble text (e.g., "That's the LLVM-IR I get for that:")
    content = re.sub(r'^.*?(?=; ModuleID)', '', content, flags=re.DOTALL)
    # Remove leading/trailing whitespace
    return content.strip()

def count_ir_lines(content):
    """Count non-empty, non-comment lines in IR."""
    lines = content.splitlines()
    return sum(1 for line in lines if line.strip() and not line.strip().startswith(';'))

def compare_ir_files(original_file, optimized_file):
    """Compare two IR files, print differences, and return line counts."""
    # Read files
    with open(original_file, 'r') as f:
        orig_content = f.read()
    with open(optimized_file, 'r') as f:
        opt_content = clean_ir_content(f.read())

    # Count lines
    orig_lines = count_ir_lines(orig_content)
    opt_lines = count_ir_lines(opt_content)
    line_reduction = orig_lines - opt_lines

    # Compute diff
    differ = difflib.Differ()
    orig_lines_all = orig_content.splitlines()
    opt_lines_all = opt_content.splitlines()
    diff = list(differ.compare(orig_lines_all, opt_lines_all))

    # Print differences
    print(f"\nComparing {original_file} ({orig_lines} IR lines) vs. {optimized_file} ({opt_lines} IR lines)")
    print(f"Line reduction: {line_reduction} lines")
    print("\nDifferences (lines starting with '-' are from original, '+' from optimized):")
    for line in diff:
        if line.startswith('-') or line.startswith('+'):
            print(line)

    return orig_lines, opt_lines, line_reduction

def plot_line_counts(original_file, optimized_file, orig_lines, opt_lines):
    """Create a bar plot of line counts."""
    plt.figure(figsize=(8, 6))
    labels = [Path(original_file).name, Path(optimized_file).name]
    counts = [orig_lines, opt_lines]
    plt.bar(labels, counts, color=['blue', 'green'])
    plt.title('Line Count Comparison: Original vs. Optimized LLVM-IR')
    plt.ylabel('Number of IR Lines (non-comment, non-empty)')
    plt.ylim(0, max(counts) * 1.2)
    for i, count in enumerate(counts):
        plt.text(i, count + 0.5, str(count), ha='center')
    plt.tight_layout()
    plt.savefig('line_count_comparison.png')
    plt.close()
    print(f"\nSaved bar plot to line_count_comparison.png")

if __name__ == "__main__":
    # File paths
    original_file = r"llama 7b compiler\Recurrent\LLVM IR\Stock\Facebook_Sample.ll"
    optimized_file = r"llama 7b compiler\Recurrent\LLVM IR\Run 1\Facebook_Sample_opt_run1.ll"

    # Compare files and get line counts
    orig_lines, opt_lines, line_reduction = compare_ir_files(original_file, optimized_file)

    # Plot line counts
    plot_line_counts(original_file, optimized_file, orig_lines, opt_lines)