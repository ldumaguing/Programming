import sys


# ************************************************************************ main
if len(sys.argv) < 2:
    print("append <scenario ID>")
    exit()

scenarioID = sys.argv[1]
print(f"--- {scenarioID}")
