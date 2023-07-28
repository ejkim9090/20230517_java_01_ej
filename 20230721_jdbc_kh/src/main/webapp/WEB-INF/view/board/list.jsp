<%@ page import="kh.test.jdbckh.board.model.dto.BoardDto"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>
.wrap-flex{
	display: flex;
}
.wrap-grid{
	display:grid;
	grid-template-columns: auto auto auto auto;
}
</style>
</head>
<body>
	[[초기 확인용 <%=request.getAttribute("boardList") %>]]
	<h2>게시글</h2>
	<div class="wrap-grid">
		<div>번호</div>
		<div>제목</div>
		<div>작성자</div>
		<div>작성일</div>
<%
List<BoardDto> boardList = (List<BoardDto>)request.getAttribute("boardList");
if(boardList != null && boardList.size()>0){
	for(int i=0; i<boardList.size(); i++){
		BoardDto vo = boardList.get(i);
%>
		<div><%=vo.getBno() %></div>
		<div><%=vo.getBtitle() %></div>
		<div><%=vo.getMid() %></div>
		<div><%=vo.getBwriteDate() %></div>
<%
	}
}
%>
	</div>
</body>
</html>