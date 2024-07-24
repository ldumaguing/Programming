import subprocess

X = subprocess.run(["python3", "codes/reset.py"], capture_output=True, text=True)

print(">>>", X.stdout)
print("xxx", X.stderr)

