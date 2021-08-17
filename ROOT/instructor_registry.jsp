<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	Connection connection = null;
	PreparedStatement pstmt = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "Capstone!2#";

	String userid = (String)session.getAttribute("session_userid");
	String admin_code = request.getParameter("instructor_code");
	String db_admin_id = "";

	try{
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		pstmt = connection.prepareStatement(
				"UPDATE user_info SET admin_code = ? WHERE id = ?");
		pstmt.setString(1, admin_code);
		pstmt.setString(2, userid);
		pstmt.executeUpdate();

	}finally{
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}
	}





	Class.forName(driver);
	connection = DriverManager.getConnection(url, uid, upw);
	Statement statement = null;
	statement = connection.createStatement();
	ResultSet resultSet = null;

	try{
		String query = "SELECT id FROM user_info WHERE belong='admin' AND admin_code = '" + admin_code +"'";
		resultSet = statement.executeQuery(query);

		while (resultSet.next()) {
			db_admin_id = resultSet.getString("id");
		}
	}
	catch (Exception e) {
		e.printStackTrace();
	} finally { //모든 자원 해제
		try {
			if (resultSet != null)
		resultSet.close();
			if (statement != null)
		statement.close();
			if (connection != null)
		connection.close();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	
	session.setAttribute("session_admin_code", admin_code);
	session.setAttribute("session_my_admin_id", db_admin_id);
	out.println("<script>alert('완료되셨습니다.'); document.location.href='mypage.jsp' ; </script>");
%>
