<jsp:include page="/resources/link.jsp"></jsp:include>
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
<div>
	<h2>로그인</h2>
	<form id="frm-login" >
		id: <input type="text" name="mid" required="required"><br>
		pw: <input type="password" name="mpwd" required="required"><br>
		<button type="button" id=btnajax3>로그인</button>
	</form>
</div>
<div>
	<h2>여러회원가입(장바구니선택)</h2>
<div class="card">
  <h5 class="card-header">Table Dark</h5>
  <div class="table-responsive text-nowrap">
    <table class="table table-dark">
      <thead>
        <tr>
          <th>Project</th>
          <th>Client</th>
          <th>Users</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody class="table-border-bottom-0">
        <tr>
          <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Angular Project</strong></td>
          <td>Albert Cook</td>
          <td>
            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Lilian Fuller">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/5.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Sophia Wilkerson">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/6.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Christina Parker">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/7.png" alt="Avatar" class="rounded-circle">
              </li>
            </ul>
          </td>
          <td><span class="badge bg-label-primary me-1">Active</span></td>
          <td>
            <div class="dropdown">
              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> Delete</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>React Project</strong></td>
          <td>Barry Hunter</td>
          <td>
            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Lilian Fuller">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/5.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Sophia Wilkerson">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/6.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Christina Parker">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/7.png" alt="Avatar" class="rounded-circle">
              </li>
            </ul>
          </td>
          <td><span class="badge bg-label-success me-1">Completed</span></td>
          <td>
            <div class="dropdown">
              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> Delete</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td><i class="fab fa-vuejs fa-lg text-success me-3"></i> <strong>VueJs Project</strong></td>
          <td>Trevor Baker</td>
          <td>
            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Lilian Fuller">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/5.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Sophia Wilkerson">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/6.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Christina Parker">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/7.png" alt="Avatar" class="rounded-circle">
              </li>
            </ul>
          </td>
          <td><span class="badge bg-label-info me-1">Scheduled</span></td>
          <td>
            <div class="dropdown">
              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> Delete</a>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td><i class="fab fa-bootstrap fa-lg text-primary me-3"></i> <strong>Bootstrap Project</strong></td>
          <td>Jerry Milton</td>
          <td>
            <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Lilian Fuller">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/5.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Sophia Wilkerson">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/6.png" alt="Avatar" class="rounded-circle">
              </li>
              <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="" data-bs-original-title="Christina Parker">
                <img src="${pageContext.request.contextPath}/resources/sneat/img/avatars/7.png" alt="Avatar" class="rounded-circle">
              </li>
            </ul>
          </td>
          <td><span class="badge bg-label-warning me-1">Pending</span></td>
          <td>
            <div class="dropdown">
              <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-edit-alt me-1"></i> Edit</a>
                <a class="dropdown-item" href="javascript:void(0);"><i class="bx bx-trash me-1"></i> Delete</a>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

	<div class="signup">
		id: <input type="text" name="mid" required="required"><br>
		pw: <input type="password" name="mpwd" required="required"><br>
		이름: <input type="text" name="mname" required="required"><br>
		이메일: <input type="text" name="memail" required="required"><br>
	</div>
	<div class="signup">
		id: <input type="text" name="mid" required="required"><br>
		pw: <input type="password" name="mpwd" required="required"><br>
		이름: <input type="text" name="mname" required="required"><br>
		이메일: <input type="text" name="memail" required="required"><br>
	</div>
	<div class="signup">
		id: <input type="text" name="mid" required="required"><br>
		pw: <input type="password" name="mpwd" required="required"><br>
		이름: <input type="text" name="mname" required="required"><br>
		이메일: <input type="text" name="memail" required="required"><br>
	</div>
	<button type="button" id=btnajax4>회원가입</button>
</div>
<script>
$("#btnajax1").click(ajax1ClickHandler);
$("#btnajax2").click(ajax2ClickHandler);
$("#btnajax3").click(ajax3ClickHandler);
$("#btnajax4").click(ajax4ClickHandler);
function ajax4ClickHandler(){
	var dataArr = [];  // js array - json 따옴표
	$(".signup").each(function(idx){
		var dataObj = {
			mid: $(this).find("[name=mid]").val()
			, mpwd:$(this).find("[name=mpwd]").val()
			, mname: $(this).find("[name=mname]").val()
			, memail:$(this).find("[name=memail]").val()
			};
		dataArr.push(dataObj);
	});
	console.log(dataArr);  // js array
	console.log(JSON.stringify(dataArr));  // json 으로 변형 string형
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax4"
		,type:"post"
		,data: JSON.stringify(dataArr)
		,success: function(result){
			console.log("success:");
			console.log(result);
		}
		,error: function(){
			console.log("error:");
			console.log(result);
		}
	});
}
function ajax3ClickHandler(){
	console.log("ajax3ClickHandler");
	console.log( $("[name=mid]").val());
	console.log( $("[name=mpwd]").val());
	//form엘리먼트객체.serialize()
	var dataQuery = $("#frm-login").serialize();
	console.log(dataQuery);
	$.ajax({
		url:"${pageContext.request.contextPath}/ajax3"
		,type:"post"
		,data: $("#frm-login").serialize()
			//{
			//mid: $("[name=mid]").val(), 
			//mpwd:$("[name=mpwd]").val() 
			//}
		,success: function(result){
			console.log("success:");
			console.log(result);
		}
		,error: function(){
			console.log("error:");
			console.log(result);
		}
	});
}


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




<jsp:include page="/resources/script.jsp"></jsp:include>
</body>
</html>