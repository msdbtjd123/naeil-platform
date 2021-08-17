#!/bin/env python3
from openrc.registry import Openrc
import os
import sys
import subprocess

class Startup :
	def __init__(self) :
		pass

	def run(self, name, status) :
		self.name = name
		self.status = status

		print(self.name, self.status)
		cmd = "openstack server list"
		instance = subprocess.check_output(cmd.split()).decode('UTF-8')
		print(instance)

		#subprocess.Popen(cmd.split())

name = sys.argv[1]
status = sys.argv[2]

rc = Openrc()
for i in ['network','system','web'] :
	rc.setenv("admin",i)

	
