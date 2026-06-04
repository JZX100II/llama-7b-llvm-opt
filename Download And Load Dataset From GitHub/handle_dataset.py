import subprocess
import os
import requests

file_paths = [
]

# Base URL for raw content from GitHub
base_url = 'https://raw.githubusercontent.com/'

# Dictionary to store LLVM IR content for each file
llvm_ir_outputs = {}

SRC_ROOT = "/content/dataset"
DST_ROOT = "/content/dataset_ll"

os.makedirs(SRC_ROOT, exist_ok=True)
os.makedirs(DST_ROOT, exist_ok=True)

os.chdir(SRC_ROOT)

for file_path in file_paths:
    print(f"\nProcessing {file_path}...")

    # Fetch the C file content
    url = base_url + file_path
    response = requests.get(url)

    if response.status_code != 200:
        print(f"Error: Could not fetch {file_path} (Status code: {response.status_code})")
        continue

    c_code = response.text

    # Write C code to a temporary file
    # Strip .c extension to avoid double extensions
    base_name = os.path.splitext(file_path.replace('/', '_'))[0]
    temp_c_file = f"{base_name}.c"
    with open(temp_c_file, "w") as f:
        f.write(c_code)

    # Generate LLVM IR using clang
    # ll_file = f"{base_name}.ll"
    ll_file = f"{DST_ROOT}/{base_name}.ll"

    try:
        subprocess.run(["clang", "-S", "-emit-llvm", "-O0", temp_c_file, "-o", ll_file], check=True)
        print(f"LLVM IR generated for {file_path}.")

        # Read the generated LLVM IR
        with open(ll_file, "r") as f:
            llvm_ir = f.read()
        llvm_ir_outputs[file_path] = llvm_ir

    except subprocess.CalledProcessError as e:
        print(f"Error generating LLVM IR for {file_path}: {e}")
    except FileNotFoundError:
        print(f"Error: {ll_file} not found.")

# for file_path, llvm_ir in llvm_ir_outputs.items():
    # print(f"\nLLVM IR for {file_path}:\n{'='*80}\n{llvm_ir}\n{'='*80}")