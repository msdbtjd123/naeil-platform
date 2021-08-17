import sys, subprocess, os

run = sys.argv[1]
name = sys.argv[2]

def envset(project_id, project_name) :
	os.environ['OS_AUTH_URL'] = "http://203.252.237.153:5000/v3"
	os.environ['OS_PROJECT_ID'] = project_id
	os.environ['OS_PROJECT_NAME'] = project_name
	os.environ['OS_USER_DOMAIN_NAME'] = "default"
	os.environ['OS_PROJECT_DOMAIN_ID'] = "default"
	os.environ['OS_USERNAME'] = "admin"
	os.environ['OS_PASSWORD'] = "Capstone!2#"
	os.environ['OS_REGION_NAME'] = "RegionOne"
	os.environ['OS_INTERFACE'] = "public"
	os.environ['OS_IDENTITY_API_VERSION'] = "3"

if run == '0' :
	print(f"subprocess.run(['mkdir','/capstone.d/heat.d/content_server_create.d/{name}'])")
	for i in ["network","bddf7990a277404690b3633cab3df200"], ["system","4ddbb8171fa24333821a71666a567633"], ["web","d7db7a855aee4e12adaef338bb90244c"] :
		print(f"envset({i[1]},{i[0]})")
		cmd=f"sed 's/$name/{name}/g' /capstone.d/heat.d/content_server_create.d/{i[0]}.yaml.ori > /capstone.d/heat.d/content_server_create.d/{name}/{i[0]}.yaml"
		print(cmd)
		print(f"subprocess.Popen(['openstack','stack','create', '{name}_{i[0]}', '-t', '/capstone.d/heat.d/content_server_create.d/{name}/{i[0]}.yaml'])\n")

elif run == '1' :
	subprocess.run(['mkdir',f'/capstone.d/heat.d/content_server_create.d/{name}'])
	for i in ["network","bddf7990a277404690b3633cab3df200"], ["system","4ddbb8171fa24333821a71666a567633"], ["web","d7db7a855aee4e12adaef338bb90244c"] :
		cmd=f"sed 's/$name/{name}/g' /capstone.d/heat.d/content_server_create.d/{i[0]}.yaml.ori > /capstone.d/heat.d/content_server_create.d/{name}/{i[0]}.yaml"
		os.system(cmd)
		envset(i[1],i[0])
		subprocess.Popen(['openstack','stack','create', f'{name}_{i[0]}', '-t', f'/capstone.d/heat.d/content_server_create.d/{name}/{i[0]}.yaml'])
