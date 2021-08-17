<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.lang.String"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div id="instructor_form_display" style="display: none;">
		<jsp:include page="instructor.jsp" />
</div>
<div id='contain_column_box'>
	<div class='contain_column'>
		<div class='contain_row info'>
			<div>나의 개인정보</div>
			<div class='mypage_change_button' >변경하기</div>
			<div>
				<p class="info_content">
					계정명: <%=user_id%>
				</p>
				<p class="info_content">
					소속: <%=user_belong%>
				</p>
				<p class="info_content">
					패스워드 암호화 : 적용중:
				</p>
			</div>
		</div>

		<div class='contain_row'>
			<%if(user_belong.equals("admin")){%>
				<div>나의 강사정보</div>
				<div class='mypage_change_button' onclick="">등록완료</div>
				<div>나의 코드: <%=user_admin_code%><br>나의 아이디: <%=user_id%></div>
			<%}else{%>
				<div>나의 강사님 정보</div>
				<% 
				if( user_admin_code.equals("X") ){
				%>
					<div class='mypage_change_button' onclick="Instructor_Hide_display()">등록하기</div>
					<div>강사님 코드: 등록되지 않음<br>강사님 아이디: 등록되지 않음</div>
				<%}else{%>
					<div class='mypage_change_button' onclick="Instructor_Hide_display()">변경하기</div>
					<div>강사님 코드: <%=user_admin_code%><br>강사님 아이디: <%=my_admin_id%></div>
				<%}	%>
			<%}	%>
		</div>
	</div>
	
	<div class='contain_column'>
		<div class='contain_row'>
			<div>패스워드 변경</div>
			<div class='mypage_change_button' >변경하기</div>
			<div>최소 6개월에 1회 이상 비밀번호 변경을 권장합니다.</div>
		</div>

		<div class='contain_row'>
			<div>결재정보</div>
			<div class='mypage_change_button' >변경하기</div>
			<div>회원님의 결제 수단을 변경할 수 있습니다.<br><br>자동이체 : 신용카드 ( BC카드 944603********** )<br>보안을 위하여 상세한 카드번호, 계좌 정보 등은 표시되지 않습니다.</div>
		</div>

		<div class='contain_row'>
			<div>라이센스</div>
			<% 
			if( user_license == -1 ){
			%>
				<div class='mypage_change_button' onclick="location.href='license.jsp'">등록하기</div>
				<div>라이센스 남은 기간 : 등록된 라이센스가 없습니다.</div>
			<%}else{%>
				<div class='mypage_change_button' onclick="location.href='license.jsp'">갱신하기</div>
				<div>라이센스 남은 기간 : <%=user_license%>일</div>
			<%}	%>
		</div>
	</div>
	<div class='contain_column main_box_right'>
		<div class='contain_row' style="height:100%">
			<div>로그 서비스</div>
			<div class='mypage_change_button' >준비중</div>
			<div>빠른 시일안에 준비하여 더 좋은 서비스를 <br>제공하겠습니다.</div>
		</div>
	</div>
</div>
</body>
</html>
