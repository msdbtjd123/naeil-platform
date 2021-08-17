<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
 
<%!
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "$PASSWD";
	int check = 0;
	
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;
    PreparedStatement pstmt = null;
%>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String)session.getAttribute("session_userid");
    String license_term = (String)request.getParameter("license_term");
	String query = "select license from user_info where id='" + user_id +"'";
	int db_license = 0;

		try {
			if( !(user_id.equals("")) ){        //세션값에 값이 있을때
			}
		}catch(NullPointerException e){
			user_id = "";
			out.println("<script>alert('로그인을 먼저 해주시기 바랍니다.');location.href='login.jsp';</script>");
		}


	try {
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
		while (resultSet.next()) {
			db_license = Integer.parseInt(resultSet.getString("license"));			//capstone_db id
			if(db_license != -1){
				db_license+=Integer.parseInt(license_term);
			}else{
				db_license=Integer.parseInt(license_term);
			}
		}
			try{
				pstmt = connection.prepareStatement(
					"UPDATE user_info SET license = ? WHERE id = ?");
				pstmt.setInt(1, db_license);
				pstmt.setString(2, user_id);
				//out.print("<br>"+pstmt);
				pstmt.executeUpdate();

				check = 1;	//작업이 완료 0은 실패


			}catch(SQLSyntaxErrorException e){
				check = 0; 	//작업 실패
				e.printStackTrace();
				out.print(e);
			}
			finally{
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (connection != null) try { connection.close(); } catch(SQLException ex) {}
			}
			
			//out.print(check);
			if (check == 1){
				Process p1 = Runtime.getRuntime().exec("python3 /naeil-package/content_server_create.py "+user_id);
				out.println("<script>alert('결제가 완료되셨습니다!'); document.location.href='index.jsp' ; </script>");
			}else{
				out.println("<script>alert('결제가 실패하였습니다!'); document.location.href='index.jsp' ; </script>");
			}
	}
	catch (Exception e) {
		e.printStackTrace();
		out.print(e);
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
%>

