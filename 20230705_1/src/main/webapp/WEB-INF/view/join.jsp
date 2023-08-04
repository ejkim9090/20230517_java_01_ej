<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<style>
.hint{
/* 	display:table-row; */
	font-size:.7em;
	color:blue;
	/* display:none; */
	visibility: hidden;
}
</style>
<script>
	window.onload = loadedHandler;
	function loadedHandler(){
		$("[type=text]").click(inputClickHandler);
		$("[type=password]").click(inputClickHandler);
		$("[type=email]").click(inputClickHandler);
	}
	function inputClickHandler(e){
		//console.log("inputClickHandler");
		//console.log(this);
		console.log($(this).parents("tr").next(".hint"));
		//var $hintElement = $(this).parent().parent().next(".hint");
		
		$(".hint").css("visibility", "hidden");
		//$(".hint").hide(); // hint class 인것들 모두 hide()
		var $hintElement = $(this).parents("tr").next(".hint"); // hint class 중- 클릭한 것과 관련있는 것만 show()
		//$hintElement.show();
		$hintElement.css("visibility", "visible");
	}
</script>
</head>
<body>
	<h1>회원가입</h1>
	<div>
		<%-- <form action="<%=request.getContextPath() %>/join" method="post"> --%>
		<form id="frmJoin">
			<table >
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mid" placeholder="(5-9, 영문자로시작,숫자,특수기호_!만가능)"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(5-9, 영문자로시작,숫자,특수기호_!만가능)</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="password" name="mpwd" placeholder="(5-9, 대문자, 소문자, 숫자, 특수문자(!_#) 최소1개이상 포함)"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(5-9, 영문자로시작,숫자,특수기호_!만가능)</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mname" placeholder="(2-10, 한글)"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(2-10, 한글)</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="mtel" placeholder="(7, 좀전...)"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(7, 좀전...)</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="memail" placeholder="(문자@문자.문자 (문자는 영문자+숫자+.-_기호가능))"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(문자@문자.문자 (문자는 영문자+숫자+.-_기호가능))</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="msno" placeholder="(14, 좀전...)"></td>
				</tr>
				<tr class="hint">
					<td></td>
					<td>(14, 좀전...)</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>
<script>
	$("#frmJoin [type=button]").click(sumbitHandler);
	function sumbitHandler(){
		var result = checkRegularExpression1();
		if(result == false){
			//return;
		}
		// 전달
		//var queryString = $("#frmJoin").serialize();
		//console.log(queryString); // mid=a&mpwd=b&mname=c&mtel=d&memail=e&msno=f
		// queryString : ?n1=v1&n2=v2
		//var queryStringEx = "?"+"mid="+$("[name=mid]").val()+"&mpwd="+$("[name=mpwd]").val();
		
		document.getElementById("frmJoin").action = "<%=request.getContextPath()%>/join";
		document.getElementById("frmJoin").method = "post";
		document.getElementById("frmJoin").submit();
	}
	function checkRegularExpression1(){
		// 유효성 검사
		var id = $("[name=mid]").val();
		var regEx_id = /^[A-Za-z][A-Za-z0-9_!]{4,8}$/; 
		if( !regEx_id.test(id) ){
			alert("아이디는 5-16자 영문자로 시작하고 영문자와 숫자만 입력해주세요");
			$("[name=mid]").focus();
			return false;
		}
		console.log("mid 정규표현식 적합");
		// id가 정상적으로 입력되어있다면 다음 pwd 체크함.
		var pwd = $("[name=mpwd]").val();
		var regEx_pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!_#])[a-zA-Z0-9!_#]{5,9}$/; 
		if( !regEx_pwd.test(pwd) ){
			alert("mpwd 비밀번호는 입력해주세요");
			$("[name=mpwd]").focus();
			return false;
		} 
		console.log("mpwd 정규표현식 적합");
		var mname = $("[name=mname]").val();
		var regEx_mname = /^[가-힣]{2,10}$/;
		if( !regEx_mname.test(mname) ){
			alert("mname 정규표현식 부적합");
			$("[name=mname]").focus();
			return false;
		} 
		console.log("mname 정규표현식 적합");
		var mtel = $("[name=mtel]").val();
		var regEx_mtel = /^01[016789][0-9]{3,4}[0-9]{4}$/; 
		if( !regEx_mtel.test(mtel) ){
			console.log("정규표현식 부적합");
			alert("mtel 정규표현식 부적합");
			$("[name=mtel]").focus();
			return;
		} 
		console.log("mtel 정규표현식 적합");
		var memail = $("[name=memail]").val();
		//이메일 형식이 문자@문자.문자 (문자는 영문자+숫자+.-_기호가능) 
		var regEx_memail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; 
		if( !regEx_memail.test(memail) ){
			console.log("정규표현식 부적합");
			alert("memail 정규표현식 부적합");
			$("[name=memail]").focus();
			return false;
		} 
		console.log("memail 정규표현식 적합");
		var msno = $("[name=msno]").val();
		var regEx_msno = /^[0-9]{6}[1234][0-9]{6}$/; 
		if( !regEx_msno.test(msno) ){
			console.log("정규표현식 부적합");
			alert("msno 정규표현식 부적합");
			$("[name=msno]").focus();
			return false;
		} 
		console.log("msno 정규표현식 적합");
		return true;
	}
	// $("[name=mname]").parents('tr').next('.hint').css("color", 'red');
			
</script>

	
</body>
</html>