URL = "http://172.16.184.8:8080"
USER = "admin"
PASSWORD = "ecirb2016"
APP = "myAPP"
DEBUG = True

import requests
from requests.auth import HTTPBasicAuth

# Initial Token Request
response = requests.post(URL + "/api/" + APP + "/user/", auth=(USER,PASSWORD) )

if response.status_code is not 200:
  print "Error retreiving token, response was:"
  print response.json()
  exit(1);

# Retreive Token if succesful
TOKEN = response.json()['data']['token']
if DEBUG:
  print "Token: [" + TOKEN + "]"

# Get IP Info
response = requests.get(URL + "/api/" + APP + "/sections/3/subnets/10/", headers={'token': TOKEN})

if DEBUG:
  print response.json()
