import requests
import nasdaqdatalink

nasdaqdatalink.ApiConfig.api_key = "hhh"
mydata = nasdaqdatalink.get_table('ZACKS/FC', ticker='AAPL')

print(mydata)
