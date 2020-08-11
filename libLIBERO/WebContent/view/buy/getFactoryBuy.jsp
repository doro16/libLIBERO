<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/common.css">
<jsp:include page="/common/cdn.jsp"></jsp:include>
<jsp:include page="../toolbar.jsp"></jsp:include>
<script type="text/javascript">
function relocate(prodNo){
	self.location="/libero/product/getProduct?prodNo="+prodNo;
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
<h1>주문번호 : ${payNo }</h1>
<div class="col">
 <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
			
			<div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-7 align-self-center">
						<table>
							  				<tbody>
								  				<tr>
							  						<th>도서 번호(책페이지 이동 가능)</th>
							  						<td>: ${getProduct.prodName}</td>
								  					</tr>
							  					<tr>
							  						<th>도서명</th>
							  						<td>:  ${getProduct.retailPrice }</td>
							  					</tr>
							  					<tr>
							  						<th>표지 사진</th>
							  						<td>:  ${getProduct.prodType}</td>
							  					</tr>
							  					<tr>
							  						<th>주문 날짜</th>
							  						<td>:  ${getProduct.buyAmount}</td>
							  					</tr>
							  					<tr>
							  						<th>원고 파일</th>
							  						<td>:  ${getProduct.buyAmount}</td>
							  					</tr>
							  					<tr><th><td>
				<td align="center"><b>${ i }</b></td>
					<td align="center"  title="Click : 주문정보 확인" >
						
						
						책 번호 	: ${product.prodNo} <br/>
						책 이름 	: ${product.prodName} <br/>
						표지 사진	:<img src="/libero/resources/images/product/fileUpload/${product.prodThumbnail}">  <br/>
						주문 날짜	: ${product.regDate} <br/>
						지은이	: ${product.author} <br/>
						원고 파일	: ${product.manuFile} <br/>
						페이지 수	: ${product.bookPage} <br/>
						흑백 유무	: ${product.colorType} <br/>
						종이 규격	: ${product.sizeType} <br/>
						표지 재질	: ${product.coverType} <br/>
						내지 재질	: ${product.innerType} <br/>
					</td>	
							
          </c:forEach>
          
      </div>
      
</div>
</div>
</body>
</html>