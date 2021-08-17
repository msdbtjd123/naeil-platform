#!/bin/env python3
import sys,os
from openrc.registry import Openrc

rc = Openrc()
rc.setenv("admin","admin")


test=sys.argv[1]
id=sys.argv[2]
pw=sys.argv[3]

if test=="0" :
	#print(f"openstack user create {id} --password {pw}")
	print(f"openstack role add --project network --user {id} member")
	print(f"openstack role add --project system --user {id} member")
	print(f"openstack role add --project web --user {id} member")
	
elif test=="1" :
	#os.system(f"openstack user create {id} --password {pw}")
	os.system(f"openstack role add --project network --user {id} member")
	os.system(f"openstack role add --project system --user {id} member")
	os.system(f"openstack role add --project web --user {id} member")
