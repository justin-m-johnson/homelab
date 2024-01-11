# Originally found at https://www.515tech.com/post/how-to-collect-data-from-the-tenable-nessus-api - I have made a fix to a line near the bottom
# will update for project Hommelab SOC in the future, pushing to branch for now as a temporary solution.

import requests # Used for HTTP Requests.
import urllib3 # Used to Disable browser-based functionality
import json #Used to process JSON Data
import pandas as pd # Used to simplify JSON Data
from pandas import json_normalize # Used to simplify JSON Data
import pprint  # Used to simplify JSON Data
import os # Used to create or check for the existence of a folder.
import time # Obviously used for Time/Date Functions

payload = {
   "format": "csv",
   "reportContents": {
       "csvColumns": {
           "id": True,
           "cve": True,
           "cvss": True,
           "risk": True,
           "hostname": True,
           "protocol": True,
           "port": True,
           "plugin_name": False,
           "synopsis": False,
           "description": False,
           "solution": False,
           "see_also": False,
           "plugin_output": False,
           "stig_severity": False,
           "cvss3_base_score": False,
           "cvss_temporal_score": False,
           "cvss3_temporal_score": False,
           "risk_factor": False,
           "references": False,
           "plugin_information": False,
           "exploitable_with": False
        }
    },
   "extraFilters": {
       "host_ids": [],
       "plugin_ids": []
    }
}

# Connection and Authentication Strings
my_nessus_api_url = "https://IP.Address.Or.Hostname.Here:8834"
accessKey = 'replace'
secretKey = 'with keys'

headers = {'Content-type': 'application/json', 'X-ApiKeys': f'accessKey={accessKey}; secretKey={secretKey}'}

sleepPeriod = 5

# Use this headers format if you have your credentials' setup as listed above and not stored somewhere else!
# headers = {'Content-type': 'application/json', 'X-ApiKeys': f'accessKey={accessKey}; secretKey={secretKey}'}

# Create a session, this allows you to conduct multiple operation without authenticating repeatedly.
session = requests.session()
session.headers.update(headers)

# Connect and Authenticate
request = session.get(my_nessus_api_url + '/scans', verify=False)

# Print the Status Code, we are looking for a 200 OK
print(request.status_code)

# Print the data returned from the request
pprint.pprint(request.json())

# Create a data frame from the JSON, so we can read it easier!
# We are basically decoupling JSON into a spreadsheet in memory!

folders = json.loads(request.text)['folders']
scans = json.loads(request.text)['scans']

folders_df = json_normalize(folders)

list_of_folders = folders_df.id.to_list()
for item in list_of_folders:
    print(item)

scans_df = json_normalize(scans)

scans_dictionary = pd.Series(scans_df.name.values, index=scans_df.id).to_dict()
for scan_id, name in scans_dictionary.items():
   print(f'{scan_id}:{name}')

# Now we will create a function to download (Collect) the data for each scan and dump them to a CSV file.
# Let's start by creating a directory to store the data. If one does not exist, create it.
data_storage = 'data'

if not os.path.exists(data_storage):
    print('Folder does not exist, creating...')
    os.makedirs(data_storage)
else:
    print('Folder Exists!')

# Using the existing session, from our list of scans (id), we will download each scan to a CSV.
for scan_id, name in scans_dictionary.items():
    scan_url = f'{my_nessus_api_url}/scans/{scan_id}/export'
    # get the file id
    scan_request = session.get(url=scan_url, verify=False) ## Fix is here , originally stated  scan_request = session.get(scanverify=False)
    jsonPayload = json.dumps(payload)
    r = requests.post(url=scan_url, headers=headers, data=jsonPayload, verify=False)
    jsonData = r.json()
    scanFile = str(jsonData['file'])
    scanToken = str(jsonData['token'])
    status = "loading"
# Use the file just received and check to see if it's 'ready', otherwise sleep for sleepPeriod seconds and try again
    while status != 'ready':
        URL = my_nessus_api_url + "/scans/" + str(scan_id) + "/export/" + scanFile + "/status"
        t = requests.get(url=URL, headers=headers, verify=False)
        data = t.json()
        if data['status'] == 'ready':
            status = 'ready'
        else:
           time.sleep(sleepPeriod)
# Now that the report is ready, download
    URL = my_nessus_api_url + "/scans/" + str(scan_id) + "/export/" + scanFile + "/download"
    d = requests.get(url=URL, headers=headers, verify=False)
    dataBack = d.text
# Clean up the CSV data
    csvData = dataBack.split('\r\n', -1)
    NAMECLEAN = name.replace('/', '-', -1)
    print("-----------------------------------------------")
    print("Starting Download " + NAMECLEAN)
    output_file = f'{data_storage}/{NAMECLEAN}.csv'
    with open(output_file,'w') as csvfile:
        for line in csvData:
           csvfile.writelines(line+'\n')
print('===================================')
print("All Tasks Completed!")
