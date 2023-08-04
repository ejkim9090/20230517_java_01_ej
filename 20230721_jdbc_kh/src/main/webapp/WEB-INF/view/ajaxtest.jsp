<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax test</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<h2>ajax test</h2>
<input type="text">
<button id="btnajax1">ajax1</button>
<script>
$("#btnajax1").click(ajax1ClickHandler);
function ajax1ClickHandler(){
	console.log("btnajax1 click");
	//$.ajax(ojbect형태로매개인자전달해야함);
	//var obj = {k1:12, k2:'dskfjsdf', k3:function(){}};
	console.log("ajax로 데이터 전달 전-0");
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax1"
		,type: "get"
		,data: {n1:'값도가나?', n2:123} 
	});
	console.log("ajax로 데이터 전달 중-1");
}
</script>
</body>
</html>