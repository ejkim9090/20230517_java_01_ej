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
 <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
</head>
<body>
<h2>ajax test</h2>
<input type="text">
<button id="btnajax1">ajax1</button>
<button id="btnajax2">ajax2</button>
<div class="grid-wrap">
<div>학과이름</div><div>계열</div>
</div>
	<h1>지도 표시하기</h1>
	<div id="map" style="width: 100%; height: 600px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키값넣기키값넣기키값넣기키값넣기키값넣기키값넣기키값넣기키값넣기"></script>
<script>
var deptListArr = JSON.parse('${deptList}'); 
console.log(deptListArr.length);
var markerArr = [];
for(var i=0; i<1; i++){
	var vo = deptListArr[i];
	var markerObj = {
		title: '<div>'+vo.departmentNo+'</div>',
		latlng : new kakao.maps.LatLng(37.498505, 127.032540) 
	};
	markerArr.push(markerObj);
}
console.log(markerArr);
var container = document.getElementById('map');
var options = {
	center : new kakao.maps.LatLng(37.498505, 127.032540),
	level : 8
};
var map = new kakao.maps.Map(container, options);
// lat=37.500759, lng=127.034269
//마커를 표시할 위치와 title 객체 배열입니다
var positions = markerArr;
/*
var positions = [
{
    title: '맥주창고', 
    latlng: new kakao.maps.LatLng(37.500759,127.034269 )
},
{
    title: '생태연못', 
    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
},
{
    title: '텃밭', 
    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
},
{
    title: '근린공원',
    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
}
];
*/
//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

// 마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(24, 35); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, // 마커를 표시할 지도
    position: positions[i].latlng, // 마커를 표시할 위치
    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    image : markerImage // 마커 이미지 
});
}











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