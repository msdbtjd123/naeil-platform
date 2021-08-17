<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>

<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="refresh" content="3; url=https://www.naver.com/">
		<title>Bootstrap 4</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<style>
			p { margin:20px 0px; }
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col">
					<p><strong>1. 다음 중 fdisk 명령으로 파티션 속성을 변경할 떄 사용하는 값의 조합으로 틀린것은?? </strong></p>
					<div class="custom-control custom-radio">
						<input type="radio" name="리눅스마스터" id="jb-radio-1" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-1">1. Linux:81 </label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="리눅스마스터" id="jb-radio-2" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-2">2. Swap: 82</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="리눅스마스터" id="jb-radio-3" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-3">3. LVM:8e</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" name="리눅스마스터" id="jb-radio-4" class="custom-control-input">
						<label class="custom-control-label" for="jb-radio-4">4.Raid:fd </label>
					</div>
					<div>
					&nbsp;&nbsp;
					</div>

					<FORM>
						<INPUT type='BUTTON' value='다음문제'>
					</FORM>
	<script>
	var time = 600; //기준시간 작성
	var min = ""; //분
	var sec = ""; //초

	//setInterval(함수, 시간) : 주기적인 실행
	var x = setInterval(function() {
		//parseInt() : 정수를 반환
		min = parseInt(time/60); //몫을 계산
		sec = time%60; //나머지를 계산

		document.getElementById("demo").innerHTML = min + "분" + sec + "초";
		time--;

		//타임아웃 시
		if (time < 0) {
			clearInterval(x); //setInterval() 실행을 끝냄
			document.getElementById("demo").innerHTML = "시간초과";
		}
	}, 1000);
</script>
<body>
	<div id="demo"></div>
</body>	
			
					







				
