# put this file in .config/libreoffice/4/user/Scripts/python/
import subprocess
import os
import re

from scriptforge import CreateScriptService

def HelloWorld():
    doc = CreateScriptService("Calc")
    doc.SetValue("B8", "Hello World")
    return None

def get_stock_price():
    cmd = [
        "/usr/bin/python",
        "/home/luke/MyPy4LO/yfinance-test.py"
    ]

    result = subprocess.run(cmd, capture_output=True, text=True)
    doc = CreateScriptService("Calc")
    price = float(re.sub("\n", "", result.stdout))
    doc.SetValue("B8", price)
