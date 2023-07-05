<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<div>
		<%-- <form action="<%=request.getContextPath() %>/join" method="post"> --%>
		<form id="frmJoin">
			<table>
				<tr><th>아이디(5-16)</th><td><input type="text" name="mid"></td></tr>
				<tr><th>패스워드</th><td><input type="password" name="mpwd"></td></tr>
				<tr>					<th>이름</th>					<td><input type="text" name="mname"></td>				</tr>
				<tr>					<th>전화번호</th>					<td><input type="text" name="mtel"></td>				</tr>
				<tr>					<th>이메일</th>					<td><input type="text" name="memail"></td>				</tr>
				<tr>					<th>주민번호</th>					<td><input type="text" name="msno"></td>				</tr>
				<tr>					<td colspan="2"><input type="button" value="회원가입"></td>				</tr>
			</table>
		</form>
	</div>
<script>
	$("frmJoin [type=button]").click(sumbitHandler);
	function sumbitHandler(){
		// 유효성 검사
		var id = $("[name=mid]").val();
		if(id.length > 4 and id.length < 17){
			// 정상
		} else {
			 alert("5-16자 입력해주세요");
		}
	}
</script>

	
	
	
</body>
</html>