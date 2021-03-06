<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<link rel="stylesheet" href="../resources/css/common.css">
	<jsp:include page="/view/toolbar.jsp"></jsp:include>

<meta charset="UTF-8">
<title>libLIBERO</title>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/libero/resources/css/taginput/jquery.tagsinput.min.css" rel="stylesheet">
	<script src="/libero/resources/javascript/taginput/jquery.tagsinput.min.js"></script>
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
//                 if(extraAddr !== ''){
//                     extraAddr = ' (' + extraAddr + ')';
//                 }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//             document.getElementById("postCode").value = data.zonecode;
            document.getElementById("receiverAddr").value = data.zonecode +" "+addr+" "+extraAddr;
            document.getElementById("receiverAddr").focus();
            // 커서를 상세주소 필드로 이동한다.
           
            
        }
   			 
    }).open();
}



/////////////////////////I'mport
  $(function(){
	  
    	$("#payment").on("click",function(){
    		if ($("input[id='receiverAddr']").val()=="") {
    			Swal.fire({
  				  icon: 'error',
  				  text: '주소를 입력해주세요.'
  				});
    			return;
			}
    		if ($("input[id='extraAddress']").val()=="") {
    			Swal.fire({
  				  icon: 'error',
  				  text: '상세주소를 입력해주세요.'
  				});
    			return;
			}
    		if ($("input[id='receiverName']").val()=="") {
    			Swal.fire({
  				  icon: 'error',
  				  text: '수령자 이름을 입력해주세요.'
  				});
    			return;
			}
    		if ($("input[id='receiverPhone']").val()=="") {
    			Swal.fire({
  				  icon: 'error',
  				  text: '수령자 연락처를 입력해주세요.'
  				});
    			return;
			}
    		if ($("#paymentOption").val()==null) {
    			Swal.fire({
    				  icon: 'error',
    				  text: '결제 방식을 선택해주세요.'
    				});
      			return;
			}
            var IMP = window.IMP; // 생략가능
            IMP.init('imp17527359'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
            var msg;
            IMP.request_pay({
                pg : 'html5_inicis',
                pay_method : $("#paymentOption").val(),
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '리브리베로 결제창',
                /* amount : $("#payment").val(), */
                amount : 100,
                buyer_email : $("#userId").val(),
                buyer_name : $("#receiverName").val(),
                buyer_tel : $("#receiverPhone").val(),
                buyer_addr :$("#receiverAddr").val()+ " "+$('#extraAddress').val()
               
                //m_redirect_url : 'http://www.naver.com'
            }, function(rsp) {
                if ( rsp.success ) {
                	var sendData = JSON.stringify({
                    	"payNo" : rsp.imp_uid,
                        "merchantUid" : rsp.merchant_uid,
                        "actualPrice" : rsp.paid_amount,
                        "paymentOption" : rsp.pay_method,
                        "payStatus" : rsp.status,
                        "receiverName" : rsp.buyer_name,
                        "receiverPhone" : rsp.buyer_tel,
                        "receiverAddr" : rsp.buyer_addr,
                        "buyerId" : '${user.userId}',
                        "deliveryRequest" : $("#deliveryRequest").val(),
                        "buyNoArray": ${buyNoArray}

                	})
                	
                    //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                    jQuery.ajax({
                        url: '/libero/buy/json/afterPay', //교체 하기
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json',
                        data: sendData
                    }).done(function(data,status) {
                        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                        if (status === 'success') {
                        	msg += '\n고유ID : ' + rsp.imp_uid;
                			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                			msg += '\결제 금액 : ' + rsp.paid_amount;
                			msg += '카드 승인번호 : ' + rsp.apply_num;
                			msg += '결제 일시 : '+rsp.paid_at;
                            
                			Swal.fire({
                				icon: 'error',
                				text: msg
                			});
                        } else {
                            //[3] 아직 제대로 결제가 되지 않았습니다.
                            //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                        	msg = '결제에 실패하였습니다. 다시 시도해 주세요.';
                            
                        	Swal.fire({
                				icon: 'error',
                				text: msg
                			});
                        }
                    });
                    swal({
                		text : "결제 완료",
                		icon : "info",
                		buttons:{
                			Home : {
                				text:"홈 으로",
                				value:"Home",
                			},
                			BuyList :{
                				text:"구매목록",
                				value:"BuyList",
                			},
                				},
                		
                	}).then((value) =>{
                		switch (value)     {
                			case "Home" :
                	 			window.location.href="/libero";
                				break;
                			
                			case "BuyList" : 
                				window.location.href="/libero/buy/getUserBuyList?userId=${user.userId}";
                		}
                	});
                    //성공시 이동할 페이지
                   // location.href='/libero';
                } else {
                    msg = '결제에 실패하였습니다.';
                    msg += '에러내용 : ' + rsp.error_msg;
                    //실패시 이동할 페이지
                   	<%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                    //alert(msg);
                    Swal.fire({
      				  icon: 'error',
      				  text: msg
      				});
                }
            });    
 
    		
    	})
    });    
    
  $(document).ready(function() {
	  
	  
	  
	  $("#ifinfoequals").on("click",function(){
		  var addr = "${user.address}";
		  var phone ="${user.phone}";
		  var name = "${user.name}";
			$("#receiverAddr").val(addr).focus()
			$("#receiverName").val(name).focus()
		  	$("#receiverPhone").val(phone).focus()
		  	
	  })
	  });
  
   
 
  
