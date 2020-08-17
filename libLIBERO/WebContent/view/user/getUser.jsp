<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
		<!-- ///////////////////Bootstrap Container Start/////////////////// -->
		<div class="container">
			<jsp:include page="topButton.jsp"></jsp:include>
			
			<h1>내 정보 조회</h1>
			
			<form  enctype="multipart/form-data" >
				<!-- ///////////////////////////// 아이디 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
					<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">아이디</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" id="userId" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.userId}" disabled="disabled">
				  	<input type="hidden" value="${user.userId }" name="userId">
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
				  	<input type="text" id="nickname" name="nickname" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.nickname}" readonly="readonly">
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
				  	<div class="view overlay zoom" id="profileDiv" style="width: 200px; height:200px" >
				  	<img src="/libero/resources/images/user/fileUpload/${user.profile}" class="img-thumbnail hoverable" id="profile"/>
				  	<div class="mask flex-center waves-effect waves-light">
									    <p class="white-text"></p>
									  </div>
									  </div>
				</div>
				</div>
				
				
				
				
				<!-- ///////////////////////////// 성명 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
					<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">성명</span>
				  	</div>
				  	</div>
				  	<input type="text" id="name" name="name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.name}" readonly="readonly">
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
				  	<input type="text" class="form-control" name="address" id="address" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.address}" readonly="readonly">
				  	<div id="addressbtn"></div>
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
				  	<input type="text" class="form-control"name="phone" id="phone" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default" value="${user.phone}" readonly="readonly">
					<div >${user.phoneCode==1 ? '<i class="far fa-smile mdb-gallery-view-icon"></i>' : '<button type="button" id="phoneVerif" class="btn btn-info brown lighten-1">휴대폰 번호 인증</button>'}</div>
					
				</div>
				</div>
