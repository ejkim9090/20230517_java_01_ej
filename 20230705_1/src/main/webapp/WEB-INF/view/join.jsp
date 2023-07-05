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
				<tr><th>아이디(5-9, 영문자로시작,숫자,특수기호(_!만가능)못씀)</th><td><input type="text" name="mid"></td></tr>
				<tr><th>패스워드(5-9, 대문자, 소문자, 숫자, 특수문자(!_#) 최소1개이상 포함)</th><td><input type="text" name="mpwd"></td></tr>
				<tr><th>이름(5-16)</th><td><input type="text" name="mname"></td></tr>
				<tr><th>전화번호(7-30)</th><td><input type="text" name="mtel"></td>				</tr>
				<tr><th>이메일(5-100)</th><td><input type="text" name="memail"></td>				</tr>
				<tr><th>주민번호(14)</th><td><input type="text" name="msno"></td>				</tr>
				<tr><td colspan="2"><input type="button" value="회원가입"></td>				</tr>
			</table>
		</form>
	</div>
<script>
	$("#frmJoin [type=button]").click(sumbitHandler);
	function sumbitHandler(){
		console.log("여기들어완?");
		// 유효성 검사
		var id = $("[name=mid]").val();
		var regEx_id = /^[A-Za-z][A-Za-z0-9_!]{4,8}$/; 
		if( !regEx_id.test(id) ){
			console.log("정규표현식 부적합");
			alert("아이디는 5-16자 영문자로 시작하고 영문자와 숫자만 입력해주세요");
			$("[name=mid]").focus();
			return;
		} 
		/* 
		if (id.length < 5 || id.length > 16) {
			// 오류 조건식으로 체크함
			alert("아이디는 5-16자 입력해주세요");
			$("[name=mid]").focus();
			return;
		}  
		*/
		// string 객체 메소드
		// includes("a")
		
		
		// id가 정상적으로 입력되어있다면 다음 pwd 체크함.
		var pwd = $("[name=mpwd]").val();
		var regEx_pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!_#])[a-zA-Z0-9!_#]{5,9}$/; 
		if( !regEx_pwd.test(pwd) ){
			console.log("정규표현식 부적합");
			alert("비밀번호는 8-20자 입력해주세요");
			$("[name=mpwd]").focus();
			return;
		} else {
			console.log("정규표현식 적합");
		}
		/* 
		if (pwd.length < 8 || pwd.length > 20) {
			// 오류 조건식으로 체크함
			alert("비밀번호는 8-20자 입력해주세요");
			$("[name=mpwd]").focus();
			return;
		} 
		 */
	}
</script>

	
	
	
</body>
</html>