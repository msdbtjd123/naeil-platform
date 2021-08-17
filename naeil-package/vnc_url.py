#!/bin/python3
from openrc.registry import Openrc
import sys
import subprocess

class Vncurl :
	def __init__(self) :
		pass

	def geturl(self, name, attack, role) :
		self.name = name
		self.attack = attack
		self.role = role

		cmd = f"openstack console url show {self.name}_{self.attack}_{self.role}"
		url = subprocess.check_output(cmd.split()).decode('UTF-8').split()
		for i in url :
			if 'http' in i :
				url = i
				break
		return url.replace('192.168.0.1','203.252.240.80')

if __name__ == "__main__":
	rc = Openrc()
	rc.setenv("admin",sys.argv[1])

	name = sys.argv[2]
	attack = sys.argv[3]
	role = sys.argv[4]

	vnc = Vncurl()
	url = vnc.geturl(name, attack, role)

	print(url)

