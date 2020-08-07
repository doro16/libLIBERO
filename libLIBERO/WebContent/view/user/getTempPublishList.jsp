<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 임시 저장 도서 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		
		<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row">
	   			<div class="col-lg-2">
	   				<a href="/libero/user/getTempPublishList" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">임시저장 도서</a>
	   			
		   			<a href="/libero/user/getUserActivityList?menu=p" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">작성한 글</a>
		   				
		   			<a href="/libero/user/getUserActivityList?menu=c" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">작성한 댓글</a>
		   				
		   			<a href="#" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">리뷰</a>
		   				
		   			<a href="/libero/user/getUserActivityList?menu=q" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 

		   				aria-pressed="true" style="margin-bottom: 10px">나의 문의</a>
		   		</div>
	   			<div class="row col-lg-9">
			  	<c:forEach var="prod" items="${list}">
				
					<div class="col-lg-3">
					    <div class="card" style="margin-bottom: 35px">
					      	<div class="card-body">
						        <h5 class="card-title">
						        		${prod.prodType eq 'paper' ? '종이책' : '전자책' }${prod.prodNo}
						        </h5>
						        <c:if test="${prod.prodName!=null}">
						        	<p>${prod.prodName}</p>
						        </c:if>
						        <c:if test="${prod.prodName==null}">
						        	<p>제목 없음</p>
						        </c:if>
						        <a href="/libero/publish/addManu?prodNo=${prod.prodNo}" class="">수정</a>
						        <a href="/libero/user/removeTempPublish?prodNo=${prod.prodNo}" class="">삭제</a>
					      </div>
					    </div>
				  	</div>
				  
				</c:forEach>
			</div>
	   		</div>
	   		
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
</html>