#!/bin/env python3

### PROJECT ###


from keystoneauth1.identity import v3
from keystoneauth1 import session
from keystoneclient.v3 import client
import sys, os
from xml.etree.ElementTree import parse

xml_file = "Project_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()
auth_url = str(vcenter.get("auth_url"))
project_name = str(vcenter.get("project_name"))
username = str(vcenter.get("username"))
password = str(vcenter.get("password"))
user_domain_id = str(vcenter.get("user_domain_id"))
project_domain_id = str(vcenter.get("project_domain_id"))


Auth = v3.Password(auth_url=auth_url, project_name=project_name, \
        username=username, password=password, \
        user_domain_id=user_domain_id, project_domain_id=project_domain_id)


Session = session.Session(auth=Auth)
Keystone = client.Client(session=Session)

projects = vcenter.getchildren()
for project_info in projects :
	name = str(project_info.get("name"))
	des = str(project_info.get("des"))
	if sys.argv[1] == "0" :
		print("Keystone.projects.create(name="+name+", description="+des+", domain=\"default\",enabled=True)")
	elif sys.argv[1] == "1" :
		Keystone.projects.create(name=name, description=des, domain="default",enabled=True)
	else :
		print("Argument Error")
		exit()
	

