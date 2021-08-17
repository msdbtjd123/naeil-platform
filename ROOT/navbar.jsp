<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%!
	String user_id = "";
	String user_belong = "";
%>
	<header>
		<div id="small_header">
			<div id="logo_box" onclick="location.href='/'">
				<img id='logo_img' src='/resources/images/top_bottom/logo.png'>
				<div id='logo_txt'>
					<span id='logo_txt_left'>내일</span>
					<!-- <span id='logo_txt_right'>Cyber Agis<br>Training Platform</span> -->
				</div>
			</div>

			<div id="tab_box">
				<div class="tab_item" onclick="location.href='/'">
					소개
				</div>

				<div class="tab_item" onclick="location.href='/train.jsp'">
					실습
				</div>

				<div class="tab_item" onclick="location.href='/dict.jsp'">
					용어사전
				</div>

				<div class="tab_item" onclick="location.href='/license.jsp'">
					신청
				</div>

				<div class="tab_item" onclick="location.href='/promotion2.html'">
					고객센터
				</div>
			</div>

			<div id='account_box'>
				<%
					user_id = (String)session.getAttribute("session_userid");
					user_belong = (String)session.getAttribute("session_belong");
					try {
						if( !(user_id.equals("")) ){		//세션값에 값이 있을때
				%>
							<div class="login_item" style='color: #5f81bf'>
								<a href="mypage.jsp"><%=user_id%>님</a>
							</div>

							<div class="login_item" style='color: #5f81bf'>
								<a href="mypage.jsp">내정보</a>
							</div>

							<div class="login_item" style='color: #53575e'>
								<a href="logout.jsp">로그아웃</a>
							</div>
				<%
							if (user_belong.equals("admin")){
				%>
								<div class="console_btn" onclick="location.href='monitoring.jsp'">
									Monitor
								</div>
				<%			
							}else{
				%>
								<!-- <div class="console_btn" onclick="location.href='console.jsp'"> -->
								<div class="console_btn" onclick="alert('준비중입니다.')">
									Console
								</div>
				<%
							}
					   }
                	}catch(NullPointerException e){
                    	//e.printStackTrace();
				%>	
						<div class="login_item" style='color: #53575e'>
							<a href="login.jsp">로그인</a>
						</div>

						<div class="login_item" style='color: #5f81bf'>
							<a href="signup.jsp">회원가입</a>
						</div>

						<!-- <div class="console_btn" onclick="location.href='console.jsp'"> -->
						<div class="console_btn" onclick="alert('준비중입니다.')">
							Console
						</div>
				<%
					}
				%>

				
			</div>
		</div>
	</header>
</body>
</html>
