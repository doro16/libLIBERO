<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 로그인</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			html,body { 
				margin:0; 
				padding:0; 
				width:100%; height:100%;
				font-family: 'GyeonggiBatang';
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
						    	<input type="text" class="form-control" name="userId" id="userId">
						    </div>
						    <h6 class="card-text">PASSWORD</h6>
						    <div class="md-form">
						    	<input type="password" class="form-control" name="password" id="password">
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
							  <!--  <a href="#" data-target="#findIdModal" data-toggle="modal" id="findId">아이디 찾기</a>
							  <a href="#" data-target="#findPwdModal" data-toggle="modal" id="findPwd">비밀번호 찾기</a>
							   -->
							 
							  </p> 				
				      		</div>
				      		
				      		<!-- Modal Start -->
				      		
				      		<!--Modal: Login / Register Form-->
									<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									  <div class="modal-dialog cascading-modal" role="document">
									    <!--Content-->
									    <div class="modal-content">
									
									      <!--Modal cascading tabs-->
									      <div class="modal-c-tabs">
									
									        <!-- Nav tabs -->
									        <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
									          <li class="nav-item">
									            <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fas fa-user mr-1"></i>
									              Login</a>
									          </li>
									          <li class="nav-item">
									            <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fas fa-user-plus mr-1"></i>
									              Register</a>
									          </li>
									        </ul>
									
									        <!-- Tab panels -->
									        <div class="tab-content">
									          <!--Panel 7-->
									          <div class="tab-pane fade in show active" id="panel7" role="tabpanel">
									
									            <!--Body-->
									            <div class="modal-body mb-1">
									              <div class="md-form form-sm mb-5">
									                <i class="fas fa-envelope prefix"></i>
									                <input type="email" id="modalLRInput10" class="form-control form-control-sm validate">
									                <label data-error="wrong" data-success="right" for="modalLRInput10">Your email</label>
									              </div>
									
									              <div class="md-form form-sm mb-4">
									                <i class="fas fa-lock prefix"></i>
									                <input type="password" id="modalLRInput11" class="form-control form-control-sm validate">
									                <label data-error="wrong" data-success="right" for="modalLRInput11">Your password</label>
									              </div>
									              <div class="text-center mt-2">
									                <button class="btn btn-info">Log in <i class="fas fa-sign-in ml-1"></i></button>
									              </div>
									            </div>
									            <!--Footer-->
									            <div class="modal-footer">
									              <div class="options text-center text-md-right mt-1">
									                <p>Not a member? <a href="#" class="blue-text">Sign Up</a></p>
									                <p>Forgot <a href="#" class="blue-text">Password?</a></p>
									              </div>
									              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
									            </div>
									
									          </div>
									          <!--/.Panel 7-->
									
									          <!--Panel 8-->
									          <div class="tab-pane fade" id="panel8" role="tabpanel">
									
									            <!--Body-->
									            <div class="modal-body">
									              <div class="md-form form-sm mb-5">
									                <i class="fas fa-envelope prefix"></i>
									                <input type="email" id="modalLRInput12" class="form-control form-control-sm validate">
									                <label data-error="wrong" data-success="right" for="modalLRInput12">Your email</label>
									              </div>
									
									              <div class="md-form form-sm mb-5">
									                <i class="fas fa-lock prefix"></i>
									                <input type="password" id="modalLRInput13" class="form-control form-control-sm validate">
									                <label data-error="wrong" data-success="right" for="modalLRInput13">Your password</label>
									              </div>
									
									              <div class="md-form form-sm mb-4">
									                <i class="fas fa-lock prefix"></i>
									                <input type="password" id="modalLRInput14" class="form-control form-control-sm validate">
									                <label data-error="wrong" data-success="right" for="modalLRInput14">Repeat password</label>
									              </div>
									
									              <div class="text-center form-sm mt-2">
									                <button class="btn btn-info">Sign up <i class="fas fa-sign-in ml-1"></i></button>
									              </div>
									
									            </div>
									            <!--Footer-->
									            <div class="modal-footer">
									              <div class="options text-right">
									                <p class="pt-1">Already have an account? <a href="#" class="blue-text">Log In</a></p>
									              </div>
									              <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
									            </div>
									          </div>
									          <!--/.Panel 8-->
									        </div>
									
									      </div>
									    </div>
									    <!--/.Content-->
									  </div>
									</div>
									<!--Modal: Login / Register Form-->
									
								<!--  	<div class="text-center">
									  <a href="" class="btn btn-default btn-rounded my-3" data-toggle="modal" data-target="#modalLRForm">Launch
									    Modal LogIn/Register</a>
									</div> -->
				      		
					    	<!-- Modal End -->
					  </div>
					</div>
				</div>
			</div>
			<!-- Bootstrap Container End -->
		</div>
		
<div id="modalBoxId" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h3 class="modal-title" id="myModalLabel" style="float:center; text-align:center">ID 찾기</h3>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
</div>
<div class="modal-body">	
			
			<div class="col-xs-6 col-md-12">	
    		
    		<div id="inputPhone">
    		<div class="md-form">
			  <input type="text" id="phone" name="phone" class="form-control">
			  <label for="form1">휴대폰 번호 입력</label>
			</div>
    		
    		<button type="button" id="phoneVerif" class="btn btn-info brown lighten-1">휴대폰 번호 인증</button>
    		</div>
    		
    		<div style="display:none" id="verifDiv">
    		<div class="md-form">
			  <input type="text" id="verifCode" name="verifCode" class="form-control">
			  <label for="form1">인증 번호 입력</label>
			</div>
			
			<button type="button" id="verifBtn" class="btn btn-info brown lighten-1">인증 하기</button>		
			

    		<input type="hidden" value="" id="hiddenVerif">
    		<input type="hidden" id="findUserId" name="findUserId" value=""/>
		</div>
</div>
</div>
</div>
</div>
</div>

<div id="modalBoxPw" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
<h3 class="modal-title" id="myModalLabel" style="float:center">Password 찾기</h3>
<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
</div>
<div class="modal-body">	
			
			<div class="col-xs-6 col-md-12">	
    		
    		<div id="inputPhone">
    		<div class="md-form">
			  <input type="email" id="findPassword" name="findPassword" class="form-control">
			  <label for="form1">ID(E-mail) 입력</label>
			</div>
    		
    		<button id="emailcheck" class="btn btn-cyan brown lighten-1" type="button">이메일 인증</button>
    		</div>
    		
</div>
</div>
</div>
</div>
</div>
		
	</body>
	
	<script type="text/javascript">
$(function(){
	
	if('${message}' == 'wrong'){
		swal({
			text : "아이디 혹은 비밀번호를 확인해 주세요",
			icon : "error",
			position : "center",
			buttons:{
				Id : {
					text:"ID 찾기",
					value:"id",
					
				},
				Password :{
					text:"PASSWORD 찾기",
					value:"password",
				},
					},
			
		}).then((value) =>{
			switch (value)     {
				case "id" :
					$('#modalBoxId').modal('show');
					break;
				
				case "password" : 
					$('#modalBoxPw').modal('show');
			}
		});
	}
	
	//==============아이디/비밀번호찾기 팝업 ====================
	$("#phoneVerif").on("click",function(){
				
			
			$.ajax({ url: "/libero/user/json/findId",
					data: {
						receiver: $("#phone").val()
						},
					type: "post",
					success: function(result) {
						if(result.certifiNum > 0 && result.certifiNum != 1111111){
							swal("인증번호가 발송되었습니다.","휴대폰을 확인해 주세요 :>","success");
						$("#verifDiv").show();
						$("#inputPhone").hide();
						$("#hiddenVerif").attr("value",result.certifiNum);
						$("#findUserId").val(result.userId);
						}else if(result.certifiNum == 0){
							swal("유효한 번호를 입력해 주세요","error");
							return;
						}else if(result.certifiNum == 1111111){
							swal("회원가입 시 입력한 핸드폰 번호를 입력해주세요.");
							return;
						}
					}			
					});
			
			})	
		
	$("#verifBtn").on("click",function(){
		
		var userId = $("#findUserId").val();
		var subUserId = userId.substring(0,3);
		var star = "";
		
		for(var i=0; i<userId.length-3; i++){
		//alert(userId.length-3)//userId.length+""+
		star += "*";
		}
		
				if($("#hiddenVerif").val() != $("#verifCode").val()){
					swal("인증번호를 확인해 주세요","","error");		
					return;
				}else if($("#verifCode").val()== null || $("#verifCode").val()== ''){
					swal("인증번호를 입력하지 않으셨습니다.","","error");
					return;
				}else{						
					swal("인증이 완료되었습니다!","회원님의 ID는 "+subUserId+star+" 입니다.","success")
					$('#modalBoxId').modal("hide");
					return;
						}						
					})
					
					//////////////////////////이메일 인증
		$("#emailcheck").on("click",function(){
			if( $("#findPassword").val() == '' ){
				swal("이메일을 입력해 주세요.","이메일을 입력하지 않으셨습니다.","error")
			}else{
			$.ajax(
					{	url : "/libero/user/json/findPassword?findPassword="+$("#findPassword").val(),
						method : "GET" ,
						/* dataType : "json" , */
						headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
									}
						,success : function vcode() {
						swal("메일이 발송 되었습니다!", "임시 비밀번호를 확인해주세요.", "success");			
						$('#modalBoxPw').modal("hide");
						},
						error : function( error ) {
							swal("유효한 이메일을 입력해 주세요.","이메일을 잘못 입력하셨습니다.","error")
						}
						
						
						});//$.ajax 끝
					}	
										
				});//$("#emailcheck").on끝
												
			}); // End Of Load Function

	function login() {
		if($("#userId").val() ==''){
			swal("아이디를 입력해 주세요","아이디 미입력","error");
			return;
		}else if($("#password").val() == ''){
			swal("비밀번호를 입력해 주세요","비밀번호 미입력","error");
			return;
		}
		
		
		$("form").attr("method" , "POST").attr("action" , "/libero/user/login").submit();
	
		
			
		connect();

		//connect();

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
				
		
	</script>
</html>