#!/bin/env python3

### USER_MOVE ###

import sys,os,subprocess
from xml.etree.ElementTree import parse

xml_file = "/root/openstack.d/user_move.d/User_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()

auth_url = str(vcenter.get("auth_url"))
project_name = str(vcenter.get("project_name"))
username = str(vcenter.get("username"))
password = str(vcenter.get("password"))
user_domain_id = str(vcenter.get("user_domain_id"))
project_domain_id = str(vcenter.get("project_domain_id"))

users = vcenter.getchildren()
for user_info in users:
	name = str(user_info.get("name"))
	now_project = str(user_info.get("now_project"))
	change_projects = str(user_info.get("change_project")).split(',')
	
	roles = subprocess.getstatusoutput("openstack role assignment list --names | grep "+name+" | grep "+now_project+" | awk '{print $2}'")[1].split('\n')

	for role in roles :
		#print(f"openstack role remove --project {now_project} --user {name} {role}")
		os.system(f"openstack role remove --project {now_project} --user {name} {role}")

	for role in change_projects[1:] :
		#print(f"openstack role add --project {change_projects[0]} --user {name} {role}")
		os.system(f"openstack role add --project {change_projects[0]} --user {name} {role}")
