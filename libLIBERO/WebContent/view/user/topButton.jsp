<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<div class="row " style="margin-bottom: 20px">
	<!-- ///////////////////////////////////유저 마이페이지 버튼 ////////////////////////// -->
	<div class="col-lg-12 text-center">
		<a href="/libero/user/getUser" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">내 정보 조회</a>
		<a href="/libero/user/getTempPublishList" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">내 활동 내역 조회</a>
		<a href="/libero/buy/getUserBuyList?userId=${sessionScope.user.userId}" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">주문내역 조회</a>
		<a href="/libero/user/getUserPublishList?prodType=book" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">판매중인 도서 및 상품 조회</a>
		<a href="/libero/user/getUserCash" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">리베로캐쉬 조회</a>
	</div>
	
	<!-- //////////////////관리자 마이페이지 버튼/////////////////////////////////  -->
	<div class="col-lg-12 text-center">
		<c:if test="${sessionScope.user.role == 'a'}">
			<a href="/libero/user/getUserReportList?menu=prod" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">신고 조회</a> 
			
			<a href="/libero/user/getUserList" 
				class="btn btn-info brown lighten-1" role="button" 
				aria-pressed="true">전체 회원 조회</a>  
	    </c:if>
	</div>
	<!-- ///////////////////////////////관리자 버튼 끝 //////////////////////////////////// -->
	
	<!-- /////////////////////////////인쇄소 마이페이지 버튼////////////////////////////// -->
	<div class="col-lg-12 text-center">
		<c:if test="${sessionScope.user.role == 'f'}">
			<c:if test="${sessionScope.user.colorPrice==''}">
				<a href="/libero/publish/addOptionPrice" 
					class="btn btn-info brown lighten-1" role="button" 
					aria-pressed="true">인쇄 가격 등록</a> 
			</c:if>
			<c:if test="${sessionScope.user.colorPrice!=''}">
				<a href="/libero/publish/getOptionPrice" 
					class="btn btn-info brown lighten-1" role="button" 
					aria-pressed="true">인쇄 가격 조회</a> 
			</c:if>
	    </c:if>
	</div>
	<!-- ///////////////////////////인쇄소 버튼 끝//////////////////////////////////// -->
</div>