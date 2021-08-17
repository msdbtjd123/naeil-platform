#!/bin/env python3

### IMPORT ###

import os,sys
from xml.etree.ElementTree import parse

xml_file = "/root/openstack.d/import,export.d/Import_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()

hosts = vcenter.getchildren()

for host in hosts :
	os.environ['OS_AUTH_URL'] = str(host.get("auth_url"))
	os.environ['OS_PROJECT_NAME']=str(host.get("project_name"))
	os.environ['OS_USER_DOMAIN_NAME']=str(host.get("user_domain_id"))
	os.environ['OS_PROJECT_DOMAIN_ID']=str(host.get("project_domain_id"))
	os.environ['OS_USERNAME']=str(host.get("username"))
	os.environ['OS_PASSWORD']=str(host.get("password"))

	images = host.getchildren()
	for image_info in images :
		name = str(image_info.get("name"))
		path = str(image_info.get("path"))
		format = str(image_info.get("format"))

		if sys.argv[1] == "0" :
			print("openstack image create {0} --file {1} --disk-format {2}".format(name,path+name,format))
		elif sys.argv[1] == "1" :
			os.system("openstack image create {0} --file {1} --disk-format {2}".format(name,path+name,format))
		else :
			print("Argument Error")
			exit()
