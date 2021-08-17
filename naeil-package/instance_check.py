#!/bin/env python3
import pymysql
import sys
import subprocess
import threading
import re

def network_info(instance_id):
	try:
		passwd = subprocess.check_output(["grep","-i","neutron_db_pw","/naeil-package/openrc/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
		connection = pymysql.connect(host='localhost', \
									user='neutron', \
									password=passwd, \
									db='neutron')

		with connection.cursor() as cursor:  
			sql = f"select ip_address from ipallocations where port_id = '{instance_id}'"
			cursor.execute(sql)
			result = cursor.fetchall()
	finally:
		connection.close()
	return result[0][0]

def router_info(gateway):
	try:
		passwd = subprocess.check_output(["grep","-i","neutron_db_pw","/naeil-package/openrc/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
		connection = pymysql.connect(host='localhost', \
									user='neutron', \
									password=passwd, \
									db='neutron')

		with connection.cursor() as cursor:  
			sql = f"SELECT routerports.router_id \
					from routerports \
					JOIN ipallocations \
					ON ip_address='{gateway}' AND ipallocations.port_id = routerports.port_id"
			cursor.execute(sql)
			result = cursor.fetchall()
	finally:
		connection.close()
	return result[0][0]

def instance_check(router_id, ip, instance_name):
	cmd = f"sudo ip netns exec {router_id} ping {ip} -c 1 -w 1"
	global status
	status = dict()

	try:
		proc = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT)
		status[instance_name] = 'Available'
	except subprocess.CalledProcessError:
		status[instance_name] = 'Unavailable'

	"""
	finally:
		for i,j in status.items() :
			print(i,j)
	"""
#---------------------------------MAIN-------------------------------#

run = sys.argv[1]
name = sys.argv[2]

passwd = subprocess.check_output(["grep","-i","nova_db_pw","/naeil-package/openrc/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
connection = pymysql.connect(host='localhost', \
							user='nova', \
							password=passwd, \
							db='nova')

instance_info = dict()
try:
	with connection.cursor() as cursor:  
		sql = f"SELECT instances.display_name, instances.uuid, virtual_interfaces.uuid AS netid \
				FROM instances \
				JOIN virtual_interfaces \
				ON instances.uuid = virtual_interfaces.instance_uuid \
				WHERE instances.display_name LIKE '{name}%' AND instances.deleted='0';"
		cursor.execute(sql)
		result = cursor.fetchall()

		for i in result:
			instance_info[i[0]] = list()		#key is instance name
			instance_info[i[0]].append(i[1])	#first value is instance id
			instance_info[i[0]].append(i[2])	#second value is network id from instance

			ip = network_info(i[2])
			instance_info[i[0]].append(ip)	#third value is network ip address from instance
			
			gateway = ip.split(".")
			gateway[3] = '1'
			gateway = ".".join(gateway)
			router_id = router_info(gateway)
			instance_info[i[0]].append(f"qrouter-{router_id}")		#fourth value is router id from network ip address
finally:
	connection.close()

for i,j in instance_info.items():
	t = threading.Thread(target=instance_check, args=(j[3], j[2], i))
	t.start()

#모든 Thread들이 종료될 때까지 기다린다.
mainThread = threading.currentThread()
for thread in threading.enumerate():
	# Main Thread를 제외한 모든 Thread들이 
	# 카운팅을 완료하고 끝날 때 까지 기다린다.
	if thread is not mainThread:
		thread.join()

t.join()
finally_status = dict()

for i,j in status.items() :
	for z in ["dns","syn","smurf","back","scan","passwd","xss","sql","replay"] :
		matchOB = re.search(f"_{z}_", i)

		if matchOB:
			key = matchOB.group().replace("_","")
			if key not in finally_status.keys() :
				finally_status[key] = list()
				finally_status[key].append(j)
			else :
				finally_status[key].append(j)

for i,j in finally_status.items() :
	if len(finally_status[i]) == finally_status[i].count("Available") :
		finally_status[i] = "Available"
	else :
		finally_status[i] = "Unavailable"

for i,j in finally_status.items() :
	print(i,j)
