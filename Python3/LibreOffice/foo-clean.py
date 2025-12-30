import sys
import os
import requests

module_path = os.path.abspath('/home/ayeka/.config/libreoffice/4/user/Scripts/python/pythonpath')
sys.path.insert(0, module_path)


import nasdaqdatalink
import Stuffs

nasdaqdatalink.ApiConfig.api_key = Stuffs.api_key
mydata = nasdaqdatalink.get_table('ZACKS/FC', ticker='AAPL')

print(mydata)
