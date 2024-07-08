'''
By using run() function the other Python script will be executed as a separate process.
'''
import subprocess

print("   Calling subprocess...")
# subprocess.run(["python3", "SubFoo1/main.py"])    # fire & wait
# subprocess.Popen(["python3", "SubFoo1/main.py"])  # fire & forget

X = subprocess.run(["python3", "SubFoo1/main2.py"], capture_output=True, text=True)
print(">>>", X.stdout)

print("The End")



