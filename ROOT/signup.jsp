<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/index.js"></script>
    <script src = "/resources/js/signup.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
	<!--
	<script type="text/javascript" src="/resources/js/additional-methods.min.js"></script>
	<script type="text/javascript" src="/resources/js/messages_ko.min.js"></script>
	-->
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
</head>

<body>
    <center>
    <article style='height: 760px'>
        <div id="login_contain" style="height:86vh;">
            <div id="login_box" style="height:70%;">
				<div id='login_top'>
                    <div id="login_logo_box" onclick="location.href='/'">
                        <img id='login_logo_img' style="height: 50px; margin-top: 8px;" src='/resources/images/login/login_title.png'>
                    </div>
                </div>

                <div id='login_bottom'>
                    <form action="signok.jsp" id='sign_form' style="padding: 3% 1% 1% 1%;height:60%;"name='sign_form' method="post">
						<div class="signup_main_title">회원가입</div><br>
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='text' id="signup_id" name="signup_id" placeholder="새로운 아이디를 입력해주세요" required>
                        </div>
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='password' id="signup_pw" name="signup_pw" placeholder="새로운 비밀번호를 입력해주세요" required>
                        </div>
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='password' id="signup_pw_check" name="signup_pw_check" placeholder="다시한번 비밀번호를 입력해주세요" required>
                        </div>
                        <div class='sign_select_box' >
							<select class="sign_select" name="signup_belong" required>
								<option value="" selected disabled hidden >전공을 선택해주세요.</option>
								<option value="digital security">디지털보안</option>
								<option value="ai">인공지능소프트웨어</option>
								<option value="bigdata">빅데이터</option>
							</select>	
                        </div>
						<div id='login_btn' style="bottom: -1%;transform: translate(-50px, -60px);" onclick='$("#sign_form").submit()'>
                            SignUp
                        </div>
                    </form>
                </div>
            </div>
        </div>
		<%@ include file="bottom.jsp" %>
	</article>
    </center>
</body>
</html>
