<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->

<tbody>
		  			
		  <c:set var="i" value="0" />
		  <c:forEach var="book" items="${book}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">
				
					${book.prodName}
					${book.bookCategory}
					${book.prodNo}
				</td>
          </c:forEach>
        
        </tbody>
        
        
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="book" items="${book}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">
				
					${book.prodNo} <br/>
					${book.prodName} <br/>
					${book.prodType} <br/>
					${book.retailPrice} <br/>
					${book.printPrice} <br/>
					${book.author} <br/>
					${book.purposeCode} <br/>
					${book.regDate} <br/>
					${book.discountCode} <br/>
					<h3>${book.bookCategory}</h3><br/>
				</td>
          </c:forEach>
        
        </tbody>
        
        <h6>확인확인확인</h6>
        <tbody>
		  			
		  <c:set var="i" value="0" />
		  <c:forEach var="book" items="${book}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">
				
					${book.prodName}
					${book.bookCategory}
					${book.prodNo}
				</td>
          </c:forEach>
        
        </tbody>


</body>
</html>