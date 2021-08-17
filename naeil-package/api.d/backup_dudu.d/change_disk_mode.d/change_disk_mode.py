#!/bin/env python3

### CHANGE DISK MODE ###

import os,sys,subprocess
from xml.etree.ElementTree import parse

xml_file = "/root/openstack.d/change_disk_mode.d/Change_disk_mode_Info.xml"
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

	print(str(host.get("project_name")))

	instances = host.getchildren()
	for instance_info in instances :
		instance_name = str(instance_info.get("instance_name"))
		target = str(instance_info.get("target"))
	
		temp = subprocess.getstatusoutput("openstack server show "+instance_name+" | grep -iP \"addresses|flavor|security_groups|volumes_attached\" | awk '{print $4}'")[1].split()

		network,ip=temp[0].split('=')[0],temp[0].split('=')[1]
		flavor=temp[1]
		sg=temp[2].split('=')[1].replace("'","")
		volume_id=temp[3].split('=')[1].replace("'","")
		db_pw=subprocess.getstatusoutput("grep -i cinder_db_pw /root/answer.txt | awk -F '=' '{print $2}'")[1]
		volume_size=subprocess.getstatusoutput(f"mysql cinder -u cinder -p{db_pw} -e \"SELECT size FROM volumes WHERE id='{volume_id}'\" | grep -v size ")[1]

	
		print(f"openstack server delete {instance_name}")
		#os.system(f"openstack server delete {instance_name}")

		print(f"openstack server create {instance_name} --image {target} --flavor {flavor} --security-group {sg} --boot-from-volume {volume_size} --nic net-id={network},v4-fixed-ip={ip}")
		#os.system(f"openstack server create {instance_name} --image {target} --flavor {flavor} --security-group {sg} --boot-from-volume {volume_size} --nic net-id={network},v4-fixed-ip={ip}")

		print(f"openstack volume delete {volume_id}")
		#os.system(f"openstack volume delete {volume_id}")




