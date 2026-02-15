#!/usr/bin/env python3
import os
import sys

pwd = os.getcwd()
pwd += "/py-InGame/modules"
# print(pwd)
sys.path.insert(0, pwd)
import hexagon as hx

hx.foo()
