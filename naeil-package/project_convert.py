#!/bin/env python3
import subprocess
import pymysql

class Convert :
	def __init__(self):
		pass
	
	def setValue(self, value):
		self.value = value


	def id_to_name(self) :
		passwd = subprocess.check_output(["grep","-i",f"keystone_db_pw","/naeil-package/openstack-db/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
		connection = pymysql.connect(host='localhost', \
										user=f'keystone_admin', \
										password=passwd, \
										db=f'keystone')
		with connection.cursor() as cursor:
			sql = f"select name from project where id='{self.value}';"
			cursor.execute(sql)
			result = cursor.fetchall()
			connection.close()
		return result[0][0]

	def name_to_id(self) :
		passwd = subprocess.check_output(["grep","-i",f"keystone_db_pw","/naeil-package/openstack-db/password.txt"],universal_newlines=True).split('=')[1].replace("\n","")
		connection = pymysql.connect(host='localhost', \
										user=f'keystone_admin', \
										password=passwd, \
										db=f'keystone')

		with connection.cursor() as cursor:
			sql = f"select id from project where name='{self.value}';"
			cursor.execute(sql)
			result = cursor.fetchall()
			connection.close()
		return result[0][0]
