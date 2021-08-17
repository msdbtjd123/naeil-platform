<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>

<html>
<head>
<title>Movie List</title>
</head>
<body>

	<%!
	    Connection connection = null;
  		Statement statement;
	    ResultSet resultSet;
	   
		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/lms_db";
		String uid = "lms_admin";
	    String upw = "capstone!23";
	    String query = "select * from video_info";
	%>
	
	<div >
		<div>
		
		<%
			
	        try{
	            Class.forName(driver);
	            connection = DriverManager.getConnection(url, uid, upw);
	            statement = connection.createStatement();
	            resultSet = statement.executeQuery(query);
	 
	            while(resultSet.next()){
	                String video_id = resultSet.getString("video_id");
	                String name = resultSet.getString("video_name");
	    %>
	                <div>
						<h3><%=name%></h3>
						<p> <a href="play_video.jsp?id=<%=video_id%>" role="button">온라인 학습 &raquo;></a> 
					</div>
	     <%		
	            }
	            
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{ //모든 자원 해제
	            try{
	                if(resultSet != null) resultSet.close();
	                if(statement != null) statement.close();
	                if(connection != null) connection.close();
	            }catch(Exception e2){
	                e2.printStackTrace();
	            }
	        }
    	%>
		</div>
</body>
</html>
