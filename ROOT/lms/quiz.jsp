
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!doctype html>
<html lang="ko">
<head>
    <script src = "/resources/js/jquery-3.6.0.min.js"></script>
	<script src = "/resources/js/quiz.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap 4</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/lms.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
</head>
<body>
<%
	String quiz_n = request.getParameter("n");
	String quiz_id = request.getParameter("quiz_id");
	String quiz_path = "/resources/quiz/"+quiz_id+"/"+quiz_n+".txt";
	int i_quiz_n = Integer.parseInt(quiz_n);
	i_quiz_n++;
	String s_temp = "";

	try{
		String answer_list = (String)session.getAttribute("s_answer_list");
		String[] answer = request.getParameterValues("answer");	

		for(int i=0; i<answer.length; i++)
		{		
			s_temp = answer_list + "," + answer[i];
			session.setAttribute("s_answer_list", s_temp);	
%>			
			<!-- <script>console.log("값:<%=s_temp%>");</script> -->
<%
		}
	}
	catch(Exception e2){
		e2.printStackTrace();

	}

%>
	<div class="quiz_box">
	<form action="quiz.jsp?quiz_id=<%=quiz_id%>&n=<%=i_quiz_n%>" method="post">
<%
		BufferedReader reader = null;
		try {
			String file_path = application.getRealPath(quiz_path);
			reader = new BufferedReader(new FileReader(file_path));
			int temp = 1;
			while(true){
				String str = reader.readLine();
				if(str == null){break;}
				else if(temp == 1){
					%>
						<p><strong><%=quiz_n%>. <%=str%> </strong></p>
						<%
				}
				else{
					%>
						<div class="custom-control custom-radio">
						<input type="radio" name="answer" id="n<%=temp-1%>" class="custom-control-input" value="<%=temp-1%>">
						<label class="custom-control-label" for="n<%=temp-1%>"><%=str%> </label>
						</div>	
						<%
				}
				temp++;
			}
		}
		catch(FileNotFoundException fnfe){
			%>
				<input type="button" onclick="location.href='answer_check.jsp?quiz_id=<%=quiz_id%>'" value='제출하기'>
				<%

		}	
		catch(IOException ioe){
			out.println("파일을 읽을 수 없습니다.");
		}
		finally{
			try{
				reader.close();
				%>
					<input type="submit" id='next_button' value='다음문제' disabled="true">
					<%

			}
			catch(Exception e){
			}
		}
%>
	</form>
	</div>
<script>
	/*
	var time =5000; //기준시간 작성
	var min = ""; //분
	var sec = ""; //초

	//setInterval(함수, 시간) : 주기적인 실행
	var x = setInterval(function() {
		//parseInt() : 정수를 반환
		min = parseInt(time/60); //몫을 계산
		sec = time%60; //나머지를 계산

		document.getElementById("demo").innerHTML = min + "분" + sec + "초";
		time--;

		//타임아웃 시
		if (time < 0) {
			clearInterval(x); //setInterval() 실행을 끝냄
			document.getElementById("demo").innerHTML = "시간초과";
		}
	}, 1000);
	*/
</script>
</body>	
</html>
