<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%@ page import="Encryption.*" %>
<jsp:useBean id="Salt" class="Encryption.Salt" scope="page" />
<jsp:useBean id="Plain" class="Encryption.Convert" scope="page" />
 
<%!
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "Capstone!2#";
	
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;
    PreparedStatement pstmt = null;
%>
<%
	request.setCharacterEncoding("utf-8");
	String db_id = "";
	String signup_id = request.getParameter("signup_id");
	String signup_pw = request.getParameter("signup_pw");
	String signup_pw_check = request.getParameter("signup_pw_check");

	if (!signup_pw.equals(signup_pw_check)){
        out.println("<script>alert('동일한 패스워드를 입력해주세요.'); history.back();</script>");
    }
	
	else {

		String signup_salt = Salt.getSalt();
		signup_pw = Plain.getHash(signup_salt, signup_pw);

		String signup_belong = request.getParameter("signup_belong");
		String query = "select id from user_info where id='" + signup_id +"'";
		//out.print(query);

		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, uid, upw);
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				db_id = resultSet.getString("id");			//capstone_db id
			}
			//out.print("값: "+db_id);
			//out.print("값: "+db_id.equals(""));
			if(db_id.equals("")){
				try{
			        pstmt = connection.prepareStatement(
			                "INSERT INTO user_info(id, salt, password, belong) VALUES (?, ?, ?, ?)");
			        pstmt.setString(1, signup_id);
			        pstmt.setString(2, signup_salt);
			        pstmt.setString(3, signup_pw);
			        pstmt.setString(4, signup_belong);
			        pstmt.executeUpdate();

			        pstmt = connection.prepareStatement(
			                "INSERT INTO quiz_result(user_id) VALUES (?)");
			        pstmt.setString(1, signup_id);
			        pstmt.executeUpdate();

				}catch(SQLSyntaxErrorException e){
					out.print("<script>console.log("+e+")</script>");
					e.printStackTrace();
		   	 	}
				finally{
		  	    	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		   	 	}
				out.println("<script>alert('회원가입이 완료되셨습니다!'); document.location.href='index.jsp' ; </script>");
			}
			else{ 
	 			out.println("<script>alert('중복된 아이디 입니다.'); history.back();</script>");
			}
		}
		catch (Exception e) {
			out.print("<script>console.log("+e+")</script>");
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
	}
%>

