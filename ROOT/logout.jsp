<%@ page contentType="text/html; charset=utf-8"%>

<%
	session.invalidate();
	out.println("<script>alert('로그아웃되었습니다'); document.location.href='index.jsp'</script>");
%>

