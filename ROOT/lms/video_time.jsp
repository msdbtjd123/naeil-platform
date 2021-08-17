<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		
	request.setCharacterEncoding("UTF-8");
	Connection connection = null;
	PreparedStatement pstmt = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/lms_db";
	String uid = "lms_admin";
	String upw = "capstone!23";

	String userid = (String)session.getAttribute("session_userid");
	String currentTime = request.getParameter("currentTime");
	String play_video_id = request.getParameter("play_video_id");
	//String play_video_id = (String)session.getAttribute("play_video_id");
	
	try{
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		pstmt = connection.prepareStatement(
				"UPDATE video_time SET "+ play_video_id +" = ? WHERE user_id = ?");
		pstmt.setString(1, currentTime);
		pstmt.setString(2, userid);
		//System.out.println(pstmt);
		pstmt.executeUpdate();

	}finally{
		currentTime="0";
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}
	%>


</body>
</html>
