#!/bin/env python3

### COPY INSTANCE ###

import os,sys,subprocess
from threading import Thread
from xml.etree.ElementTree import parse

class copy_instance(Thread) :
	def __init__(self,instance_name,image_name,flavor,volume_size,sg,network) :
		Thread.__init__(self)
		
		self.instance_name=instance_name
		self.image_name=image_name
		self.flavor=flavor
		self.volume_size=volume_size
		self.sg=sg
		self.network=network

	def run(self) :
		def instance_create(self,cmd) :
			if sys.argv[1] == "0" :
				print(cmd)
			elif sys.argv[1] == "1" :
				os.system(cmd)
			else :
				print("Argument Error")
				exit()

		if len(self.network) == 2 :
			cmd = (f"openstack server create {self.instance_name} --image {self.image_name} --flavor {self.flavor} --security-group {self.sg} --boot-from-volume {self.volume_size} --nic net-id={self.network[0]},v4-fixed-ip={self.network[1]}")

		else :
			cmd = (f"openstack server create {self.instance_name} --image {self.image_name} --flavor {self.flavor} --security-group {self.sg} --boot-from-volume {self.volume_size} --network {self.network[0]}")
		Thread(target=instance_create, args=(self,cmd)).start()
		


xml_file = "/root/openstack.d/copy_instance.d/Copy_instance_Info.xml"
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

	instances = host.getchildren()
	for instance_info in instances :
		instance_name = str(instance_info.get("instance_name"))
		image_name = str(instance_info.get("image_name"))
		flavor = str(instance_info.get("flavor"))
		volume_size = str(instance_info.get("volume_size"))
		sg = str(instance_info.get("security_group"))
		network = str(instance_info.get("network")).split(',')
		
		copy_instance(instance_name,image_name,flavor,volume_size,sg,network).start()
		
