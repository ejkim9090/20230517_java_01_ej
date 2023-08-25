<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board list</title>
</head>
<body>
<script>
// step 3
	var msg = '${msg}';
	if(msg){
		alert(msg);
	}
	var msg = '${msg2}';
	if(msg){
		alert(msg);
	}
</script>

<h2>Board List</h2>
[[
${boardList}
]]

</body>
</html>