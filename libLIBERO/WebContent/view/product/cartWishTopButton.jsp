
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<style>
	.buttonDiv {
		background-color:#efebe9 ;
		cursor: pointer;
		border: 2px #efebe9  solid;
		padding:10px;
		width: 150px;
		height: 100px;
	}
	
	.buttonDiv > i {
		color: #a1887f;
		margin-bottom: 10px;
	}
	
	.buttonDiv:hover {
		cursor: pointer;
		border: 2px #a1887f solid;
	}
	.brown-text {
		font-size: 0.8em;
	}
</style>
<div class="row " style="margin-bottom: 20px">
	<!-- ///////////////////////////////////유저 마이페이지 버튼 ////////////////////////// -->
	<div class="col-lg-12 text-center d-flex justify-content-center">
		<div class="row" style="width: 80%">
			<div class="buttonDiv col" onclick="location.href='/libero/product/getWishList'">
				<i class="fas fa-heart fa-3x"></i>
				<p class="brown-text">위시리스트</p>
			</div>
			<div class="buttonDiv col" onclick="location.href='/libero/product/getCartList'">
				<i class="fas fa-shopping-cart fa-3x"></i>
				<p class="brown-text">장바구니</p>
			</div>
			
		</div>
	</div>
	
</div>

