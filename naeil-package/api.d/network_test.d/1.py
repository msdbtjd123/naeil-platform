#!/bin/env python3
import re

pattern = r"smurf"
text = "first_smurf_at1"
matchOB = re.search(pattern , text)

if matchOB:
	print(matchOB)
	print(matchOB.group()) # 매칭된 문자열 # ca
	print(matchOB.start()) # 매칭된 문자열 시작 위치 # 0
	print(matchOB.end())   # 매칭된 문자열 종료 위치 # 2
	print(matchOB.span())  # 매칭된 문자열 시작,종료 위치 # (0, 2)
else:
	print("matching no")