</script>

<style type="text/css">
#buyHeader h1{
	 width:500px;
    margin: 0 auto;
    text-align: center;
}
</style>


</head>
<body>


<div class="container">
<br><br><br>


<!-- <div class="sticky-top"><hr>결제 정보</div> -->

<!-- 		유저정보 보여주기 -->

<div class="card">
  <div class="card-body">
    <h4 class="card-title">구매자 정보</h4>
    <h6 class="card-subtitle mb-2 text-muted">*확인해 주세요</h6>
<!--     <p class="card-text"> -->
  <div class="md-form row">
	<div class="col-sm">
		구매자 아이디
	</div>
	<div class="col-sm">${user.userId }</div>
	<div class="col-sm"></div>
</div>
<div class="md-form row">
	<div class="col-sm">
		구매자 이름
	</div>
	<div class="col-sm">${user.name }</div>
	<div class="col-sm"></div>
</div>	
<div class="md-form row">
	<div class="col-sm">
		회원 주소 
	</div>
	<div class="col-sm">${user.address }</div>
	<div class="col-sm"></div>
</div>
<div class="md-form row">
	<div class="col-sm">
		구매자 연락처
	</div>
	<div class="col-sm">${user.phone }</div>
	<div class="col-sm"></div>
</div>
<!--     </p> -->
   </div>
  </div>
<!--   체크박스 -->
<br>
<br>
<div class="float-right">
	  <div class="custom-control custom-checkbox">
	    <input type="checkbox" class="custom-control-input" id="ifinfoequals">
	    <label class="custom-control-label" for="ifinfoequals"> 구매자와 수령자 정보가 동일</label>
	</div>
</div>
					<!-- 	입력 창 시작 -->

		<div class="md-form">
		  <input id="receiverAddr" type="text"  class="form-control" >
		  <label for="receiverAddr">주소입력</label>
		</div>
		<div class="md-form">
		  <input id="extraAddress" type="text" class="form-control" >
		  <label for="extraAddress">상세 주소 입력</label>
		</div>	
		<input type="button" class="btn btn-brown" onclick="daumjuso()" value="우편번호 찾기"><br>
		<div class="md-form">
		  <input id="receiverName" type="text"  class="form-control" >
		  <label for="receiverName">수령자 이름</label>
		</div>
		<div class="md-form">
		  <input id="receiverPhone" type="text"  class="form-control" >
		  <label for="receiverPhone">수령자 연락처</label>
		</div>
		<div class="md-form">
		  <input id="userId" type="text"  class="form-control" value="${user.userId }" disabled="disabled" >
		  <label for="userId">아이디(이메일)</label>
		</div>
		
		
		<div class="md-form dropdown">
		 <select class="browser-default custom-select custom-select-lg mb-3" id="paymentOption" name="paymentOption">
		  <option disabled selected >결제 방식</option>
		  <option value="card">카드</option>
		  <option value="phone">휴대폰 결제</option>
		  <option value="trans">실시간 계좌이체</option>
		 </select>
		</div>	
		<div class="form-group">
		  <label for="deliveryRequest">배송시 요청사항</label>
		  <textarea class="form-control" id="deliveryRequest" name="deliveryRequest"rows="5"></textarea>
		</div>		
		
<input type="hidden" id="buyNoArray" value="${buyNoArray }">
					<!-- 결제 상품시작 -->


<c:set var="i" value="0" />
		  <c:forEach var="prod" items="${productList}">
			<c:set var="i" value="${ i+1 }" />
			
			<h4>상품 정보</h4>
						 <div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-7 align-self-center">
							  			<table>
							  			<thead valign="top">
							  				<tbody>
								  				<tr>
							  						<th>상품 이름</th>
							  						<td>: ${prod.prodName}</td>
								  					</tr>
							  					<tr>
							  						<th>상품 가격</th>
							  						<td>:  ${prod.retailPrice }</td>
							  					</tr>
							  					<tr>
							  						<th>상품 종류</th>
							  						<td>:  ${prod.prodType}</td>
							  					</tr>
							  					<tr>
							  						<th>구매 수량</th>
							  						<td>:  ${prod.buyAmount}</td>
							  					</tr>
							  					<tr><th><td>
							  									  					
							  					</tr>
							  				</tbody>
							  			</table>
<%-- 							  			<br><br><br><jsp:include page="/view/product/addReview.jsp"/> --%>
							  		</div>
<!-- 							  		여기는 테이블옆부분 -->
									<div class="view overlay zoom" >
									 <img src="/libero/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail }" class="img-thumbnail hoverable" alt="Responsive image" width= 200px onClick="relocate(${prod.prodNo})">
									  <div class="mask flex-center waves-effect waves-light" id="prodImg${i}">
									   
									  </div>
									</div>
								</div>	
					  		<!-- row End -->
					  		
						</div>
					</div>
	
</c:forEach>
					<!-- 결제 버튼 여기 -->


<div class="mx-auto" style="width: 200px; background-color: rgba(86,61,124,.15);">
 <button id ="payment" class="btn btn-brown" value="${actualPrice}"> 총 결제 금액 &nbsp; : &nbsp; ${actualPrice} &nbsp; ￦</button>
 



</div>
</div>


</body>
<jsp:include page="/common/footer.jsp"></jsp:include>

</html>