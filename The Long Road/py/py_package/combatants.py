import re


def foo(faction, line):
    if re.search("^$", faction):
        return
    print("yo: " + faction + ":" + line)
