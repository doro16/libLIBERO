<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>libLIBERO</title>
		
<jsp:include page="/common/cdn.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/css/common.css">
<jsp:include page="../toolbar.jsp"></jsp:include>
<script type="text/javascript">
function relocate(payNo){
	self.location="/libero/buy/getFactoryBuy?payNo="+payNo;
}
</script>
</head>
<body>
	<div class ="container">
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
	<input type="checkbox" id="deleteDone">
	<label for="deleteDone">완료물품 제거</label>
	 <c:set var="i" value="0"/>
		  <c:forEach var="factorylist" items="${factorylist}">
			<c:set var="i" value="${ i+1 }" />
				<script>
			$(function(){
				var payNo =	$("#forajaxPayNo"+${i}).val();
				var deliveryStatus = $("#forajaxDeliverystat"+${i}).val();
					//alert("결제 번호 , 배송상태 번호 : "+payNo+","+deliveryStatus);
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
					//$("#listSelect${i}").attr("value",result.result);
 					//$(".col-md-8${i}").remove();					
						//alert('하하호호');
						if(result.result ==2){
							swal("책 제작을 시작합니다.","","success")
// 						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
// 								+"<li id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
// 								+'<span class="label">상품 준비 중</span>'+'</a>'
// 								+'</li>'
// 								+"<li class='active' id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
// 								+'</li>'
// 								+'<li id="listSelect${i}">'
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
// 								+'</li>'
// 								+"<li id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
// 								+'</li></ul>'+'</div>');
						//$("#forajaxDeliverystat${i}").attr("value",result.result);
						//$("#forajaxDeliverystat${i}").remove();
						$("#forajaxDeliverystat${i}").replaceWith(
								'<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat'+${i}+'"><i class="fas fa-check"></i>&nbsp;제작 완료</button>'
								)
					}else if(result.result==3){
							swal("제작을 완료 했습니다.","","success")
// 						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
// 								+"<li id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
// 								+'<span class="label">상품 준비 중</span>'+'</a>'
// 								+'</li>'
// 								+"<li  id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
// 								+'</li>'
// 								+'<li class="active" id="listSelect${i}">'
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
// 								+'</li>'
// 								+"<li id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
// 								+'</li></ul>'+'</div>');							
							$("#forajaxDeliverystat${i}").replaceWith(
									'<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat'+${i}+'"><i class="fas fa-truck-loading"></i>&nbsp;배송 시작</button>'
									)
					}else if(result.result==4){
							swal("배송을 시작했습니다.","","success")
// 						$(".row${i}").html('<div class="col-md-8'+${i}+'">'+'<ul class="stepper stepper-horizontal">'
// 								+"<li id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle">'+'<i class="fas fa-cubes">'+'</i>'+'</span>'
// 								+'<span class="label">상품 준비 중</span>'+'</a>'
// 								+'</li>'
// 								+"<li  id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-clipboard"></i></span>'+'<span class="label"><font color="gray">제작 중</font></span>'+'</a>'
// 								+'</li>'
// 								+'<li  id="listSelect${i}">'
// 								+'<a href="#!">'+'<span class="circle"><i class="fas fa-rocket"></i></span>'+'<span class="label"><font color="gray">배송 중</font></span>'+'</a>'
// 								+'</li>'
// 								+"<li class='active' id='listSelect${i}'>"
// 								+'<a href="#!">'+'<span class="circle" ><i class="fas fa-exclamation"></i></span>'+'<span class="label"><font color="gray">배송 완료</font></span>'+'</a>'
// 								+'</li></ul>'+'</div>');
							//$("#forajaxDeliverystat${i}").remove();
							$("#forajaxDeliverystat${i}").replaceWith(
									'<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat'+${i}+'" disabled><i class="fas fa-truck-moving"></i>배송 중</button>'
									)
					}
						
										
				}			
					})
				})
				
				$("#deleteDone").on("click",function(){
					$("#card${i}:contains('배송')").remove();
					
				})
			})
			
			</script>
			
					

			
			<div class="card border-light mb-3" style="margin-bottom: 20px" id="card${i}">
			
				<div class="card-body">
				<div class="row">
				<div class="col-8">
									<table>
							  				<tbody>
							  					<tr>
							  						<th>결제 번호</th>
							  						<td>  &nbsp;:  &nbsp; ${factorylist.payNo}</td>
							  					</tr>
							  					
								  					<tr>
								  						<th>결제 상태</th>
								  						<td>  &nbsp;:  &nbsp; ${factorylist.payStatus == "paid" ? "결제 완료" : 'db값 바꿔' }</td>
								  					</tr>
							  					
							  					<tr>
							  						<th>결제 수단</th>
							  						<c:if test="${factorylist.paymentOption == 'card' }">
							  							<td>  &nbsp;:  &nbsp; ${factorylist.paymentOption=='card' ? '카드' : 'db바꿔'}</td>
							  						</c:if>
							  						<c:if test="${factorylist.paymentOption == 'phone' }">
							  							<td>  &nbsp;:  &nbsp;  ${factorylist.paymentOption=='phone' ? '휴대폰 결제' : 'db바꿔'}</td>
							  						</c:if>
							  						<c:if test="${factorylist.paymentOption == 'trans' }">
							  							<td>  &nbsp;:  &nbsp; ${factorylist.paymentOption=='trans' ? '계좌 이체' : 'db바꿔'}</td>
							  						</c:if>
							  					</tr>
							  					<tr>
							  					<th>수령자 이름</th>
							  						<td>  &nbsp;:  &nbsp;  ${factorylist.receiverName}</td>
							  					</tr>
							  					<tr>	
							  					<th>수령자 주소</th>
							  						<td>  &nbsp;:  &nbsp;  ${factorylist.receiverAddr}</td>
							  					</tr>
							  					<tr>
							  					<th>수령자 연락처    &nbsp;&nbsp; </th>
							  						<td>  &nbsp;:  &nbsp;  ${factorylist.receiverPhone}</td>
							  					</tr>
							  					<tr>
							  						<th>결제 금액</th>
							  						<td>  &nbsp;:  &nbsp;  ${factorylist.actualPrice} ￦</td>
							  					</tr>
							  					<tr>
							  						<th>결제 날짜</th>
							  						<td>  &nbsp;:  &nbsp;  ${factorylist.payDate}</td>
							  					</tr>
							  					
							  					<tr>
							  						
							  					</tr>
							  					
							  				</tbody>
							  				
							  			</table>
							  		 	</div>
									<div class="col-4">
							  		<button id="forajaxPayNo${i}" class="btn btn-brown lighten-3 btn-lg btn-block" value="${factorylist.payNo}" onClick="relocate('${factorylist.payNo}');" >상품정보 보기</button>
							  		<br>
							  		<br id="brcanhavename${i }">
							  		<c:if test="${factorylist.deliveryStatus == 1 }">
							  		<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat${i}"><i class="fas fa-play"></i>&nbsp;제작 시작</button>
							  		</c:if>
							  		<c:if test="${factorylist.deliveryStatus == 2 }">
							  		<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat${i}" ><i class="fas fa-check"></i>제작 완료</button>
							  		</c:if>
							  		<c:if test="${factorylist.deliveryStatus == 3}">
					  				<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat${i}" ><i class="fas fa-truck-loading"></i>배송 시작</button>
							  		</c:if>
							  		<c:if test ="${factorylist.deliveryStatus == 4 }">
							  		<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat${i}" disabled><i class="fas fa-truck-moving"></i>배송 중</button>
							  		</c:if>
							  		<c:if test ="${factorylist.deliveryStatus == 5 }">
							  		<button type="button" class="btn btn-brown lighten-3 btn-lg btn-block"value="${factorylist.deliveryStatus }" id="forajaxDeliverystat${i}" disabled><i class="fas fa-book-reader"></i>배송 완료</button>
							  		</c:if>
							  		</div>
						</div>
						</div>
						
							</div>
							</tr>
						
						
						
			
					
