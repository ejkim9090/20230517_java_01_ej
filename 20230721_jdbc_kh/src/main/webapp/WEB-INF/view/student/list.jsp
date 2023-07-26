<%@page import="kh.test.jdbckh.student.model.vo.StudentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 리스트</title>
</head>
<body>
	<h2>학생 리스트</h2>
	<div><a href="<%=request.getContextPath() %>/student/insert">학생등록</a></div>
	<div>
		<form action="<%=request.getContextPath() %>/student/list" method="get">
			<input type="search" name="searchWord">
			<input type="submit" value="찾기">
		</form>
	</div>
	 
<%
// JSP Tag - java문법
List<StudentVo> volist = (List<StudentVo>)request.getAttribute("studentList");
String searchWord = (String)request.getAttribute("searchWord");
if(searchWord != null){
%>
		<h3><%=searchWord %> 검색결과</h3>
		<h5><a href="<%=request.getContextPath() %>/student/list">전체보기</a></h5>
<%
}
if(volist == null || volist.size() == 0) {
//if(volist == null) {
//if (volist.size() == 0) {
%>
	<h2>결과물이 없습니다.</h2>
<%
} else {
%>
	<table border="1">
		<tr>
			<td>학번</td>
			<td>이름</td>
			<td>입학일</td>
			<td>주소</td>
		</tr>
		<%
		for(int i=0; i<volist.size(); i++){
			StudentVo vo = volist.get(i);
		%>
		<tr>
			<td>
			<a href="<%=request.getContextPath()%>/student/get?sno=<%=vo.getStudentNo() %>">
			<%=vo.getStudentNo() %>
			</a></td>
			<td>
			<a href="<%=request.getContextPath()%>/student/get?sno=<%=vo.getStudentNo() %>">
			<%=vo.getStudentName() %>
			</a>
			</td>
			<td><%=vo.getEntranceDate() %></td>
			<td><%=vo.getStudentAddress() %></td>
		</tr>

		<%
		}  // for
		%>
	</table>
	<div>
	<%
	int startPageNum = (Integer)request.getAttribute("startPageNum");
	int endPageNum = (Integer)request.getAttribute("endPageNum");
	int currentPage = (Integer)request.getAttribute("currentPage");
	int totalPageNum = (Integer)request.getAttribute("totalPageNum");
	if(startPageNum != 1 && searchWord != null){
		%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=startPageNum-1%>&searchWord=<%=searchWord%>"><span>이전</span></a>
		,
		<%
	} else if(startPageNum != 1 && searchWord == null) {
		%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=startPageNum-1%>"><span>이전</span></a>
		,
		<%
	}
	
	for(int i=startPageNum;i<=endPageNum;i++){
		if(searchWord != null){
//			if(currentPage == i){	}
		%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=i%>&searchWord=<%=searchWord%>"><span><%=i%></span></a>
		,
		<%
		} else {
	%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=i%>"><span><%=i%></span></a>
		,
	<%
		} // else
	}  // for
	if(endPageNum < totalPageNum  && searchWord != null){
		%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=endPageNum+1%>&searchWord=<%=searchWord%>"><span>다음</span></a>
		,
		<%
	} else if(endPageNum < totalPageNum  && searchWord == null){
		%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=endPageNum+1%>"><span>다음</span></a>
		,
		<%
	}
	%>
	</div>
<%
}  //else
%>
	
</body>
</html>