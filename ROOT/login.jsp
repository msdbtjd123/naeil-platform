<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!--<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>-->
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/login.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
</head>

<body>
    <center>
    <article style='height: 760px'>

        <div id="login_contain">
            <div id="login_box">
				<div id='login_top'>
                    <div id="login_logo_box" onclick="location.href='/'">
                        <img id='login_logo_img' src='/resources/images/login/login_title.png'>
                    </div>
                </div>

                <div id='login_bottom'>
                    <form action="loginok.jsp" id='login_form' name='login_form' method="post">
                        <div class='login_input_box'>
                            <input type='text' id="userid" name="userid" placeholder="아이디를 입력해주세요">
                        </div>
                        <div class='login_input_box'>
                            <input type='password' id="password" name="password" placeholder="비밀번호를 입력해주세요">
                        </div>
                        <div id='save_id'>
                            <input type='checkbox' id='save_id_chk'>
                            <label for='save_id_chk'></label>
                            <span>아이디 저장</span>
                        </div>
						<div id='login_btn' onclick='$("#login_form").submit()'>
                            Login
                        </div>

                    </form>
                    <div>
                        <div onclick="location.href='signup.jsp'">회원가입</div>
                        <div>아이디 찾기</div>
                        <div>비밀번호 찾기</div>
                    </div>
                </div>
            </div>
            <!-- Network System Web 이거 있는 부분 끝 -->
            
        </div>
        
	<script>
		$("#password").keyup(function(event){
			console.log(event.keyCode);
   			if(event.keyCode == 13){
				login_form.submit(); //formname에 사용자가 지정한 form의 name입력
    		}
		});
	</script>

   
		<%@ include file="bottom.jsp" %>
	</article>
    </center>
</body>
</html>
