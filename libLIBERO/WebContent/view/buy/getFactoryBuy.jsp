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




<br><br><br><br>
<h1>주문번호 : ${payNo }</h1>

<div class="container">
 <c:set var="i" value="0" />
		  <c:forEach var="product" items="${product}">
			<c:set var="i" value="${ i+1 }" />
			
					
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


</body>
</html>