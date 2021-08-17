<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src = "/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "/resources/js/mypage.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/css/tomorrow.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
</head>

<%
    String content_s_user_id = (String)session.getAttribute("session_userid");
    String content_p_user_id = request.getParameter("user_id");
%>

<body>
    <center>
    <article>
    	<%@ include file="navbar-mypage.jsp" %> 
        <div id="big_contain">
            <div id="small_contain">
    			<%@ include file="mypage-main.jsp" %> 
            </div>
        </div>
        
   
		<!--
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
		-->
   </article>
   </center>
</body>
</html>
