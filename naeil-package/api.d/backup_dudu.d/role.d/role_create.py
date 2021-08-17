#!/bin/env python3

### ROLE CREATE ###

import sys,os,subprocess
from xml.etree.ElementTree import parse

xml_file = "/root/openstack.d/role.d/Role_create_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()

os.environ['OS_AUTH_URL'] = str(vcenter.get("auth_url"))
os.environ['OS_PROJECT_NAME']=str(vcenter.get("project_name"))
os.environ['OS_USER_DOMAIN_NAME']=str(vcenter.get("user_domain_id"))
os.environ['OS_PROJECT_DOMAIN_ID']=str(vcenter.get("project_domain_id"))
os.environ['OS_USERNAME']=str(vcenter.get("username"))
os.environ['OS_PASSWORD']=str(vcenter.get("password"))

users = vcenter.getchildren()
for user_info in users:
	name = str(user_info.get("name"))
	
	if sys.argv[1] == "0" :
		print(f"openstack role create {name}")
	elif sys.argv[1] == "1" :
		os.system(f"openstack role create {name}")
	else :
		print("Argument Error")
		exit()