<%-- 	<div class="row${i}">					 --%>
<%--   <div class="col-md-8${i}"> --%>
<!--     Stepers Wrapper -->
<!--     <ul class="stepper stepper-horizontal"> -->

<!--       First Step -->
<%--       <li id="listSelect${i}" class="${factorylist.deliveryStatus == 1 ? 'active' : '' }"> --%>
<!--         <a href="#!"> -->
<!--           <span class="circle"><i class="fas fa-cubes"></i></span> -->
<!--           <span class="label">상품 준비 중</span> -->
<!--         </a> -->
<!--       </li> -->

<!--       Second Step -->
<%--       <li id="listSelect${i}" class="${factorylist.deliveryStatus == 2 ? 'active' : '' }"> --%>
<!--         <a href="#!"> -->
<!--           <span class="circle"><i class="fas fa-clipboard"></i></span> -->
<!--           <span class="label"><font color="gray">제작 중</font></span> -->
<!--         </a> -->
<!--       </li> -->

<!--       Third Step -->
<%--       <li id="listSelect${i}" class="${factorylist.deliveryStatus == 3 ? 'active' : '' }"> --%>
<!--         <a href="#!"> -->
<!--           <span class="circle"><i class="fas fa-rocket"></i></span> -->
<!--           <span class="label"><font color="gray">배송 중</font></span> -->
<!--         </a> -->
<!--       </li> -->
<!-- 	<!-- Forth Step -->
<%-- 	  <li id="listSelect${i}" class="${factorylist.deliveryStatus == 4 ? 'active' : '' }"> --%>
<!-- 	  	<a href="#!"> -->
<!-- 	  		<span class="circle" ><i class="fas fa-exclamation"></i></span> -->
<!-- 	  		<span class="label"><font color="gray">배송 완료</font></span> -->
<!-- 	  	</a> -->
<!-- 	  	</li> -->
<!--     </ul> -->
<!--     /.Stepers Wrapper -->

<!--   </div> -->
<!--   </div>    -->
  
          </c:forEach>
       </div>
          </div>
       </div> 

</body>
<jsp:include page="/common/footer.jsp"></jsp:include>
</html>