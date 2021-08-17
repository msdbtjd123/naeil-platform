<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>



<%
	String answer_list = (String)session.getAttribute("s_answer_list");
	String[] submit_answer = answer_list.split(",");
	List<String> list = new ArrayList<>(Arrays.asList(submit_answer));
	list.remove("null");
	submit_answer = list.toArray(new String[list.size()]);

	String quiz_id = request.getParameter("quiz_id");
	String quiz_path = "/resources/quiz/"+quiz_id+"/answer.txt";
	String[] answer_check = new String[5]; 
	String temp = "";
	int check = 0;

	BufferedReader reader = null;
	try {
		String file_path = application.getRealPath(quiz_path);
		reader = new BufferedReader(new FileReader(file_path));
		while(true){
			String str = reader.readLine();
			if(str == null){break;}
			else{temp=str;}
		}
	}
	catch(FileNotFoundException fnfe){
		out.println("파일이 존재하지 않습니다.");

	}
	catch(IOException ioe){
		out.println("파일을 읽을 수 없습니다.");
	}
	finally{
		try{
			reader.close();
		}
		catch(Exception e){
		}
	}

	answer_check=temp.split(",");

	for (int i = 0; i<5; i++){
		if(answer_check[i].equals(submit_answer[i])){
			check++;
		}
	}
	request.setCharacterEncoding("UTF-8");
	Connection connection = null;
	PreparedStatement pstmt = null;

	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/capstone_db";
	String uid = "capstone_admin";
	String upw = "$PASSWD";

	String userid = (String)session.getAttribute("session_userid");

	try{
		Class.forName(driver);
		connection = DriverManager.getConnection(url, uid, upw);
		pstmt = connection.prepareStatement(
				"UPDATE quiz_result SET "+ quiz_id +" = ? WHERE user_id = ?");
		pstmt.setString(1, check+"0");
		pstmt.setString(2, userid);
		pstmt.executeUpdate();

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (connection != null) try { connection.close(); } catch(SQLException ex) {}

	session.removeAttribute("s_answer_list");
	}
%>
<script>alert("최종점수는:<%=check%>0/50점 입니다.")</script> 
