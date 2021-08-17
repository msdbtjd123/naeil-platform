<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.io.*"%>

<%!
	Connection connection = null;
	Statement statement;
	ResultSet resultSet;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "Capstone!2#";
%>

<%
	request.setCharacterEncoding("UTF-8");
	String cid = request.getParameter("cid");
	//String cid = "N001";
	String query = "select * from dict where id='" + cid +"'";
	String db_id = "";
	String db_type = "";
	String db_title = "";
	String db_content_path = "";
	String content = "";
	
	try {
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);
	
		while (resultSet.next()) {
			db_type = resultSet.getString("type");		
			db_title = resultSet.getString("title");	
			db_content_path = resultSet.getString("content_path");	
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

	BufferedReader reader = null;
	try {
		String file_path = application.getRealPath(db_content_path+"content.txt");
		reader = new BufferedReader(new FileReader(file_path));
		while(true){
			String str = reader.readLine();
			if(str == null){break;}
			else {
				content+=str+"<br>";
			}
		}
	}
	catch(FileNotFoundException fnfe){
		out.print(fnfe);
	}	
	catch(IOException ioe){
		out.println("파일을 읽을 수 없습니다.");
	}
	/*
	out.print("<br>"+db_type+"<br>");
	out.print(db_title+"<br>");
	out.print(db_content_path+"<br>");
	out.print(content);
	*/
	Gson gson = new Gson();
	JsonObject obj = new JsonObject();

	obj.addProperty("type", db_type);
	obj.addProperty("title", db_title);
	obj.addProperty("content", content);
	out.print(gson.toJson(obj));
%>

