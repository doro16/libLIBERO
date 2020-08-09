<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<jsp:include page="/view/toolbar.jsp"></jsp:include>
	
<head>
	<script type="text/javascript">
	
	function relocate(payNo,userId){
		self.location="/libero/buy/getUserBuy?userId="+userId+"&payNo="+payNo;
	}
	

	
	</script>
		
	
<meta charset="UTF-8">
<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
<title>libLIBERO</title>
</head>
<body>

<div class="container">	
<jsp:include page="/view/user/topButton.jsp"></jsp:include>
<div class="row">
<div class="col-lg-2">
		   			<a href="/libero/user/getUserPublishList?prodType=book" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">도서</a>
		   				
		   			<a href="/libero/user/getUserPublishList?prodType=prod" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true">서비스상품</a>
</div>
<div class="col">

			
  <c:set var="i" value="0" />
		  <c:forEach var="buyList" items="${buyList}">
			<c:set var="i" value="${ i+1 }" />
			
			<script>
			$(function(){
				
				var payNo =	$("#forajaxPayNo"+${i}).val();
				var deliveryStatus = $("#forajaxDeliverystat"+${i}).val();
					//alert("결제 번호 , 배송상태 번호 : "+payNo+","+deliveryStatus)
				$("#forajaxDeliverystat"+${i}).on("click",function(){
				//alert("you are in the function now"); 
			$.ajax({
				url:"/libero/buy/json/updateDeliveryStatus/"+payNo+'/'+deliveryStatus,
				method:"GET",
				dataType:"json",
				headers:{
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success:function(result){
					
					//alert(result.result);
					$("#forajaxDeliverystat"+${i}).val(result.result)
					$("#listSelect${i}").attr("value",result.result);
 					$(".col-md-8${i}").remove();
					
						//alert('하하호호');
						if(result.result ==5){
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						$("#forajaxDeliverystat${i}").attr("value",result.result);
					}else if(result.result==3){
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li  id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li class="active" id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						
					}else if(result.result==4){
						
						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
								+"<li id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
								+'<span class="label">상품 준비 중</span>'+'</a>'
								+'</li>'
								+"<li  id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
								+'</li>'
								+'<li  id="listSelect${i}">'
								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
								+'</li>'
								+"<li class='active' id='listSelect${i}'>"
								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
								+'</li></ul>'+'</div>');
						
					}
					
						
				}
				
					})
				})
			}) 
			
			</script>
			
			<tr>
								<td align="left"  title="Click : 주문정보 확인">
				
					
		 <div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-8 align-self-center">
							  			<table>
							  				<tbody>
							  					<tr>
							  						<th>결제 번호</th>
							  						<td>: ${buyList.payNo}</td>
							  					</tr>
							  					
								  					<tr>
								  						<th>결제 상태</th>
								  						<td>: ${buyList.payStatus=='paid' ? '결제 완료' : 'db값 바꿔' }</td>
								  					</tr>
							  					
							  					<tr>
							  						<th>결제 수단</th>
							  						<c:if test="${buyList.paymentOption == 'card' }">
							  						<td>:  ${buyList.paymentOption=='card' ? '카드' : 'db바꿔'}</td>
							  						</c:if>
							  						<c:if test="${buyList.paymentOption == 'phone' }">
							  						<td>:  ${buyList.paymentOption=='phone' ? '휴대폰 결제' : 'db바꿔'}</td>
							  						</c:if>
							  						<c:if test="${buyList.paymentOption == 'trans' }">
							  						<td>:  ${buyList.paymentOption=='trans' ? '계좌 이체' : 'db바꿔'}</td>
							  						</c:if>
							  					</tr>
							  					<tr>
							  					<th>수령자 이름</th>
							  						<td>:  ${buyList.receiverName}</td>
							  					</tr>
							  					<tr>	
							  					<th>수령자 주소</th>
							  						<td>:  ${buyList.receiverAddr}</td>
							  					</tr>
							  					<tr>
							  					<th>수령 연락처</th>
							  						<td>:  ${buyList.receiverPhone}</td>
							  					</tr>
							  					<tr>
							  						<th>결제 금액</th>
							  						<td>:  ${buyList.actualPrice} ￦</td>
							  					</tr>
							  					<tr>
							  						<th>결제 날짜</th>
							  						<td>:  ${buyList.payDate}</td>
							  					</tr>
							  					
							  					<tr>
							  						
							  					</tr>
							  					
							  				</tbody>
							  				
							  			</table>
							  			
							  		</div>
<!-- 							  		여기는 테이블옆부분 -->
									<div class="col-lg-4">
							  		<button id="forajaxPayNo${i}" class="btn btn-brown lighten-3 btn-lg btn-block" value="${buyList.payNo}" onClick="relocate('${buyList.payNo}','${sessionScope.user.userId }');" >상품정보 보기</button>
							  		<br>
							  		<br>
							  		<c:if test="${buyList.deliveryStatus == 4 }">
							  		<button class="btn btn-brown lighten-3 btn-lg btn-block"value="${buyList.deliveryStatus }" id="forajaxDeliverystat${i}"><i class="fas fa-receipt"></i>물품 수령</button>
							  		</c:if>
							  		<c:if test="${buyList.deliveryStatus == 5 }">
							  		<button class="btn btn-brown lighten-3 btn-lg btn-block"value="${buyList.deliveryStatus }" id="forajaxDeliverystat${i}" disabled><i class="fas fa-receipt"></i>수령 완료</button>
							  		</c:if>
							  		<c:if test="${buyList.deliveryStatus != 4 && buyList.deliveryStatus != 5}">
					  				<button class="btn btn-brown lighten-3 btn-lg btn-block"value="${buyList.deliveryStatus }" id="forajaxDeliverystat${i}" disabled><i class="fas fa-receipt"></i>물품 수령</button>
							  		</c:if>
							  		
							  		</div>
							  		
							</div>	
					  		<!-- row End -->
					  		
							
						</div>
					</div>
					<!-- 결제 완료 후, 제작 준비 중 -->
					
</tr>
<div class="row${i}">

  <div class="col-md-8${i}">

    <!-- Stepers Wrapper -->
    <ul class="stepper stepper-horizontal">

      <!-- First Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 1 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-cubes"></i></span>
          <span class="label">상품 준비 중</span>
        </a>
      </li>

      <!-- Second Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 2 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-clipboard"></i></span>
          <span class="label"><font color="gray">제작 중</font></span>
        </a>
      </li>

      <!-- Third Step -->
      <li id="listSelect${i}" class="${buyList.deliveryStatus == 3 ? 'active' : '' }">
        <a href="#!">
          <span class="circle"><i class="fas fa-rocket"></i></span>
          <span class="label"><font color="gray">배송 중</font></span>
        </a>
      </li>
	<!-- Forth Step -->
	  <li id="listSelect${i}" class="${buyList.deliveryStatus == 4 ? 'active' : '' }">
	  	<a href="#!">
	  		<span class="circle" ><i class="fas fa-exclamation"></i></span>
	  		<span class="label"><font color="gray">물품 도착</font></span>
	  	</a>
	  	</li>
    </ul>
    <!-- /.Stepers Wrapper -->

  </div>
</div>

		 
				
			
          </c:forEach>
          
         </div>
          </div>
          </div>		
</body>
</html>