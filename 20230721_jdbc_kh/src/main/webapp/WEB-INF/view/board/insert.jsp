<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 등록</title>
</head>
<body>
	<h2>새 글 등록</h2>
	<div>
		<form action="<%=request.getContextPath() %>/board/insert" method="post">
		
			<button type="submit">글 등록</button>
		</form>
	</div>
</body>
</html>