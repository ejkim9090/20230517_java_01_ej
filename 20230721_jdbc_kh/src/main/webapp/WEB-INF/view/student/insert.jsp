<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>
</head>
<body>
	<h2>학생 등록</h2>
	<div class="container">
		<form action="<%=request.getContextPath() %>/student/insert.do" method="post">
			<table>			
				<tr>
					<th>학생 번호</th>
					<td><input type="text" name="studentNo"></td>
				</tr>
				<tr>
					<th>departmentNo</th>
					<td><input type="text" name="departmentNo"></td>
				</tr>
				<tr>
					<th>studentName</th>
					<td><input type="text" name="studentName"></td>
				</tr>
				<tr>
					<th>studentSsn</th>
					<td><input type="text" name="studentSsn"></td>
				</tr>
				<tr>
					<th>studentAddress</th>
					<td><input type="text" name="studentAddress"></td>
				</tr>
				<tr>
					<th>entranceDate yyyy-mm-dd</th>
					<td><input type="text" name="entranceDate"></td>
				</tr>
				<tr>
					<td>absenceYn</td>
					<td><input type="text" name="absenceYn"></td>
				</tr>
				<tr>
					<td>coachProfessorNo</td>
					<td><input type="text" name="coachProfessorNo"></td>
				</tr>
			</table>
			
			<button type="submit">학생등록</button>
		</form>
	</div>
</body>
</html>