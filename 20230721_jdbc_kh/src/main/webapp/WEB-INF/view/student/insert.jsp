<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>
<jsp:include page="/WEB-INF/view/msg/msg.jsp"></jsp:include>
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
					<th>학과명(학과번호)</th>
					<td>
					<select name="departmentNo">
						<c:forEach items="${deptList}" var="vo"> 
						<option value="${vo.departmentNo }">${vo.departmentName }</option>
						</c:forEach>
					</select>
					</td>
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
					<td>
					<input name="coachProfessorNo" list="profList">
					<datalist id="profList">
						<c:forEach items="${profList}" var="vo"> 
						<option value="${vo.professorNo }">${vo.professorName }</option>
						</c:forEach>
					</datalist>
					</td>
				</tr>
			</table>
			
			<button type="submit">학생등록</button>
		</form>
	</div>
</body>
</html>