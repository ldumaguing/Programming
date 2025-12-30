import requests
import config

API_KEY = config.api_key

api_url = 'https://data.nasdaq.com/api/v3/datatables/MER/F1.json'

parameters = {
   'api_key': API_KEY,
   'qopts.per_page': 2
}

json_data = requests.get(api_url, params=parameters).json()
print(json_data)
