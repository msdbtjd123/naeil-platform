<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src = "/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="./resources/js/server_check.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
</head>

<%
	try {
		if( !(user_id.equals("")) ){		//세션값에 값이 있을때
%>
		<script>
			setTimeout(setInterval(function(){
				server_check('<%=user_id%>');
			}, 1000), 3000);
		</script>
<%
		}
	}catch(NullPointerException e){
		user_id = "";
        out.println("<script>alert('로그인을 먼저 해주시기 바랍니다.');location.href='login.jsp';</script>");
	}
%>

<body>
    <center>
    <article>
    	<%@ include file="navbar.jsp" %> 
        <div id="big_contain">
    		<%@ include file="train-navbar1.jsp" %> 
    		<%@ include file="train-navbar2.jsp" %> 
            <div id="small_contain">
    			<%@ include file="train-main.jsp" %> 
            </div>
        </div>
        
   
        <footer>
            <div class='footer_tab_box'>
                <div class='footer_tab'>ⓒ 내일 Coporation</div>
                <div class='footer_tab'>도움말</div>
                <div class='footer_tab'>이용약관</div>
                <div class='footer_tab'>개인정보 처리방침</div>

                <img src='/resources/images/top_bottom/facebook.png'>
                <img src='/resources/images/top_bottom/youtube.png'>
            </div>
        </footer>
   </article>
   </center>
</body>
</html>
