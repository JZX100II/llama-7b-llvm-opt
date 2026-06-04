import os
import shutil

def get_opt_and_original_count(path):
    ls = os.listdir(path)

    opt_count = 0
    original_count = 0

    for file in ls:
        if file.endswith("opt_run1.ll"):
            opt_count += 1
            print(file)
        elif file.endswith(".ll"):
            original_count += 1
            print(file)

    print(f'optimized count: {opt_count}')
    print(f'original count: {original_count}')

def move_opts_and_originals():
    ls = os.listdir()

    OPT_DEST_PATH = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Run1'
    ORIGINAL_DEST_PATH = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Stock'

    for file in ls:
        current_full_path = os.path.join(os.getcwd(), file)
        if file.endswith("opt_run1.ll"):
            # print(current_full_path)
            dest_full_path = os.path.join(OPT_DEST_PATH, file)
            # print(dest_full_path)
            shutil.move(current_full_path, dest_full_path)
        elif file.endswith(".ll"):
            # print(current_full_path)
            dest_full_path = os.path.join(ORIGINAL_DEST_PATH, file)
            # print(dest_full_path)
            shutil.move(current_full_path, dest_full_path)

# move_opts_and_originals()

OPT_DEST_PATH = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Run1'
ORIGINAL_DEST_PATH = r'llama 7b compiler\Recurrent\LLVM IR\GitHub Stock'

get_opt_and_original_count(path = OPT_DEST_PATH)
get_opt_and_original_count(path = ORIGINAL_DEST_PATH)