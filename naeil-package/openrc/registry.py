#!/bin/env python3
import os
import subprocess

class Openrc :
	def __init__(self):
		pass

	def setenv(self, user, project) :
		path = f"/naeil-package/openrc/{user}_{project}rc.sh"
		if os.path.isfile(path) :
			cmd = f"grep OS {path}"
			values = subprocess.check_output(cmd.split(),universal_newlines=True).replace('"',"").split('\n')
			os.environ['OS_AUTH_URL'] = values[0].split('=')[1]
			os.environ['OS_PROJECT_ID'] = values[1].split('=')[1]
			os.environ['OS_PROJECT_NAME'] = values[2].split('=')[1]
			os.environ['OS_USER_DOMAIN_NAME'] = values[3].split('=')[1]
			os.environ['OS_PROJECT_DOMAIN_ID'] = values[4].split('=')[1]
			os.environ['OS_USERNAME'] = values[5].split('=')[1]
			os.environ['OS_PASSWORD'] = values[6].split('=')[1]
			os.environ['OS_REGION_NAME'] = values[7].split('=')[1]
			os.environ['OS_INTERFACE'] = values[8].split('=')[1]
			os.environ['OS_IDENTITY_API_VERSION'] = values[9].split('=')[1]
		else :
			print(f"[ERROR] {path} : No such file or directory")
