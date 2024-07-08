'''
By using run() function the other Python script will be executed as a separate process.
'''
import subprocess

print("   Calling subprocess...")
# subprocess.run(["python3", "SubFoo1/main.py"])    # fire & wait
subprocess.Popen(["python3", "SubFoo1/main.py"])  # fire & forget


print("The End")

