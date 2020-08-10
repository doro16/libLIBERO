
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% request.setCharacterEncoding("utf-8"); %>
    <% response.setContentType("text/html; charset=utf-8"); %>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<jsp:include page="/common/cdn.jsp"></jsp:include>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



 

<script type="text/javascript">
//카카오 주소 API 사용
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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postCode").value = data.zonecode;
                document.getElementById("address").value = addr+extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("postCode").focus();
            }
        }).open();
    }


/////////////////////////////////////////회원가입 버튼 눌렀을때
   	
	 		   	
	 		   	function addUser() {
	 			    	
	 					var userId = $("input[name='userId']").val();
	 					var password = $("input[name='password']").val();
	 					var password2 = $("input[name='password2']").val();
	 					var profile = $("input[name='file']").val();
	 					var address = $("input[name='address']").val();
	 					var birthDate= $("input[name='birthDate']").val();
	 					var genderCode = $("input[name='genderCode']:checked").val();
	 					var name = $("input[name='name']").val();
	 					var phone = $("input[name='phone']").val();
	 					
	 					
	 					
	 					if(name == null || name== ''){
	 						swal("이름을 입력해 주세요","이름 미입력","warning");
	 						return;
	 					}else if ($("input[name='password']").val()==null || $("input[name='password']").val() =="") {
	 						swal({
	 							title : "비밀번호를 입력해 주세요",
	 							text : "비밀번호 미입력",
	 							icon : "warning",
	 							timer : 2000,
	 							}).then(()=> {
	 								return;
	 							})
	 							
	 							    
	 							
	 						
	 					}else if ($("input[name='birthDate']").val()==null || $("input[name='birthDate']").val() =="") {
	 						swal("생년월일을 선택해 주세요","생년월일 미등록","warning")
	 						return;
	 					}else if ($("input[name='genderCode']:checked").val()==null) {
	 						swal("성별을 선택해 주세요","\\YAY/","warning")
	 						return;
	 					}else if($("input[name='password']").val()!=$("input[name='password2']").val() || $("input[name='password2']").val() != $("input[name='password']").val()){
	 						swal("2차비밀 번호가 다릅니다.","비밀번호 오류","error")
	 						return;
	 					}else if(address == null || address == ''){
	 						swal("주소를 입력해 주세요","주소 미입력","warning")
	 						return;
	 					}else if(phone==null|| phone == ''){
	 						swal("연락처를 입력해 주세여","연락처 미입력","warning");
	 						return;
	 					}else{
	 						 swal({
	 							text: "회원가입 완료!",
	 							icon:"success",
	 							buttons:{
	 								 home : {
	 									 text:"확인",
	 									 value:"home",
	 								 },
	 								},
	 							}).then((value) =>{
	 								switch(value){
	 								case "home" : 	$("form").attr("method" , "POST").attr("action" , "/libero/user/addUser").submit();	 								
	 								}
	 							})
	 		    
	 						
	 					}
	 					
	 					//swal("회원가입이 완료되었습니다.","감사합니다 :>","success");
	 					//
	 				
	 		  
		}
	 		  

	$(function (){
		
		
		function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) { 
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    $("#uploadPreview").show();
                    $('#uploadPreview').attr('src', e.target.result);
                    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                    //(아래 코드에서 읽어들인 dataURL형식)
                }                    
                reader.readAsDataURL(input.files[0]);
                //File내용을 읽어 dataURL형식의 문자열로 저장
            }
    	}//readURL()--

    	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
   		$("#file").change(function(){
            //alert(this.value); //선택한 이미지 경로 표시
            readURL(this);
        });
		
		
		$('#hashtagName').tagsInput({
			width:'auto',
			defaultText:''
		});
		
		
		$("#verifBtn").on("click",function(){
			//alert( $("inputVerification").val())
			//alert($("#verification").val())
			if( $("#inputVerification").val() != $("#verification").val()){
				swal("인증번호가 다릅니다 다시 확인해 주세요!","헤헤 바보 :p","error")
			}else{
				swal("인증 되었습니다!","\\YAY/","success")
			}
		})
		
		
		
		//$("#userId").focus();
		
		//////////////////////////아이디 유효체크
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
							
// 							alert(check);
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
							
// 							alert(check);
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
		
		
		//////////////////////////이메일 인증
		$("#emailcheck").on("click",function(){
			if( $("#userId").val() == '' ){
				swal("이메일을 입력해 주세요","헤헤 바보야 :p","error")
			}else{
			$.ajax(
					{	url : "/libero/user/json/emailSend?userId="+$("#userId").val(),
						method : "GET" ,
						dataType : "json" ,
						headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
									}
						,success : function vcode(JSONData , status) {
							var json = JSONData.verifCode
						//알림 하나 띄우고 인증코드 입력 열기
						$("#verifDiv").show()
 						$("#inputVerification").val(json);
						//alert("1"+  $("#inputVerification").val(json).val())
						swal("메일이 발송 되었습니다!", "작성하신 이메일을 확인해 주세요", "success");
						
						//Debug...
						},
						error : function( error ) {
							swal("유효한 이메일을 입력해 주세요","에이","error")
						}
						
						
					});//$.ajax 끝
			}	
										
				});//$("#emailcheck").on끝
				
				
				//////////////////////////////////////////////////////////////////////////////////////
			   
				
				///////////////////////////////////////////////////////////////////////////////////////////////////////
					


	 	
				
				
		 
		});	//$(function)끝
		
		
		
		    	
		    
	</script> 


