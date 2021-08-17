#!/bin/env python3

### ROUTER ###
import os,sys
from xml.etree.ElementTree import parse

xml_file = "Router_Info.xml"
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

	routers = host.getchildren()
	for router_info in routers :
		name = str(router_info.get("name"))
		sub = str(router_info.get("subnet"))

		if sys.argv[1] == "0" :
			print("openstack router create {0}".format(name))
			for i in sub.split(',') :
				print("openstack router add subnet {0} {1}".format(name, i))

		elif sys.argv[1] == "1" :
			os.system("openstack router create {0}".format(name))
			for i in sub.split(',') :
				os.system("openstack router add subnet {0} {1}".format(name, i))
		else :
			print("Argument Error")
			exit()


