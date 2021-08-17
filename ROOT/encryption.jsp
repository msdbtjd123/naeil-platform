<%@ page contentType="text/html; charset=utf-8"%>

<%@ page import="Encryption.*" %>
<jsp:useBean id="Salt" class="Encryption.Salt" scope="page" />
<jsp:useBean id="Plain" class="Encryption.Convert" scope="page" />

<%
	String salt = Salt.getSalt();
	String pw = "abc";
	String cryptogram = Plain.getHash(salt, pw);
	out.print(salt + "<br>");
	out.print(pw + "<br>");
	out.print(cryptogram);
%>
