#!/bin/env python3

### USER ###

from keystoneauth1.identity import v3
from keystoneauth1 import session
from keystoneclient.v3 import client
import sys,os,subprocess
from xml.etree.ElementTree import parse

xml_file = "/root/openstack.d/user.d/User_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()
auth_url = str(vcenter.get("auth_url"))
project_name = str(vcenter.get("project_name"))
username = str(vcenter.get("username"))
password = str(vcenter.get("password"))
user_domain_id = str(vcenter.get("user_domain_id"))
project_domain_id = str(vcenter.get("project_domain_id"))

os.system("source /root/openstack.d/adminrc_admin.sh")

Auth = v3.Password(auth_url=auth_url, project_name=project_name, \
        username=username, password=password, \
        user_domain_id=user_domain_id, project_domain_id=project_domain_id)


Session = session.Session(auth=Auth)
Keystone = client.Client(session=Session)

role_id = dict()
for role in Keystone.roles.list() :
	key = subprocess.getstatusoutput('echo \"'+ str(role) +'\" | tr "," "\n" | tr -d " " | grep "^name" | awk -F "=" \'{print $2}\'')[1]
	value = subprocess.getstatusoutput('echo \"'+ str(role) +'\" | tr "," "\n" | tr -d " " | grep "^id" | awk -F "=" \'{print $2}\'')[1]
	role_id[key] = value


project_id = dict()
for project in Keystone.projects.list() :
	key = subprocess.getstatusoutput('echo \"'+ str(project) +'\" | tr "," "\n" | tr -d " " | grep "^name" | awk -F "=" \'{print $2}\'')[1]
	value = subprocess.getstatusoutput('echo \"'+ str(project) +'\" | tr "," "\n" | tr -d " " | grep "^id" | awk -F "=" \'{print $2}\'')[1]
	project_id[key] = value

users = vcenter.getchildren()
for user_info in users:
	id = str(user_info.get("id"))
	pw = str(user_info.get("pw"))
	project = str(user_info.get("project"))
	role = str(user_info.get("role"))
	
	if sys.argv[1] == "0" :
		print(f"Keystone.users.create(name={id}, password={pw}))")
		print("Keystone.roles.grant('{role_id[role]}',user='{User_id}', project='{project_id[project]}')")
	elif sys.argv[1] == "1" :
		User = str(Keystone.users.create(name=id, password=pw))
		User_id = User.split(" ")[3].split("=")[1].replace(",","")

		Keystone.roles.grant(f"{role_id[role]}",user=f"{User_id}", project=f"{project_id[project]}")
	else :
		print("Argument Error")
		exit()



