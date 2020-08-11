<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="/common/cdn.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/css/common.css">
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
	<button class="btn btn-outline-brown waves-effect btn-block" aria-pressed="true" style="margin-bottom: 10px" disabled>주문 상세</button>
		   				
	
  </div>

<div class="col">
 <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }"/>
			<div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-7 align-self-center">
						<table>
							  				<tbody>
								  				
							  					<tr>
							  						<th colspan="2">도서명</th>
							  						<td>:  ${product.prodName }</td>
							  					</tr>
							  					<tr >
							  						<th colspan="2">도서 수량</th>
							  						<td>:  ${product.buyAmount}</td>
							  					</tr>
							  					<tr>
							  						<th colspan="2">페이지 수</th>
							  						<td>:  ${product.bookPage}</td>
							  					</tr>
							  					<tr>
							  						<th colspan="2">색상 유무</th>
							  						<td>:  ${product.colorType == 'color' ? '칼라' : '흑백'}</td>
							  					</tr>
							  					<tr>
							  						<th colspan="2">종이 규격</th>
							  						<td>:  ${product.sizeType} 용지</td>
							  					</tr>
							  					<tr>
							  					
							  						<th colspan="2">표지 재질</th>
							  						<c:if test="${product.coverType == 'snow' }">
							  						<td>: 스노우지
							  						</c:if>
							  						<c:if test="${product.coverType == 'mont' }">
							  						<td>: 몽블랑지
							  						</c:if>
							  						<c:if test="${product.coverType == 'arte' }">
							  						<td>: 아트지
							  						</c:if>
							  					</tr>
							  					<tr>
							  						<th colspan="2">내지 재질</th>
							  						<c:if test="${product.innerType == 'white' }">
							  						<td>: 화이트지
							  						</c:if>
							  						<c:if test="${product.innerType == 'ivory' }">
							  						<td>: 미색지
							  						</c:if>
							  						<c:if test="${product.innerType == 'rough' }">
							  						<td>: 갱지
							  						</c:if>

							  					</tr>
											</tbody>
											</table>
											</div>
													<div class="col-lg-5 align-self-center">
													
													<div class="view overlay zoom row-8" >
													
													 <img width=300px src="/libero/resources/images/publish/fileUpload/coverFile/${product.prodThumbnail}">
													  <div class="mask flex-center waves-effect waves-light">
													     <a href="/libero/resources/images/publish/fileUpload/coverFile/${product.prodThumbnail}" download="coverfile"><p class="black-text">다운로드</p></a>
													  </div>
													</div>
							  						<div class="row-2">
							  						<a href="/libero/resources/images/publish/fileUpload/manuFile/${product.manuFile}" download="manuFile"><button class="btn btn-outline-warning waves-effect" type="button">원고 파일</button></a>
							  						</div>
							  						</div>
							  						
							  					
		</div>
		
		</div>
</div>

          </c:forEach>     
               
      
</div>
</div>
</div>

</body>
<jsp:include page="/common/footer.jsp"></jsp:include>
</html>