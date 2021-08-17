#!/bin/env python3
from openrc.registry import Openrc
import os
import subprocess

class AccessRuleList :
	def __init__(self) :
		pass

	def add(self, proto, port = None, name = "default") :
		if proto != "icmp" :
			self.proto = "tcp"
		else :
			self.proto = proto

		self.port = port
		self.name = name

		if self.port == None :
			cmd = f"openstack security group rule create --proto {self.proto} {name}"
		else :
			cmd = f"openstack security group rule create --proto {self.proto} --dst-port {port} {name}"

		print(self.proto, self.port, self.name)
		print(cmd)

		subprocess.Popen(cmd.split())

rc = Openrc()
for i in ['network','system','web'] :
	rc.setenv("admin",i)

	acl = AccessRuleList()
	acl.add("icmp")
	acl.add("ssh",22)
