<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>


<html>
	<head>
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
		
		%>
		
		<div class="row">
			<div class="container">
				<div class="col-md">
				<% 
				String productid = "";
				String id = request.getParameter("id");
				String query = "select * from video_info where video_id='"+id+"'";
				try{
					Class.forName(driver);
					connection = DriverManager.getConnection(url, uid, upw);
					statement = connection.createStatement();
					resultSet = statement.executeQuery(query);

					while(resultSet.next()){
						session.setAttribute("id", id);
						productid = resultSet.getString("video_id");
						String name = resultSet.getString("video_name");
						String file_path = resultSet.getString("file_path");
				%>
				</div>
			</div>
		</div>
		<br><br>
		<%
		String currentTime = "";
		query = "select"+ id +" from video_time where user_id = '"+ (String)session.getAttribute("session_userid") +"'";

		resultSet = statement.executeQuery(query);

		while (resultSet.next()) {
			currentTime = resultSet.getString(id);
		}


				%>
		<div id="myDIV" >
			<video
				id="vid"
  				src="<%=file_path%>#t<%=currentTime%>"
 				width="640px"
  				height="360px"
  				controls
			></video>
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
	</body>
</html>
