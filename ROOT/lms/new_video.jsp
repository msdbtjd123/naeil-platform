<%@ page contentType="text/html; charset=utf-8"%>
<%@ page language="java" import= "java.io.*, java.util.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
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
        Statement statement2;
        ResultSet resultSet2;

        String driver = "org.mariadb.jdbc.Driver";
        String url = "jdbc:mariadb://localhost:3306/capstone_db";
        String uid = "capstone_admin";
        String upw = "Capstone!2#";
        String query = "select * from video_info";
        String query2 = "";
		String session_userid = "";
	%>
	<%
		session_userid = (String)session.getAttribute("session_userid");
		
		try{
			if((session_userid.equals(""))){
				out.println("<script>alert('로그인 후 사용가능 합니다.'); document.location.href='lms.jsp' ; </script>");
			}
		}
		catch(NullPointerException e){
			out.println("<script>alert('로그인 후 사용가능 합니다.'); document.location.href='lms.jsp' ; </script>");
			e.printStackTrace();
		}
	%>


<center>
    <article>
        <%@ include file="navbar1.jsp" %>

        <div id="big_contain">
            <%@ include file="navbar2.jsp" %>
            <div id="small_contain">
                <%@ include file="navbar3.jsp" %>
                <div id="detail_box">
					<div id="big_video_list_box">
						<%
						try{
							Class.forName(driver);
							connection = DriverManager.getConnection(url, uid, upw);
							statement = connection.createStatement();
							resultSet = statement.executeQuery(query);

							while(resultSet.next()){
								String video_id = resultSet.getString("video_id");
								String name = resultSet.getString("video_name");
								
								query2 = String.format("select %s from quiz_result where user_id = \"%s\"",video_id,session_userid);
								%><script>console.log('<%=query2%>');</script><%
								statement2 = connection.createStatement();
								resultSet2 = statement2.executeQuery(query2);
								String quiz_result = "";


								while(resultSet2.next()){
									quiz_result = resultSet2.getString(video_id);
								}
						%>
								<div id="small_video_box" >
				              		<div style="text-align:center;">
										<ul>
											<li><%=name%></li>
											<li id="boundary">｜</li>
											<li>문제풀이 점수: <%=quiz_result%></li>
										</ul>
									</div>
									<div id ="logout_btn" class="play_btn" style="color: #276EBC;" onclick="location.href='new_play_video.jsp?id=<%=video_id%>&v_name=<%=name%>'">
										영상 보기
									</div>
		        	                <div id ="login_btn" class="play_btn" style="color: #276EBC;" onclick="location.href='quiz.jsp?quiz_id=<%=video_id%>&n=1'">
									<%session.setAttribute("quiz_n", "1");%>
										문제 풀이
	                    	    	</div>
		                		</div>
						<%
							}
						}catch(Exception e){
							%><script>console.log("<%=e%>");</script><%
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
				</div>
            	<%@ include file="footer.jsp" %>
            </div>
        </div>
   </article>
   </center>
</body>
</html>
