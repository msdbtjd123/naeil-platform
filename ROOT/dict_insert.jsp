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
                        <img id='login_logo_img' style="height: 50px; margin-top: 8px;" src='/resources/images/로그인/login_title.png'>
                    </div>
                </div>

                <div id='login_bottom'>
                    <form action="dict_insertok.jsp" id='sign_form' style="padding: 3% 1% 1% 1%;height:60%;"name='sign_form' method="post">
						<div class="signup_main_title">내용 입력</div><br>
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='text' id="id" name="id" placeholder="고유번호 입력(ex:N001)" required>
                        </div>
                        <div class='sign_select_box' >
							<select class="sign_select" name="type" required>
								<option value="" selected disabled hidden >타입을 선택해주세요.</option>
								<option value="network">네트워크</option>
								<option value="system">시스템</option>
								<option value="web">웹</option>
							</select>	
                        </div>
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='text' id="title" name="title" placeholder="제목입력" required>
                        </div>
						<!--
                        <div class='login_input_box' style="margin-bottom:7%;">
                            <input type='text' id="content" name="content" placeholder="내용입력" required>
                        </div>
						-->
						<div id='login_btn' style="bottom: -1%;transform: translate(-50px, -60px);" onclick='$("#sign_form").submit()'>
                            Insert
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
