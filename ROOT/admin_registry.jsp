<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>

<%@ page import="Encryption.*" %>
<jsp:useBean id="Salt" class="Encryption.Salt" scope="page" />

<%
	request.setCharacterEncoding("UTF-8");
	Connection connection = null;
	PreparedStatement pstmt = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "Capstone!2#";

	String userid = (String)session.getAttribute("session_userid");
	String belong = request.getParameter("belong");
	String admin_code = Salt.getSalt();

	//out.print(userid+"<br>"+belong+"<br>"+admin_code);

	try{
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		pstmt = connection.prepareStatement(
				"UPDATE user_info SET belong = ?,admin_code = ? WHERE id = ?");
		pstmt.setString(1, belong);
		pstmt.setString(2, admin_code);
		pstmt.setString(3, userid);
		pstmt.executeUpdate();

	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}
	session.setAttribute("session_belong", belong);
%>
