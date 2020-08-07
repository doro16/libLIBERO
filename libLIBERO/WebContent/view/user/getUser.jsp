<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 내정보 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
		<!-- ///////////////////Bootstrap Container Start/////////////////// -->
		<div class="container">
			<jsp:include page="topButton.jsp"></jsp:include>
			
			<h1>내정보 조회</h1>
			
			<form>
				<!-- ///////////////////////////// 아이디 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
					<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">아이디</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.userId}" readonly="readonly">
				</div>
				</div>
					<!-- ///////////////////////////// 닉네임 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">닉네임</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.nickname}" readonly="readonly">
				</div>
				</div>
				
				<!-- ///////////////////////////// 프로필 사진 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">	
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">프로필 사진</span>
				  	</div>
				  	</div>
				  	<div class="view overlay zoom" >
				  	<img src="/libero/resources/images/user/fileUpload/${user.profile}" class="img-thumbnail hoverable" id="profile"/>
				  	<div class="mask flex-center waves-effect waves-light" id=profile>
									    <p class="white-text"></p>
									  </div>
									  </div>
				</div>
				</div>
				<div id="preview" style="width: 100px; height: 100px"></div>
				
				
				
				<!-- ///////////////////////////// 성명 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">성명</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.name}" readonly="readonly">
				</div>
				</div>
				<!-- ///////////////////////////// 주소 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
				  	<div class="input-group-prepend">
				  
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">주소</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.address}" readonly="readonly">
				</div>
				</div>
				<!-- ///////////////////////////// 핸드폰번호 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
				<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">휴대폰번호</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.phone}" readonly="readonly">
					<div >휴대폰 인증 : ${user.phoneCode==1 ? '<i class="far fa-smile mdb-gallery-view-icon"></i>' : '<i class="far fa-frown mdb-gallery-view-icon"></i>'}</div>
				</div>
				</div>
				<!-- ///////////////////////////// 생년월일 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
				<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">생년월일</span>
				  	</div>
				  	</div>
				  	<input type="date" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.birthDate}" readonly="readonly">
				</div>
				</div>
			</form>
			
			<div class="justify-content-right" style="width: 100%">
				<div align="right">
					<button type="button" class="btn btn-info brown lighten-1" onclick="updateUser()">수정</button>
				</div>
			</div>
			
		</div>
		<!-- //////////////////Bootstrap Container End//////////////////////// -->
	</body>
	
	<script type="text/javascript">
		
		$(function(){
			if ("${user.profile}"!=null) {
				$("#preview").css("background-image","/libero/resources/images/user/fileUpload/"+'${user.profile}');
			} 
		});
	
		function updateUser() {
			$("input").prop("readonly",false);
		}
	</script>
</html>