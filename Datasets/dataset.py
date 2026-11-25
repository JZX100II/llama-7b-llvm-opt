from datasets import load_dataset

ds = load_dataset("llvm-ml/ComPile", split="train", streaming=True)

count = 0
for example in ds:
    ll = example["ir"]  # assuming "ir" field contains text
    if "define" in ll:
        with open(f"/content/tsvb_dataset/compile_{count}.ll", "w") as f:
            f.write(ll)
        count += 1
    if count >= 1000:
        break

print(f"Saved {count} .ll files")