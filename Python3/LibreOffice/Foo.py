from scriptforge import CreateScriptService

def HelloPython():
    doc = CreateScriptService("Calc")
    doc.SetValue("B8", "Hello")
    return None
