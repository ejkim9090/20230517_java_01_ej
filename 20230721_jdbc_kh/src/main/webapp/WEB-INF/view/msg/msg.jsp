<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<script>
// 경고 창 띄우기 - 0
	var alertMsg = '${msg}';  // 따옴표 꼭!!!! 매우 중요!!! 엄청 강조!!!
	if(alertMsg){  // js에서는 '' 상태를 false 로 인식함. 문자가 들어있어야 true임.
		alert(alertMsg);
	}
</script>