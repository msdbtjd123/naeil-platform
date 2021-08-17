#!/bin/env python3

### EXPORT ###

import os,sys,subprocess
from xml.etree.ElementTree import parse

def check_status(id) :
	db_pw=subprocess.getstatusoutput("grep -i cinder_db_pw /root/answer.txt | awk -F '=' '{print $NF}'")[1]
	cmd="mysql cinder -u cinder -p"+ db_pw  +" -e \"SELECT status FROM volumes WHERE id='"+id+"'\" | grep -v 'status' "
	return subprocess.getstatusoutput(cmd)[1]

xml_file = "/root/openstack.d/import,export.d/Export_Info.xml"
tree = parse(xml_file)
vcenter = tree.getroot()

os.environ['OS_AUTH_URL'] = str(vcenter.get("auth_url"))
os.environ['OS_PROJECT_NAME']=str(vcenter.get("project_name"))
os.environ['OS_USER_DOMAIN_NAME']=str(vcenter.get("user_domain_id"))
os.environ['OS_PROJECT_DOMAIN_ID']=str(vcenter.get("project_domain_id"))
os.environ['OS_USERNAME']=str(vcenter.get("username"))
os.environ['OS_PASSWORD']=str(vcenter.get("password"))


volumes = vcenter.getchildren()
for volume_info in volumes :
	id = str(volume_info.get("volume_id"))
	status = check_status(id)
	if status != "available" :
		print("{0}({1}) : 'Export' is only possible when the status is 'Available'".format(id,status))
		continue
	format = str(volume_info.get("format"))
	image_name = str(volume_info.get("image_name"))
	path = str(volume_info.get("path"))
	image_id = subprocess.getstatusoutput("cinder upload-to-image '"+id+"' '"+image_name+"' --disk-format '"+format+"' | grep -w 'image_id' | awk -F '|' '{print $3}' | tr -d ' '")[1]

	"""
	print(image_id)
	cmd = f"openstack image save --file {path+image_name} {image_id}"
	os.system(cmd)
	"""
