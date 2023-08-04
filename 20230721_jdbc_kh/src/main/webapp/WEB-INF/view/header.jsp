<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="wrap header">
       <header>
           <div id="logo">
               <!-- <img src="https://dummyimage.com/50x50/e3e6c8/e3e6c8.jpg&text=a" width="50" height="50"> -->
            <h2>Rint Development aaaaaaaa</h2>
            <h1>HTML5 + CSS3 Basic</h1>
        </div>
        <nav id="main_gnb">
            <ul>
                <li><a href="#">Web1</a></li>
                <li><a href="#">Web2</a></li>
                <li><a href="#">Web3</a></li>
                <li><a href="#">Web4</a></li>
                <li><a href="#">Web5</a></li>
            </ul>
        </nav>
        <nav id="main_lnb">
            <ul>
<c:choose>
	<c:when test="${not empty SsLoginId }">
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
	</c:when>
	<c:otherwise>
				<li><span id="btnlogin">로그인</span></li>
	</c:otherwise>
</c:choose>
                <li><a href="#">HTML5 2</a></li>
                <li><a href="#">HTML5 3</a></li>
                <li><a href="#">HTML5 4</a></li>
                <li><a href="#">HTML5 5</a></li>
            </ul>
        </nav>
    </header>
	<div class="wrap-modal">
		<div class="modal-content">
			<div class="btn-modal-close">x</div>
			<h2>로그인</h2>
			<form action="<%=request.getContextPath() %>/login.login" method="post">
				id: <input type="text" name="mid" required="required"><br>
				pw: <input type="password" name="mpwd" required="required"><br>
				<button type="submit">로그인</button>
				<button type="button">회원가입 : TODO</button>
			</form>
		</div>
	</div>
</div>
<script>
	$(".wrap.header #btnlogin").click(loginClickHandler);
	$(".wrap.header .btn-modal-close").click(modalCloseClickHandler);
	$(".wrap.header > .wrap-modal").click(wrapModalClickHandler);
	function loginClickHandler(){
		$(".wrap.header > .wrap-modal").show();
	}
	function modalCloseClickHandler(){
		$(".wrap.header > .wrap-modal").hide();
	}
	function wrapModalClickHandler(e){
		//console.log("wrapModalClickHandler");
		console.log(e.target);
		console.log($(".wrap.header > .wrap-modal").get(0));
		if(e.target == $(".wrap.header > .wrap-modal").get(0)){
			$(".wrap.header > .wrap-modal").hide();
		}
	}
</script>