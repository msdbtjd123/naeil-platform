<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = (String)session.getAttribute("session_userid");
	String attack_name = request.getParameter("content_attack");
	String type = request.getParameter("type");
	String role = request.getParameter("role");
	
	String line = "";
	String url = "";

	Runtime rt = Runtime.getRuntime();
	Process ps = null;
	String command = String.format("python3 /naeil-package/vnc_url.py %s %s %s %s", type, user_id, attack_name, role);  // <---- 실행할 쉘명령어

	try{
		ps = rt.exec(command);
		BufferedReader br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream())));

			while((line = br.readLine()) != null){
				url=line;
			}
		br.close();
	}
	catch(IOException ie){ie.printStackTrace();}
	catch(Exception e){e.printStackTrace();}

	Gson gson = new Gson();
	JsonObject obj = new JsonObject();

	obj.addProperty("url", url);
	out.print(gson.toJson(obj));
%>