<!-- 				/////////////////////////////////휴대폰 인증 코드//////////////////////////////// -->
				<div class="row" style="display:none" id="verifDiv">
				<div class="md-form input-group mb-3">
				<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">인증 번호</span>
				  	</div>
				  	</div>
				  	<input  class="form-control"name="verifCode" id="verifCode" aria-label="Sizing example input" aria-describedby="inputGroupMaterial-sizing-default">
					<div ><button type="button" id="verifBtn" class="btn btn-info brown lighten-1">인증 하기</button></div>
				</div>
				<input type="hidden" value="" id="hiddenVerif">
				</div>
				<!-- ///////////////////////////// 생년월일 ///////////////////////////////// -->
				<div class="row">
				<div class="md-form input-group mb-3">
				<div class="col-3">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text md-addon" id="inputGroupMaterial-sizing-default">생년월일</span>
				  	</div>
				  	</div>
				  	<input type="text" class="form-control" name="birthDate" id="birthDate" aria-describedby="inputGroupMaterial-sizing-default" value="${user.birthDate}" disabled ="disabled">
				  	<input type="hidden" value="${user.birthDate }" name="birthDate">
				</div>
				</div>
			</form>
			
			<div class="justify-content-left" style="width: 100%">
			
			<c:if test="${empty user.kakaoId and user.role ne 'f'}">
						<span style="float:left">
							<a onclick="window.open('${kakao_url}','카카오 로그인','width=400, height=500');" style="text-decoration:none; color: black;"><img src="/libero/resources/images/common/kakao.png" style="width:50px; height:50px; left-margin:50px;">
							&nbsp; 카카오 로그인 연동
							</a>
						</span>
					</c:if>
					
				<span id="btnDiv" style="float:right">
				
					<button type="button" id="modifyBtn" class="btn btn-info brown lighten-1" onclick="updateUser()">수정</button>
					<button type="button" id="modifyBtn" class="btn btn-info brown lighten-1" onclick="location.href=('/libero/user/removeUser')">탈퇴</button>
				</span>
			</div>
			
		</div>
		<!-- //////////////////Bootstrap Container End//////////////////////// -->
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</body>
	
	<script type="text/javascript">
		
    function daumjuso() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                     if(extraAddr !== ''){
//                         extraAddr = ' (' + extraAddr + ')';
//                     }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address").value = extraAddr;
                
                } else {
                    document.getElementById("address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById("postCode").value = data.zonecode;
                document.getElementById("address").value = data.zonecode+" "+addr+" "+extraAddr;
                // 커서를 상세주소 필드로 이동한다.
              //  document.getElementById("postCode").focus();
            }
        }).open();
    }

	
	
	
	
		$(function(){
// 			if ("${user.profile}"!=null) {
// 				$("#preview").css("background-image","/libero/resources/images/user/fileUpload/"+'${user.profile}');
// 			} 
			$("input[name=userId]").on("keyup", function(){
				var userId = $("input[name=userId]").val();
				
				
				
					$.ajax({	url :'/libero/user/json/duplicationCheck?userId='+userId,
								method : 'GET',
								dataType : 'text',
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json;charset=UTF-8;"
										  },
							    success : function(result , status){
								console.log(result);
								
//	 							alert(check);
								if(result != 'false'){
									$("#userId").removeClass("form-control is-invalid")
									$("#userId").addClass("form-control is-valid");								
								}
								if(result != 'true'){
									$("#userId").addClass("form-control is-invalid");
							
								}
						}
						});//아이디 중복체크 끝
						
						
			});//onLoad함수
			
			$("input[name=nickname]").on("keyup", function(){
				var nickname = $("input[name=nickname]").val();
				var path = '/libero/user/json/duplicationNick?nickname='+nickname;
				var decUrl = decodeURIComponent(path)
				//alert(decUrl)
					$.ajax({	url :decUrl,
								method : 'GET',
								dataType : 'text',
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json;application/x-www-form-urlencoded;charset=UTF-8"
										  },
							    success : function(result , status){
								console.log(result);
								
//	 							alert(check);
								if(result != 'false'){
									$("input[name=nickname]").removeClass("form-control is-invalid")
									$("input[name=nickname]").addClass("form-control is-valid");								
								}
								if(result != 'true'){
								
									$("input[name=nickname]	").addClass("form-control is-invalid");
							
								}
						}
						});//아이디 중복체크 끝
						
						
			});//onLoad함수
			
			$("#phoneVerif").on("click",function(){
				
			
			$.ajax({ url: "/libero/user/json/sendSms",
					data: {
						receiver: $("#phone").val()
						},
					type: "post",
					success: function(result) {
						if(result >0){
							swal("인증번호가 발송되었습니다.","휴대폰을 확인해 주세요 :>","success");
						$("#verifDiv").show();
						$("#hiddenVerif").attr("value",result);
						//alert($("#hiddenVerif").val());
						}else{
							swal("유효한 번호를 입력해 주세요","연락처 수정","error");
						}
					}			
					});
			
			})

			$("#verifBtn").on("click",function(){
				if($("#hiddenVerif").val() != $("#verifCode").val()){
					swal("인증번호를 확인해 주세요","","error");
					
				}else if($("#verifCode").val()== null || $("#verifCode").val()== ''){
					swal("인증번호를 입력하지 않으셨습니다.","","error");
				}else{
				
					$.ajax({
						url:"/libero/user/json/updatePhoneCode",
						data:{
							phoneCode : true
						},
						type:"POST",
						success:function(result){
							if(result > 0){
								swal("인증이 완료되었습니다!","감사합니다!","success")
								window.location.reload();
								
							}else{
								
							}
							
							
						}
						
					})
					
				}
				
				
			})
			
			
		})
			
	
		function updateUser() {
			$("input").prop("readonly",false);
			$("#modifyBtn").remove();
			$("#btnDiv").html("<button type='button' class='btn btn-info brown lighten-1' onClick='doUpdate()' id='sendBtn'>저장</button>");
			$("#addressbtn").html(
					
	             	'<button type="button" class="btn btn-cyan brown lighten-1" onClick="daumjuso()">우편번호 찾기</button>'
			 		
			);
			
			$("#profile").remove()
			$("#profileDiv").css("width","").css("height","");
			$("#profileDiv").html(
					 	 '<div class="file-field">'+
					 	 	''+
					   		 '<div class="btn btn-brown lighten-1 btn-sm float-right">'+
					   		"<input type='file' id='file' name='file'>"+
					      	'<span>Choose file</span>'+
			     			''+			     
						    '</div>'+
						  '</div>'+
						  '<div class="form-group imgPreview">'+
			   				'<div class="row col-lg-12 justify-content-center">'+
			   					'<div id="preview">'+
				   					'<div id="titlePreview"></div>'+
				   					'<div id="authorPreview"></div>'+
				   					'<div id="liberoImg"></div>'+
				   					'<img src="" id="uploadPreview" width="200px" height="200px" style="display:none; padding-top:30px">'+
			   					'</div>'+
			   				'</div>'+
			   			'</div>'+"<"+"script>"+
			   			"function readURL(input) {"+
					            "if (input.files && input.files[0]) {"+
					               " var reader = new FileReader();"+
					                "reader.onload = function (e) {"+ 
					                   ' $("#uploadPreview").show();'+
					                   " $('#uploadPreview').attr('src', e.target.result);"+
					                "};"+                    
					                "reader.readAsDataURL(input.files[0]);"+
					            "}"+
					    	"}"+					    
					   	'$("#file").change(function(){'+
					            'readURL(this);'+
					        '});'+
						
			   			"<"+"/"+"script>"
			   					)
		}
		
		
		function doUpdate(){
			$("form").attr("method","POST").attr("action","/libero/user/updateUser").submit();
		}
		
	</script>
</html>