#!/bin/env python3

### NETWORK ###

import sys, os
from xml.etree.ElementTree import parse

xml_file = "Network_Info.xml"
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

	networks = host.getchildren()
	for network_info in networks :
		name = str(network_info.get("name"))
		subnet_name = str(network_info.get("subnet_name"))
		subnet_range = str(network_info.get("subnet_range"))
		gateway = str(network_info.get("gateway"))
		dns = str(network_info.get("dns"))
		des = str(network_info.get("des"))
	
		if sys.argv[1] == "0" :
			print("openstack network create {0}".format(name))
			print("openstack subnet create {0} --network {1} --subnet-range {2} --gateway {3} --dns-nameserver {4} --description '{5}'".format(subnet_name, name, subnet_range, gateway, dns, des))
		elif sys.argv[1] == "1" :
			os.system("openstack network create {0}".format(name))
			os.system("openstack subnet create {0} --network {1} --subnet-range {2} --gateway {3} --dns-nameserver {4} --description '{5}'".format(subnet_name, name, subnet_range, gateway, dns, des))
		else :
			print("Argument Error")
			exit()
