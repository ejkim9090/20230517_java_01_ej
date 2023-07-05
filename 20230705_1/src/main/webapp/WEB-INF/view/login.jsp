<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h1>로그인</h1>
	<div>
		<form action="<%=request.getContextPath() %>/login" method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="mpwd"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>