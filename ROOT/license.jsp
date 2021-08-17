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
	<!--<script type="text/javascript" src="/resources/js/jquery.validate.min.js"></script>-->
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/license.css">
</head>

<%
	String user_id = (String)session.getAttribute("session_userid");
	try {
		if( !(user_id.equals("")) ){		//세션값에 값이 있을때
			;
		}
	}catch(NullPointerException e){
		user_id = "";
        out.println("<script>alert('로그인을 먼저 해주시기 바랍니다.');location.href='login.jsp';</script>");
	}
%>
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
                    <form action="payment.jsp" id='login_form' name='payment_form' method="post">
                        <div class='login_input_box'>
                            <input type='text' id="bank_account_number" name="bank_account_number" placeholder="계좌번호를 입력해주세요. ('-' 제외)">
                        </div>

                        <div class='login_input_box'>
                            <input type='password' id="bank_password" name="bank_password" placeholder="비밀번호 앞 2자리만 입력해주세요">
                        </div>

                        <div class='login_input_box card_expire_date'>
                            <input type='text' id="month" name="month" placeholder="월">
                        </div>
                        <div class='login_input_box card_expire_date'>
                            <input type='text' id="year" name="year" placeholder="년">
                        </div>
                        <div class='login_input_box'>
                            <input type='text' id="birthday" name="birthday" placeholder="생년월일 ex) 19970531">
                        </div>
                        <div class='login_input_box'>
                            <input type='text' id="license_term" name="license_term" placeholder="30일 단위로 입력해주세요. ex)30,60,90,120">
                        </div>
                        <div class='payment_amount'>
							최종 결제금액: $money
                        </div>
						<div id='login_btn' onclick='$("#login_form").submit()'>
                            Payment
                        </div>

                    </form>
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
