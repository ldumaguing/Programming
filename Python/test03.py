import subprocess
from subprocess import Popen

p = Popen('hexagon getpoints 1.0 0.0 0.0', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, universal_newlines=True)

output, errors = p.communicate()

print (output)

X = output.split('\n')
print(X)
print(X[1])

