#!/bin/env python3
import sys, subprocess, pymysql

run = sys.argv[1]
name = sys.argv[2]

cmd = "mysql -e 'select display_name, uuid from instances where deleted = 0' -unova -p$(grep -i nova_db_pw /capstone.d/password.txt | awk -F'=' '{print $2}') nova"

content_s = {"network":["dns","syn","smurf"], "system":["back","scan","passwd"], "web":["xss","sql","replay"]}

for keys,values in content_s.items():
	for value in values:
		break
	break
		
