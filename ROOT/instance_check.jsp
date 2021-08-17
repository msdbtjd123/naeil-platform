<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.HashMap"%>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = (String)session.getAttribute("session_userid");
	String command = String.format("python3 /naeil-package/instance_check.py 1 %s",uid);  // <---- 실행할 쉘명령어

	int lineCount = 0;
	HashMap<String, String> instance_info = new HashMap<String, String>();
	String line="";

	Runtime rt = Runtime.getRuntime();
	Process ps = null;

	Gson gson = new Gson();
	JsonObject obj = new JsonObject();

	try{
		ps = rt.exec(command);
		BufferedReader br = new BufferedReader(new InputStreamReader(new SequenceInputStream(ps.getInputStream(), ps.getErrorStream())));

			while((line = br.readLine()) != null){
				obj.addProperty((String)line.split(" ")[0], (String)line.split(" ")[1]);
			}
		br.close();
	}
	catch(IOException ie){ie.printStackTrace();}
	catch(Exception e){e.printStackTrace();}
	
	out.print(gson.toJson(obj));
%>

