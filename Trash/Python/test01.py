import subprocess

subprocess.call(["hexagon", "getpoints", "1.0", "0.0", "0.0"])

subprocess.call("hexagon getpoints 1.0 0.0 0.0", shell=True)
