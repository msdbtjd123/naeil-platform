#!/bin/env python3

### NETWORK ###

import sys, os
import datetime
from xml.etree.ElementTree import parse

xml_file = "/capstone.d/api.d/snapshot.d/Snapshot.xml"
tree = parse(xml_file)
vcenter = tree.getroot()
now = datetime.datetime.now()
now_time = now.strftime('%Y%m%d%H%M')

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
		instance = str(network_info.get("instance"))
		snapshot = str(network_info.get("snapshot"))
	
		if sys.argv[1] == "0" :
			print("openstack server image create {0} {1}-{2}".format(instance,now_time,snapshot))
		elif sys.argv[1] == "1" :
			os.system("openstack server image create {0} {1}-{2}".format(instance,now_time,snapshot))
		else :
			print("Argument Error")
			exit()
