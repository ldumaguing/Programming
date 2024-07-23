import subprocess

# X = subprocess.run(["python3", "codes/reset.py"], capture_output=True, text=True)
X = subprocess.run(["ls", "-la", "/"], capture_output=True, text=True, shell=True)
print(X.stdout)


