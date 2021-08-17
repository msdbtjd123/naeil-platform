<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.String"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div id='contain_column_box'>
	<div class='contain_column'>
		<div class='contain_title' style='border-bottom: 4px solid #003278'>
			Network
		</div>

		<div class='contain_row'>
			<div>DNS Spoofing</div>
			<div class='status_unavailable' id='dns'>Unavailable</div>
			<div>변질된 데이터가 DNS resolver의 캐시에 유입되어 네임 서버가 유효하지 않은 결과 레코드(예: IP 주소)를 반환한다.</div>
			<div class="training" ><a id='dns_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>Scanning Attack</div>
			<div class='status_unavailable' id='scan'>Unavailable</div>
			<div>포트 스캐닝을 사용하여 서버에 열려있는 포트를 확인하고 해당 포트의 취약점을 이용하여 공격을 수행할 수 있다.</div>
			<div class="training" ><a id='scan_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>Smurf Attack</div>
			<div class='status_unavailable' id='smurf'>Unavailable</div>
			<div>같은 네트워크 상의 사용자들에게 Target ip로 icmp패킷을 브로드캐스트로 날려 공격대상의 서비스를 다운시키는 공격이다.</div>
			<div class="training" ><a id='smurf_url' href=''>실습하기 &gt;</a></div>
		</div>
	</div>
	
	<div class='contain_column'>
		<div class='contain_title' style='border-bottom: 4px solid #42bf0a'>
			System
		</div>

		<div class='contain_row'>
			<div>Back Door</div>
			<div class='status_unavailable' id='back'>Unavailable</div>
			<div>정상적인 인증 절차르 거치지않고, 컴퓨터와 암호 시스템등에 접근할 수 있도록 하는 프로그램 또는 하드웨어의 변형이다.</div>
			<div class="training" ><a id='back_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>Buffer Overflow</div>
			<div class='status_unavailable' id='buf'>Unavailable</div>
			<div>프로그램의 오작동을 유발시키거나, 악의적인 코드를 실행시킴으로써 공격자 프로그램을 통제할 수 있는 권한을 획득하게 된다.</div>
			<div class="training" ><a id='buf_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>Password Crack</div>
			<div class='status_unavailable' id='passwd'>Unavailable</div>
			<div>공격자들이 공격 대상 시스템의 중요 계정의 패스워드를 알아내어 공격에 사용하기 위해 주로 사용한다.</div>
			<div class="training" ><a id='passwd_url' href=''>실습하기 &gt;</a></div>
		</div>
	</div>
	
	<div class='contain_column'>
		<div class='contain_title' style='border-bottom: 4px solid #e66a6a'>
			Web
		</div>

		<div class='contain_row'>
			<div>XSS</div>
			<div class='status_unavailable' id='xss'>Unavailable</div>
			<div>악의적인 스크립트에 의해 페이지가 깨지거나 사용자을 방해하거나 쿠키 및 기타 개인 정보를 탈취하는 공격이다.</div>
			<div class="training" ><a id='xss_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>SQL Injection</div>
			<div class='status_unavailable' id='sql'>Unavailable</div>
			<div>네트워크 유형 유형중 DNS Spoofing 공격을 클라우드 서버내 에서 실습할 수 있습니다.</div>
			<div class="training" ><a id='sql_url' href=''>실습하기 &gt;</a></div>
		</div>

		<div class='contain_row'>
			<div>Replay Attack</div>
			<div class='status_unavailable' id='replay'>Unavailable</div>
			<div>정상적인 Packet을 중간에서 가로채어 복사해 두었다가, 악의적인 목적으로 Packet을 반복해서 보내는 공격이다.</div>
			<div class="training" ><a id='replay_url' href=''>실습하기 &gt;</a></div>
		</div>
	</div>
</div>
</body>
</html>
