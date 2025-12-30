import sys
import os
import requests

module_path = os.path.abspath('/home/ayeka/.config/libreoffice/4/user/Scripts/python/pythonpath')
sys.path.insert(0, module_path)


import nasdaqdatalink
import Stuffs

nasdaqdatalink.ApiConfig.api_key = Stuffs.api_key
# mydata = nasdaqdatalink.get_table('ZACKS/FC', ticker='AAPL')
# mydata = nasdaqdatalink.get_table('MER/F1', compnumber="39102", paginate=True)
# mydata = nasdaqdatalink.get_table('MER/F1',qopts={"columns":"compnumber"}, paginate=True)
mydata = nasdaqdatalink.get_table(
    'WIKI/PRICES',
    qopts={'columns': ['ticker', 'date', 'close']},
    ticker=['AAPL', 'MSFT'],
    date={'gte': '2018-01-01', 'lte': '2019-12-31'},
    paginate=True
)



print(mydata)
