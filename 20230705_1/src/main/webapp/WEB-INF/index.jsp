<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
</head>
<body>
<a href="/join"><p>회원가입 - 절대위치 - context path 누락됨. 사용 불가</p></a>
<a href="./join"><p>회원가입 - 상대위치 - 고민..불편함.</p></a>
<a href="<%=request.getContextPath() %>/join"><p>회원가입 - 권장방법</p></a>
<a href="<%=request.getContextPath() %>/login"><p>로그인 - 권장방법</p></a>
<h1><%=request.getContextPath() %></h1>
<%
	for(int i=0; i<10; i++){
%>
	<h1>Hello Dynamic Web Project</h1>
<%
	}
%>
</body>
</html>