</head>
<body>


<div class="container">

<div class="card">

    <h5 class="card-header brown lighten-1 white-text text-center py-4">
        <strong>회원가입</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

 




        <!-- Form -->
        <form class="text-center" style="color: #bcaaa4;" enctype="multipart/form-data" >
                   
                   <br><br>
			<!--  이름 -->
            <div class="md-form mt-0">
                <input type="text" id="name" class="form-control" name="name">
                <label for="name">이름</label>
            </div>
			<!--아이디 -->
            <div class="md-form mt-0">
                <input type="email" id="userId" class="form-control" name="userId">
                <label for="userId">아이디(이메일)</label>
                <button id="emailcheck" class="btn btn-cyan brown lighten-1" type="button">이메일 인증</button>
            </div>
               <input type="hidden" id="inputVerification" name ="inputVerification">
			<!--인증번호 -->
            <div class="md-form mt-0"id="verifDiv" style="display : none">
                <input type="text" class="form-control" id="verification" name="verification">
                <label for="verification">인증 번호</label>  
                <button type="button" id="verifBtn" class="btn btn-cyan brown lighten-1">확인</button> 
            </div>
			<!-- Nickname -->
            <div class="md-form mt-0">
                <input type="text" id="nickname" class="form-control" name="nickname">
                <label for="nickname">닉네임</label>
            </div>
            
                    <!-- Password -->
            <div class="md-form mt-0">
                <input type="password" name="password" id="password" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock" >
                <label for="password">비밀번호</label>
            </div>
             <div class="md-form mt-0">
                <input type="password" name="password2" id="password2" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                <label for="password2">비밀번호 재입력</label>
            </div>
         
            <!-- Phone number  3 줄로 다 못받겠어서 1줄로만 받겠심-->
           <div class="md-form col-12">         	
	                <input type="text" id="phone1" name="phone" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock" maxlength="14">
	                <label for="phone1">연락처</label>
		   </div>
            <!-- Address -->
                    	
	         <div class="md-form mt-0">
	         <div class="md-form row-8">
	                <input type="text" id="postCode" name="address" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">
	                <label for="adress">주소</label>
	                <small id="adress" class="form-text text-muted mb-4"> 
	                </small>
	            </div>
	          
	               
	        </div>
	            <div class="md-form col">
	                <input type="text" id="address" name="address" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">
	            </div>
	            
	             <div class="md-form col">
	                <input type="text" id="extraAddress" name="address" class="form-control" aria-describedby="materialRegisterFormPhoneHelpBlock">
	             </div>
	             <input type="hidden" name="address" >
	           <div class="md-form row-4">
	             	<button type="button" class="btn btn-cyan brown lighten-1" onClick="daumjuso()">우편번호 찾기</button>
			</div>   
				
			<!-- HashTag -->
			 <div class="md-form mt">
				<div class="form-group">
		   			<div>
		   				<div class="formLabel">해시태그</div>
	     				 <input id='hashtagName' name="hashtagName" type='text' class='tags' >
					</div>
		   		</div>
		   	</div>
	   		
	   		
			<!--Profile	 -->
			
				 <div class="md-form col">
					  <div class="file-field">
					  <label for="profile">프로필 사진</label>
					    <div class="btn btn-brown lighten-1 btn-sm float-right">
					    	
					      <span>Choose file</span>
					      <input type="file" id="file" name="file" multiple/>
					     
					    </div>
					  </div>
				</div>
				
				<div class="form-group imgPreview">
	   				<div class="row col-lg-12 justify-content-center">
	   					<div id="preview">
		   					<div id="titlePreview"></div>
		   					<div id="authorPreview"></div>
		   					<div id="liberoImg"></div>
		   					<img src="" id="uploadPreview" width="100%" height="100%" style="display:none;">
	   					</div>
	   				</div>
	   			</div>
				<br><br>
			
			  <!-- Birth Date -->
			  
			 	<div class="md-form col">
			 		<input type="date" id="birthDate" name="birthDate" aria-describedby="materialRegisterFormPhoneHelpBlock">
			 		 <label for="birthDate">생년월일</label>
	               	
			 	</div>
			 	
			   
			  <!-- Gender Choose -->
			  <div class="md-form col">
			 	 <label for="genderCode">성별</label>
		           <div class="form-check form-check-inline">
					  <input type="radio" class="form-check-input" id="genderCode1" name="genderCode" value="m">
					  	<label class="form-check-label" for="men"><i class="fas fa-mars"></i></label>
					  </div>
					  <div	class="form-check form-check-inline">
					  <input type="radio" class="form-check-input" id="genderCode2" name="genderCode" value="f">
					  	<label class="form-check-label" for="women"><i class="fas fa-venus"></i></label>
					</div>
			  </div>
			  
			  



		
           	 	<button class="btn btn-outline-brown lighten-1 btn-rounded btn-block my-4 waves-effect z-depth-0" type="button" id="addBtn" onClick="addUser()">Sign in</button>

<!--              -->
        </form>
        <!-- Form -->

    </div>

</div>

</div>


</body>
<!--  해시태그 링크, 스크립트  -->
<link href="/libero/resources/css/taginput/jquery.tagsinput.min.css" rel="stylesheet">
	<script src="/libero/resources/javascript/taginput/jquery.tagsinput.min.js"></script>
<link rel="stylesheet" href="/libero/resources/css/common.css">

</html>