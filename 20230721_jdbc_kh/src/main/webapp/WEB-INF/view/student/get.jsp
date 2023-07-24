<%@page import="kh.test.jdbckh.student.model.vo.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 정보</title>
</head>
<body>
	<h1>학생 상세 정보</h1>
	<%-- <%= request.getAttribute("svo") %> --%>
	<%
	StudentVo vo = null;
	if(request.getAttribute("svo") instanceof StudentVo){
		vo = (StudentVo)request.getAttribute("svo");
	}
	%>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><%=vo.getStudentName() %></td>
		</tr>
		<tr>
			<td>소속학과번호</td>
			<td><%=vo.getDepartmentNo() %></td>
		</tr>
		<tr>
			<td>소속학과이름</td>
			<td><%=vo.getDepartmentName() %></td>
		</tr>
	</table>
	
</body>
</html>