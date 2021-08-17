#!/bin/python3

import os,sys,subprocess
from threading import Thread

openrc_file = f"admin_{sys.argv[1]}rc"
user_id = sys.argv[2]
attack = sys.argv[3]
role = sys.argv[4]

auth_url = subprocess.getstatusoutput(f"grep -i 'export os_auth_url' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
project_id = subprocess.getstatusoutput(f"grep -i 'export os_project_id' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
project_name = subprocess.getstatusoutput(f"grep -i 'export os_project_name' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
user_domain_name = subprocess.getstatusoutput(f"grep -i 'export os_user_domain_name' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
project_domain_id = subprocess.getstatusoutput(f"grep -i 'export os_project_domain_id' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
username = subprocess.getstatusoutput(f"grep -i 'export os_username' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
password = subprocess.getstatusoutput(f"grep -i 'export os_password' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
interface = subprocess.getstatusoutput(f"grep -i 'export os_interface' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]
api_version = subprocess.getstatusoutput(f"grep -i 'export os_identity_api_version' /capstone.d/openrc.d/{openrc_file}.sh | cut -f2 -d'=' | tr -d '\"' ")[1]

os.environ['OS_AUTH_URL']=auth_url
os.environ['OS_PROJECT_ID'] = project_id
os.environ['OS_PROJECT_NAME']=project_name
os.environ['OS_USER_DOMAIN_NAME']=user_domain_name
os.environ['OS_PROJECT_DOMAIN_ID']=project_domain_id
os.environ['OS_USERNAME']=username
os.environ['OS_PASSWORD']=password
os.environ['OS_INTERFACE'] = interface
os.environ['OS_IDENTITY_API_VERSION'] = api_version

url=subprocess.getstatusoutput(f"openstack console url show {user_id}_{attack}_{role} | grep url | cut -f3 -d'|' | tr -d ' ' | sed 's/192.168.0.3/203.252.237.153/'")[1]
print(url)


