#!/bin/env python3

### NETWORK ###

import sys, os
from xml.etree.ElementTree import parse

xml_file = "/capstone.d/api.d/public_ip.d/Floating_attach.xml"
tree = parse(xml_file)
vcenter = tree.getroot()

hosts = vcenter.getchildren()
for host in hosts :
	enable=str(host.get("enable"))
	if enable == "F" :
		continue
	os.environ['OS_AUTH_URL'] = str(host.get("auth_url"))
	os.environ['OS_PROJECT_NAME']=str(host.get("project_name"))
	os.environ['OS_USER_DOMAIN_NAME']=str(host.get("user_domain_id"))
	os.environ['OS_PROJECT_DOMAIN_ID']=str(host.get("project_domain_id"))
	os.environ['OS_USERNAME']=str(host.get("username"))
	os.environ['OS_PASSWORD']=str(host.get("password"))

	networks = host.getchildren()
	for network_info in networks :
		ip = str(network_info.get("ip"))
		name = str(network_info.get("name"))
	
		if sys.argv[1] == "0" :
			print("openstack server remove floating ip {0} {1}".format(name,ip))
		elif sys.argv[1] == "1" :
			os.system("openstack server remove floating ip {0} {1}".format(name,ip))
		else :
			print("Argument Error")
			exit()
