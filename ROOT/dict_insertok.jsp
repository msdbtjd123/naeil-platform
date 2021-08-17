<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
 
<%!
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "$PASSWD";
	
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;
    PreparedStatement pstmt = null;
%>
<%
	request.setCharacterEncoding("utf-8");

	String db_id = "";
	String id = request.getParameter("id");
    String type = request.getParameter("type");
    String title = request.getParameter("title");
	String query = "select id from dict where id='" + id +"'";

	try {
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		while (resultSet.next()) {
			db_id = resultSet.getString("id");			//capstone_db id
		}
		/*out.print("query값: "+query+"<br>");
		out.print("page id값: "+id+"<br>");
		out.print("db id값: "+db_id+"<br>");
		out.print("값: "+db_id.equals(""));
		*/
		if(db_id.equals("")){
			try{
				pstmt = connection.prepareStatement(
						"INSERT INTO dict(id, type, title, content_path) VALUES (?, ?, ?, ?)");
				pstmt.setString(1, id);
				pstmt.setString(2, type);
				pstmt.setString(3, title);
				pstmt.setString(4, "resources/dict/"+id+"/");
				pstmt.executeUpdate();
				/*
				pstmt = connection.prepareStatement(
						"INSERT INTO video_time(user_id) VALUES (?)");
				pstmt.setString(1, signup_id);
				pstmt.executeUpdate();

				pstmt = connection.prepareStatement(
						"INSERT INTO quiz_result(user_id) VALUES (?)");
				pstmt.setString(1, signup_id);
				pstmt.executeUpdate();
				*/
			}catch(SQLSyntaxErrorException e){
				e.printStackTrace();
				out.print("60: "+e);
			}
			finally{
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (connection != null) try { connection.close(); } catch(SQLException ex) {}
			}
			//out.println("<script>alert('입력완료'); document.location.href='index.jsp' ; </script>");
			out.println("<script>alert('입력완료'); </script>");
		}
		else{ 
			out.println("<script>alert('중복된 고유번호 입니다.'); history.back();</script>");
		}
	}
	catch (Exception e) {
		e.printStackTrace();
		out.print("74: "+e);
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
			out.print("85: "+e2);
		}
	}
	response.sendRedirect("dict.jsp");
%>
