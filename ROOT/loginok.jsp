<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%@ page import="Encryption.*" %>
<jsp:useBean id="Plain" class="Encryption.Convert" scope="page" />

<%!
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "$PASSWD";
%>

<%
	request.setCharacterEncoding("UTF-8");
	String page_userid = request.getParameter("userid");	//login.jsp userid
	String page_passwd = request.getParameter("password");	//login.jsp userpw
	String query = "select * from user_info where id='" + page_userid +"'";
	String db_userid = "";
	String db_salt = "";
	String db_passwd = "";
	String db_belong = "";
	String db_admin_code = "";
	String db_admin_id = "";
	int db_license = -1;
	
	try {
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
	
		while (resultSet.next()) {
			db_userid = resultSet.getString("id");		//db userid
			db_salt = resultSet.getString("salt");		//db salt
			db_passwd = resultSet.getString("password");		//db userpw
			db_belong = resultSet.getString("belong");		//db belong
			db_admin_code = resultSet.getString("admin_code");		//db admin_code
			db_license = resultSet.getInt("license");		//db license
		}

		query = "SELECT id FROM user_info WHERE belong='admin' AND admin_code = '" + db_admin_code +"'";
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
    //out.print(String.format("page_userid: %s<br>page_passwd: %s<br> query: %s<br> db_userid: %s <br>db_passwd: %s<br> db_belong: %s",page_userid,page_passwd,query,db_userid,db_passwd,db_belong));

	page_passwd = Plain.getHash(db_salt, page_passwd);

	//out.print("<br><br>convert passwd : "+page_passwd);

    if((page_userid.equals(db_userid)) && (page_passwd.equals(db_passwd))){
    	session.setAttribute("session_userid", page_userid);
    	session.setAttribute("session_belong", db_belong);
    	session.setAttribute("session_admin_code", db_admin_code);
    	session.setAttribute("session_license", db_license);
		session.setAttribute("session_my_admin_id", db_admin_id);
		response.sendRedirect("index.jsp");

		//out.println("<script>alert('ok');</script>");
	} else {
		out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); history.back();</script>");
		//out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');</script>");
	}
    
%>

