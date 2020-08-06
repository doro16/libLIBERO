<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<meta charset="utf-8">

<style>
#popupDiv { /* 팝업창 css */
	padding: 70px 30px 20px 30px;
	border-radius: 10px;
	position: absolute;
	background: #F9F9F9;
	width: 650px;
	display: none;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}
</style>
<script type="text/javascript">
	$(function() {
		var prodPost = $("input[name='prodPost']").val();
		if(prodPost.indexOf("prod")>=0){
			$("#prodForm").css("display", "block");
	        $("#postForm").css("display", "none");
		} else if (prodPost.indexOf("post")>=0){
			$("#postForm").css("display", "block");
	        $("#prodForm").css("display", "none");
		}
		
		
		$("#addPostReport").on("click", function() {
			var postNo = parseInt($("input[name='postNo']").val());
			var reportCount = parseInt($("input[name='reportCount']").val());
			var index = parseInt($("#reportSelect option:selected").val());
			var prodPost =  new String("post");
			alert("신고가 완료되었습니다.");
			if (reportCount >= 2) {
				alert("3회 이상 신고되어 게시글이 숨겨집니다. \n관리자에게 문의하세요");
			}
			$("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
			$("#popupDiv").css("display", "none"); //팝업창 display none
			$("body").css("overflow", "auto");//body 스크롤바 생성
	
		$.ajax({
					url : "/libero/report/json/addReport",
					method : "POST",
					dataType : "json",
	
					data : JSON.stringify({
						"postNo" : postNo,
						"index" : index,
						"prodPost" : prodPost
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
	
					}
				});
			}) //addPostReport
		
			$("#addProdReport").on("click", function() {
				var prodNo = parseInt($("input[name='prodNo']").val());
				var reportCount = parseInt($("input[name='reportCount']").val());
				var index = parseInt($("#reportSelect option:selected").val());
				var prodPost =  new String("prod");
				alert("신고가 완료되었습니다.");
				if (reportCount >= 2) {
					alert("3회 이상 신고되어 서점에서 도서가 숨겨집니다. \n관리자에게 문의하세요");
				}
				$("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
				$("#popupDiv").css("display", "none"); //팝업창 display none
				$("body").css("overflow", "auto");//body 스크롤바 생성
		
			$.ajax({
						url : "/libero/report/json/addReport",
						method : "POST",
						dataType : "json",
		
						data : JSON.stringify({
							"prodNo" : prodNo,
							"index" : index,
							"prodPost" : prodPost
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
		
						}
					});
				}) //addProdReport	
		

		$("#popup_mask").on("click", function() {
			$("#popup_mask").css("display", "none");
			$("#popupDiv").css("display", "none");
		})

		$("#reportBtn").click(
				function(event) { //팝업 Open 버튼 클릭 시 

					$("#popupDiv").css(
							{
								"top" : (($(window).height() - $("#popupDiv")
										.outerHeight()) / 2 + $(window)
										.scrollTop())
										+ "px",
								"left" : (($(window).width() - $("#popupDiv")
										.outerWidth()) / 2 + $(window)
										.scrollLeft())
										+ "px"
							//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

							});

					$("#popup_mask").css("display", "block"); //팝업 뒷배경 display block
					$("#popupDiv").css("display", "block"); //팝업창 display block
 					$("body").css("overflow","hidden");//body 스크롤바 없애기 
	});

	});
	
	
</script>
</head>

<body>



	<div id="popup_mask"></div>
	<!-- 팝업 배경 DIV -->

	<div id="popupDiv">
		<!-- 팝업창 -->
		<form id="prodForm">
			
			<p style='float: left; font-size: 17px; font-weight: 600;'>도서
				신고&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p style='font-size: 15px;'>신고하게 된 사유를 선택해주시기 바랍니다.</p>
			<hr style='border: solid 1px gray;'>

			<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
			<input type="hidden" id="reportCount" name="reportCount"
				value="${product.reportCount}">
			<p style='float: left; font-weight: 600; padding: 0px 30px 0px 0px;'>제&nbsp;&nbsp;목 :</p>
			<p>${product.prodName}</p>
			<p style='float: left; font-weight: 600; padding: 0px 30px 0px 0px;'>저&nbsp;&nbsp;자:</p>
			<p>${product.author} (${product.creator})</p>
			<hr>
			<select class="custom-select d-block w-100" id="reportSelect">
				<option value="1">성인본 정책 위반</option>
				<option value="2">허위 및 과장 상품</option>
				<option value="3">근거없는 욕설 및 비방</option>
				<option value="4">반복적 광고 및 홍보</option>
				<option value="5">타인의 명예인격권 침해</option>
				<option value="6">기타</option>
			</select> <br>
			<br><br><br><br><br><br><br>
			<button style='float: right;' class="btn btn-info" id="addProdReport" name="addProdReport">신고</button>
		</form>
		<form id="postForm">
			
			<p style='float: left; font-size: 17px; font-weight: 600;'>게시글
				신고&nbsp;&nbsp;&nbsp;&nbsp;</p>
			<p style='font-size: 15px;'>신고하게 된 사유를 선택해주시기 바랍니다.</p>
			<hr style='border: solid 1px gray;'>

			<input type="hidden" id="postNo" name="postNo" value="${post.postNo}">
			<input type="hidden" id="reportCount" name="reportCount"
				value="${post.reportCount}">
			<p style='float: left; font-weight: 600; padding: 0px 30px 0px 0px;'>제
				&nbsp;&nbsp;목 :</p>
			<p>${post.postName}</p>
			<p style='float: left; font-weight: 600; padding: 0px 30px 0px 0px;'>작성자
				:</p>
			<p>${post.user.nickname} (${post.user.userId})</p>
			<hr>
			<select class="custom-select d-block w-100" id="reportSelect">
				<option value="3">근거없는 욕설 및 비방</option>
				<option value="4">반복적 광고 및 홍보</option>
				<option value="5">타인의 명예인격권 침해</option>
				<option value="6">기타</option>
			</select> <br>
			<br><br><br><br><br><br><br>
			<button style='float: right;' class="btn btn-info" id="addPostReport" name="addPostReport">신고</button>
		</form>
	</div>




</body>

</html>