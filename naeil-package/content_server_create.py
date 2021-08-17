#!/bin/env python3
import subprocess
import sys
import os
from openrc.registry import Openrc

class Heat :
	def __init__(self) :
		pass
	
	def mkdir(self, name, path) :
		self.name = name
		self.path = path
		subprocess.run(['mkdir',f'{self.path}/{self.name}'])

	def run(self, project) :
		self.project = project
		cmd=f"sed 's/$name/{self.name}/g' {self.path}/{self.project}.yaml.ori > {self.path}/{self.name}/{self.project}.yaml"
		os.system(cmd)
		subprocess.Popen(['openstack','stack','create', f'{self.name}_{self.project}', '-t', f'{self.path}/{self.name}/{self.project}.yaml'])
		#print(f"subprocess.Popen(['openstack','stack','create', f'{self.name}_{self.project}', '-t', f'{self.path}/{self.name}/{self.project}.yaml'])")

name = sys.argv[1]

rc = Openrc()
heat = Heat()
heat.mkdir(name, "/naeil-package/content_server_create.d")

for project in ['network','system','web'] :
	rc.setenv("admin",project)
	heat.run(project)	
	
