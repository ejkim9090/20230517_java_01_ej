<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div>
	<div>
		<h2>로그인</h2>
		<form action="<%=request.getContextPath() %>/login" method="post">
			id: <input type="text" name="username" required="required"><br>
			pw: <input type="password" name="password" required="required"><br>
			<button type="submit">로그인</button>
		</form>
	</div>
</div>
</body>
</html>