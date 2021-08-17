<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<header>
		<div id="small_header">
			<div id="logo_box" onclick="location.href='/'">
				<img id='logo_img' src='/resources/images/top_bottom/logo.png'>
				<div id='logo_txt'>
					<span id='logo_txt_left'>내일</span>
				</div>
			</div>



		</div>
		<div id="small_header2">
			<div id="tab_box">
				<div class="tab_item">
					<p class="myinfo" >내정보&emsp;|</p>
				</div>

				<div class="tab_item" onclick="location.href='mypage.jsp'">
					<p class="tab_hover" >회원정보</p>
				</div>

				<div class="tab_item" onclick="location.href=''">
					<p class="tab_hover" >비밀번호 변경</p>
				</div>

				<div class="tab_item" onclick="Instructor_check()">
					<p class="tab_hover" >강사신청</p>
				</div>

				<div class="tab_item" onclick="location.href=''">
					<p class="tab_hover" >회원탈퇴</p>
				</div>
			</div>
			<div id='account_box'>
				<%
					String user_id = (String)session.getAttribute("session_userid");
					String user_belong = (String)session.getAttribute("session_belong");
					String user_admin_code = (String)session.getAttribute("session_admin_code");
					String my_admin_id = (String)session.getAttribute("session_my_admin_id");
					int user_license = (int)session.getAttribute("session_license");


					try {
						if( !(user_id.equals("")) ){		//세션값에 값이 있을때
				%>
							<div class="login_item" style='color: #5f81bf'>
								<a href="mypage.jsp"><%=user_id%>님</a>
							</div>

							<div class="login_item" style='color: #53575e'>
								<a href="logout.jsp">로그아웃</a>
							</div>
				<%
					   }
                	}catch(NullPointerException e){
						user_id = "";
                    	//e.printStackTrace();
				%>	
						<div class="login_item" style='color: #53575e'>
							<a href="login.jsp">로그인</a>
						</div>
						<div class="login_item" style='color: #5f81bf'>
							<a href="signup.jsp">회원가입</a>
						</div>
				<%
					}
				%>
			</div>
		</div>
	</header>
</body>
</html>
