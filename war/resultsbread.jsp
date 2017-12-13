<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="1; url=/addbread" />
<title>Insert title here</title>
</head>
<body>
	<%
		String res = (String) request.getAttribute("styles");
		out.print(res+"\n");
	%>
	<a href="/breadPage">return</a>
</body>
</html>