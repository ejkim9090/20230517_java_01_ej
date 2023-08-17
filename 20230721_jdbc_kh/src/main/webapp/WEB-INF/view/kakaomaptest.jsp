<jsp:include page="/resources/link.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao map test</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type ="text/javascript" src="${pageContext.request.contextPath}/resources/js/apikey.js"></script>
<script>
var temp = `\${a.apikey}`;
console.log(temp);
</script>
<style>
.grid-wrap{
	display:grid;
	grid-template-columns:  auto auto;
}
</style>

</head>
<body>
<h2>kakao map test</h2>
<input type="text">
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:100%;height:350px;"></div>
<!-- <script type="text/javascript"	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aec5b89790015b44669217946b7e53f3"></script> -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=\${a.apikey}"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 
</script>
<jsp:include page="/resources/script.jsp"></jsp:include>
</body>
</html>