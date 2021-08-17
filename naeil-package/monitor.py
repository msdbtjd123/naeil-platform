#!/bin/env python3
from openrc.registry import Openrc
from project_convert import Convert
import sys
import threading
import subprocess
import pymysql

class monitor_info :
	def __init__(self):
		pass

	def setUser_Name(self, user) :
		self.user = user

	def setInstance_Name(self, instance_name) :
		self.instance_name = instance_name

	def getInstance_Name(self) :
		instance_name = []
		#passwd = subprocess.check_output()

		try:
			passwd = subprocess.check_output(["grep","-i",f"nova_db_pw","/naeil-package/openstack-db/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
			connection = pymysql.connect(host='localhost', \
										user=f'nova', \
										password=passwd, \
										db=f'nova')

			with connection.cursor() as cursor:
				sql = f"select display_name, project_id from instances where display_name LIKE '{self.user}_%' AND deleted=0;"
				cursor.execute(sql)
				result = cursor.fetchall()
		finally:
			connection.close()

		for i in range(len(result)):
			instance_name.append(result[i])

		return instance_name

	def getVncURL(self) :
		Project = Convert()
		rc = Openrc()


		def run(i) :
			cmd = f"openstack console url show {self.instance_name[i][0]}"
			url = subprocess.check_output(cmd.split()).decode('UTF-8').split()
			for j in url :
				if 'http' in j :
					url = j.replace('192.168.0.1','203.252.240.80')
					print(self.instance_name[i][0], url)
					break


		for i in range(len(self.instance_name)) :
			Project.setValue(self.instance_name[i][1])
			project_name = Project.id_to_name()
			rc.setenv("admin",project_name)

			t = threading.Thread(target=run, args=(i,))
			t.start()

		#모든 Thread들이 종료될 때까지 기다린다.
		mainThread = threading.currentThread()
		for thread in threading.enumerate():
			# Main Thread를 제외한 모든 Thread들이
			# 카운팅을 완료하고 끝날 때 까지 기다린다.
			if thread is not mainThread:
				thread.join()

		t.join()

stack = monitor_info()

stack.setUser_Name(sys.argv[1])
instance_name = stack.getInstance_Name()

if not instance_name :
	print("Empty")
	exit()

stack.setInstance_Name(instance_name)
stack.getVncURL()

