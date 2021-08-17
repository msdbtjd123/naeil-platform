<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="ko">
<head>
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
    <script src = "/resources/js/quiz.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<%
	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("quiz_id");
    String query = "select * from quiz where id LIKE '" + id +"-_'";
    String [] db_question = new String[3];
    String [] db_answer_list = new String[3];
    String [] db_answer = new String[3];
	out.print(query);

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, uid, upw);
        statement = connection.createStatement();
        resultSet = statement.executeQuery(query);

		int i = 0;
        while (resultSet.next()) {
            db_question[i] = resultSet.getString("question");
            db_answer_list[i] = resultSet.getString("answer_list");
            db_answer[i] = resultSet.getString("answer");
			i++;
			
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


	for (int j=0; j<3; j++){
		out.print("<br><br>");
		out.print("db_question:" + db_question[j] + "<br>db_answer_list: " + db_answer_list[j].replace("<br>","@@") + "<br>db_answer: " + db_answer[j]);
	}
	out.print("<br><br>");
	out.print("<br><br>");

	int j=0;
%>
	<div class="quiz_box">
		<p><strong>Question</strong></p>	
		<div class="custom-control custom-radio">
			<input type="radio" name="answer" id="<%=j+1%>" class="custom-control-input" value="<%=j+1%>" onclick="var temp1 = 1;console.log(temp1);">
			<label class="custom-control-label" for="<%=j+1%>">123</label><br>
			<input type="radio" name="answer" id="<%=j+1%>" class="custom-control-input" value="<%=j+1%>" onclick="console.log('gd')">
			<label class="custom-control-label" for="<%=j+1%>">123</label><br>
			<input type="radio" name="answer" id="<%=j+1%>" class="custom-control-input" value="<%=j+1%>" onclick="console.log('gd')">
			<label class="custom-control-label" for="<%=j+1%>">123</label><br>
			<input type="radio" name="answer" id="<%=j+1%>" class="custom-control-input" value="<%=j+1%>" onclick="console.log('gd')">
			<label class="custom-control-label" for="<%=j+1%>">123</label><br>
		</div>
		<input type="button" value='다음문제' id='next_test'>
	</div>
</body>
</html>
