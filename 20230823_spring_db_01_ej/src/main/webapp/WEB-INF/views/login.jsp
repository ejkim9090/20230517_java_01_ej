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
			<!-- Spring Security 4 적용시 post 방식에서 (form, ajax 적용해야함)
				csrf 공격을 막기위해서 hiddent 태그로 보내줌. token 값 전달해야 403오류 발생안함. -->
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		</form>
	</div>
</div>
</body>
</html>