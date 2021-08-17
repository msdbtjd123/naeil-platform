<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList"%>


<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<script src = "/resources/js/jquery-3.6.0.min.js"></script>
		<script src = "/resources/js/lms.js"></script>
		<link rel="stylesheet" type="text/css" href="/resources/css/lms.css">
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	</head>
	<body>
		<%!
		Connection connection = null;
		Statement statement;
		ResultSet resultSet;

		String driver = "org.mariadb.jdbc.Driver";
		String url = "jdbc:mariadb://localhost:3306/capstone_db";
		String uid = "capstone_admin";
		String upw = "Capstone!2#";
		
		%>
		<div id="play_video_box">
			<% 
			String id = request.getParameter("id");
			//session.setAttribute("play_video_id", id); 
			String name = request.getParameter("v_name");
			%>

			<div id="small_video_box" style="margin:0 auto; width:100%; text-align:center; background-color:#1f1f1f; border: none; height: 40px;">
				<span><%=name%></span>
				<div class="play_xbox">
					<a href="new_video.jsp">X</a>
				</div>
			</div>

		<%
			String query = "select * from video_info where video_id='"+id+"'";
			try{
				Class.forName(driver);
				connection = DriverManager.getConnection(url, uid, upw);
				statement = connection.createStatement();
				resultSet = statement.executeQuery(query);

				while(resultSet.next()){
					String file_path = resultSet.getString("file_path");
					String currentTime = "";
					/*
					query = "select "+ id +" from video_time where user_id = '"+ (String)session.getAttribute("session_userid") +"'";
					out.print(query);

					resultSet = statement.executeQuery(query);

					while (resultSet.next()) {
						currentTime = resultSet.getString(id);
					}
					*/
					%>
						<script>setTimeout(setInterval(function(){show_time('<%=id%>');}, 2000), 2000);</script>
						<div id="myDIV" style="margin: 60px 40px 60px 40px;">
							<video
								id="vid"
								src="<%=file_path%>.mp4"
								width="100%"
								controls>
							</video>
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
