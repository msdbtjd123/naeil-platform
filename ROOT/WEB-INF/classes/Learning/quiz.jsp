
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<!doctype html>
<html lang="ko">
<head>
	<script src = "//code.jquery.com/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--<meta http-equiv="refresh" content="1; url=https://www.naver.com/">-->
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
				<input type="button" onclick="location.href='answer_check.jsp?quiz_id=<%=quiz_id%>'" value='????????????'>
				<%

		}	
		catch(IOException ioe){
			out.println("????????? ?????? ??? ????????????.");
		}
		finally{
			try{
				reader.close();
				%>
					<input type="submit" value='????????????'>
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
	var time =5000; //???????????? ??????
	var min = ""; //???
	var sec = ""; //???

	//setInterval(??????, ??????) : ???????????? ??????
	var x = setInterval(function() {
		//parseInt() : ????????? ??????
		min = parseInt(time/60); //?????? ??????
		sec = time%60; //???????????? ??????

		document.getElementById("demo").innerHTML = min + "???" + sec + "???";
		time--;

		//???????????? ???
		if (time < 0) {
			clearInterval(x); //setInterval() ????????? ??????
			document.getElementById("demo").innerHTML = "????????????";
		}
	}, 1000);
	*/
</script>
</body>	
</html>
