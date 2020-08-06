<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<div class="row justify-content-center" style="margin-bottom: 100px">
	<button class="btn btn-brown">내정보</button>
	<a href="/libero/user/getTempPublishList" 
			class="btn btn-brown" role="button" 
			aria-pressed="true">내 활동 내역 조회</a>
	<a href="/libero/buy/getUserBuyList?userId=${sessionScope.user.userId}" 
			class="btn btn-brown" role="button" 
			aria-pressed="true">주문내역 조회</a>
	<a href="/libero/user/getUserPublishList?prodType=book" 
			class="btn btn-brown" role="button" 
			aria-pressed="true">판매중인 도서 및 상품 조회</a>
	<a href="/libero/user/getUserCash" 
			class="btn btn-brown" role="button" 
			aria-pressed="true">리베로캐쉬 조회</a>
	<a href="/libero/user/getUserReportList?menu=prod" 
		class="btn btn-brown" role="button" 
		aria-pressed="true">신고 조회</a> 
			
	<c:if test="${sessionScope.user.role == 'a'}">
		<a href="/libero/user/getUserList" 
			class="btn btn-brown" role="button" 
			aria-pressed="true">전체 회원 조회</a>  
    </c:if>
	
</div>