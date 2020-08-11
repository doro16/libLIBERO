<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 로그인</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		
		<style type="text/css">
			html,body { 
				margin:0; 
				padding:0; 
				width:100%; height:100%;
			}
        	.box { 
        		width:100%; height:100%; 
        		position:relative; 
        		background-size: cover;
        	}
        	.card {
        		position: absolute;
        	}
		</style>
	</head>
	<body>
		
		<div class="box" style="background-image: url(../resources/images/common/index1.jpg);">
			<!-- Bootstrap Container Start -->
			<div class="container">
				<div class="text-center" style="padding-top: 10px;"><img src="../resources/images/common/logo_white.png" width="200px"></div>
				
				<div class="d-flex justify-content-center">
					<div class="card col-lg-5">
					  <div class="card-body">
					  	<form>
						    <h6 class="card-text">E-mail ID</h6>
						    <div class="md-form">
						    	<input type="text" class="form-control" name="userId">
						    </div>
						    <h6 class="card-text">PASSWORD</h6>
						    <div class="md-form">
						    	<input type="password" class="form-control" name="password">
						    </div>
						    <div align="right">
							    <button type="button" class="btn btn-cyan brown lighten-1" onclick="login()">로그인</button>
		        				<button type="button" class="btn btn-outline-brown lighten-1 waves-effect" onclick="location.href='/libero'">취소</button>
	        				</div>
	        			</form>
	        				<hr/>
	        				<div class="text-center">
				        		<a href="/libero/user/addUser"><button type="button" class="btn btn-info brown lighten-1 btn-block" id="addUser">회원가입</button></a><br/>
				        		<a href="${kakao_login}"><img src="/libero/resources/images/common/kakao_login_medium_narrow.png"></a>
				      		</div>
				      		<div class="text-right">
							   				
							  <p class="font-small blue-text d-flex justify-content-end"> 
							  <a href="javascript:popupForId()" class="blue-text ml-1">아이디/</a>
							  <a href="javascript:popupForPwd()" class="blue-text ml-1">비밀번호 찾기</a>
							  
							  
							  </p> 				
							   				
							   				
				      		
				      		
				      		</div>
					    
					  </div>
					</div>
				</div>
			</div>
			<!-- Bootstrap Container End -->
		</div>
	</body>
	
	<script type="text/javascript">
	
	function login() {
		$("form").attr("method" , "POST").attr("action" , "/libero/user/login").submit();
		connect();
	}
	
	 //=======================Web Socket Start=========================		
	function connect(){ 
		session = "${sessionScope.user.userId}";			
		ws = new SockJS("<c:url value="/echo"/>");
		
		ws.onopen = function(){
			console.log('연결 생성');
		};
		ws.onmessage = function(e){
			console.log('메세지 받음');
			var data = e.data;
			alert("받은 메세지 : "+ data);
			//addMsg(data);
		};
		ws.onclose = function(){
			console.log('연결 끊김');
		};
		
	}//=======================Web Socket End=========================	
		
		
	//==============아이디/비밀번호찾기 팝업 ====================
	function popupForId(){
	
        var url = "/libero/user/findId";
        var name = "아이디 찾기";
        var option = "width = 1000, height = 500, top = 50, left = 50, location = no"
        window.open(url, name, option);
    }	
	
	function popupForPwd(){
		
        var url = "/libero/user/findPwd";
        var name = "비밀번호 찾기";
        var option = "width = 1000, height = 500, top = 50, left = 50, location = no"
        window.open(url, name, option);
    }	
		
	</script>
</html>