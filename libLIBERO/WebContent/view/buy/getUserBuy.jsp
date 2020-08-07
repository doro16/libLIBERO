<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/cdn.jsp"></jsp:include>
<jsp:include page="../toolbar.jsp"></jsp:include>


<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript">
function relocate(prodNo){
	self.location="/libero/product/getProduct/"+prodNo;	
}


</script>
	
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
		  <c:forEach var="getProduct" items="${getProduct}">
			<c:set var="i" value="${ i+1 }" />
			<script type="text/javascript">
			$(function(){
				$("#prodImg"+${i}).on("click",function(){
					self.location="/libero/product/getProduct/"+${getProduct.prodNo};
				})
			})
			</script>
			 <div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-7 align-self-center">
							  			<table>
							  				<tbody>
								  				<tr>
							  						<th>상품 이름</th>
							  						<td>: ${getProduct.prodName}</td>
								  					</tr>
							  					<tr>
							  						<th>상품 가격</th>
							  						<td>:  ${getProduct.retailPrice }</td>
							  					</tr>
							  					<tr>
							  						<th>상품 종류</th>
							  						<td>:  ${getProduct.prodType}</td>
							  					</tr>
							  					<tr>
							  						<%-- <th>구매 개수</th>
							  						<td>:  ${getPay.buyAmount}</td> --%>
							  					</tr>
							  					<tr><td><br><br><br><jsp:include page="/view/product/addReview.jsp"/></td></tr>
							  				</tbody>
							  			</table>
							  			
							  		</div>
<!-- 							  		여기는 테이블옆부분 -->
									<div class="view overlay zoom" >
									 <img src="/libero/resources/images/product/fileUpload/${getProduct.prodThumbnail }" class="img-thumbnail hoverable" alt="Responsive image" width= 200px onClick="relocate(${getProduct.prodNo})">
									  <div class="mask flex-center waves-effect waves-light" id="prodImg${i}">
									    <p class="white-text">상세정보</p>
									  </div>
									</div>
								</div>	
					  		<!-- row End -->
					  		
						</div>
					</div>
				
				
				
          </c:forEach>
          </div>
          </div>
          </div>
        
</body>



</body>
</html>
