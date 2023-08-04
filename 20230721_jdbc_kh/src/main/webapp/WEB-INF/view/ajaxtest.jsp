<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax test</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
.grid-wrap{
	display:grid;
	grid-template-columns:  auto auto;
}
</style>
</head>
<body>
<h2>ajax test</h2>
<input type="text">
<button id="btnajax1">ajax1</button>
<button id="btnajax2">ajax2</button>
<div class="grid-wrap">
<div>학과이름</div><div>계열</div>
</div>
<script>
$("#btnajax1").click(ajax1ClickHandler);
$("#btnajax2").click(ajax2ClickHandler);
function ajaxSuccess(result){
	console.log("ctrl로부터 전달받은 데이터 :");
	console.log(result);
	alert(result);
}
function ajax1ClickHandler(){
	console.log("btnajax1 click");
	//$.ajax(ojbect형태로매개인자전달해야함);
	//var obj = {k1:12, k2:'dskfjsdf', k3:function(){}};
	console.log("ajax로 데이터 전달 전-0");
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax1"
		,type: "get"
		,data: {n1:'값도가나?', n2:123} 
		,success: ajaxSuccess
	});
	console.log("ajax로 데이터 전달 중-1");
}
function ajax2ClickHandler(){
	console.log("btnajax2 click");
	$.ajax({
		url: "${pageContext.request.contextPath}/ajax2"
		,type: "post"
		,success: ajaxSuccess2
		,dataType:"json"
	});
}
function ajaxSuccess2(result){
	console.log("2 ctrl로부터 전달받은 데이터 :");
	console.log(result);
	console.log(result.deptList);
	console.log(result.profList);
	console.log(result.endPage);
	console.log(result.startPage);
	if(result){
		for(var i=0; i<result.deptList.length;i++){
			var dvo = result.deptList[i];
			console.log(dvo.departmentName);
		}
	}
	
	displayDepartment(result.deptList);
	
}
function displayDepartment(deptList){
	htmlVal = "	<div>학과이름</div><div>계열</div>";
	for(var i=0; i<deptList.length;i++){
		var dvo = deptList[i];
		htmlVal +="<div>"+dvo.departmentName+"</div>";
		htmlVal += "<div>"+dvo.category+"</div>";
	}
	$('.grid-wrap').html(htmlVal);	
}
</script>
</body>
</html>