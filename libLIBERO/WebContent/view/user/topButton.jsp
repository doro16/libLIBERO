<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<style>
	.buttonDiv {
		background-color:#bcaaa4;
		cursor: pointer;
		border: 2px #bcaaa4 solid;
		padding:10px;
		width: 150px;
		height: 100px;
	}
	
	.buttonDiv > i {
		color: #8d6e63;
		margin-bottom: 10px;
	}
	
	.buttonDiv:hover {
		cursor: pointer;
		border: 2px #8d6e63 solid;
	}
	.brown-text {
		font-size: 0.8em;
	}
</style>
<div class="row " style="margin-bottom: 20px">
	<!-- ///////////////////////////////////유저 마이페이지 버튼 ////////////////////////// -->
	<div class="col-lg-12 text-center d-flex justify-content-center">
		<div class="row" style="width: 80%">
			<div class="buttonDiv col" onclick="location.href='/libero/user/getUser'">
				<i class="fas fa-user-edit fa-3x"></i>
				<p class="brown-text">내정보 조회</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/user/getTempPublishList'">
				<i class="fas fa-clipboard-list fa-3x"></i>
				<p class="brown-text">내 활동 내역 조회</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/buy/getUserBuyList?userId=${sessionScope.user.userId}'">
				<i class="fas fa-money-bill-alt fa-3x"></i>
				<p class="brown-text">주문 내역 조회</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/user/getUserPublishList?prodType=book'">
				<i class="fas fa-pen-nib fa-3x"></i>
				<p class="brown-text">판매 도서/상품 조회</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/user/getUserCash'">
				<i class="fas fa-hand-holding-usd fa-3x"></i>
				<p class="brown-text">리베로캐쉬 조회</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/user/getUserReportList?menu=prod'">
				<i class="fas fa-bell fa-3x"></i>
				<p class="brown-text">신고 조회</p>
			</div>
		</div>
	</div>
	<c:if test="${sessionScope.user.role == 'a'}">
	<!-- //////////////////관리자 마이페이지 버튼/////////////////////////////////  -->
	<div class="col-lg-12 text-center d-flex justify-content-center">
			<div class="row" style="width: 80%">
				<div class="buttonDiv col" onclick="location.href='/libero/user/getUserReportList?menu=prod'">
					<i class="fas fa-bell fa-3x"></i>
					<p class="brown-text">신고 조회</p>
				</div>
				<div class="buttonDiv col" onclick="location.href='/libero/user/getUserList'">
					<i class="fas fa-users fa-3x"></i>
					<p class="brown-text">전체 회원 조회</p>
				</div>
			</div>
	</div>
	<!-- ///////////////////////////////관리자 버튼 끝 //////////////////////////////////// -->
	</c:if>
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