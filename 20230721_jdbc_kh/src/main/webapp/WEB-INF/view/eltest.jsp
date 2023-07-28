<%@page import="kh.test.jdbckh.board.model.dto.BoardDto"%>
<%@page import="kh.test.jdbckh.board.model.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - </title>
</head>
<body>
<h2> EL </h2>
${a1 } : <%= request.getAttribute("a1") %> <br>
${a2 } : <%= request.getAttribute("a2") %> <br> 
${volist } <hr> <%= request.getAttribute("volist") %> <br> 
<% List<BoardDto> list = (List<BoardDto>)request.getAttribute("volist"); %> 

${volist2 } <hr> <%= request.getAttribute("volist2") %> <br> 
<% List<BoardDto> list2 = (List<BoardDto>)request.getAttribute("volist2"); %> 
<%-- <%=list2.size() %> --%>
${volist2.size() } 
<br>

</body>
</html>