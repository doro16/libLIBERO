<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<meta charset="utf-8">

<style>
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
		

	});
	
	
</script>
</head>

<body>


		<!-- 팝업창 -->
		<form id="prodForm">
			
			<div class="modal fade" id="redModalSubscription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-notify modal-warning" role="document">
			    <!--Content-->
			    <div class="modal-content">
			      <!--Header-->
			      <div class="modal-header text-center">
			        <h4 class="modal-title white-text w-100 font-weight-bold py-2">Report</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true" class="white-text">&times;</span>
			        </button>
			      </div>
			
			      <!--Body-->
			      <div class="modal-body">
			        <div class="md-form mb-5">
			        	<div style="text-align:center;">
						<i class="far fa-file-alt fa-4x mb-3 animated rotateIn"></i>
						<p style='font-weight: 600;'>도서 신고</p>
						<p style='font-size: 14px;'>신고하게 된 사유를 선택해주시기 바랍니다.</p>
						</div>
						<hr style='border: solid 1px gray;'>
				        <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}">
						<input type="hidden" id="reportCount" name="reportCount"
							value="${product.reportCount}">
						<p style='float: left; font-weight: 600; padding: 0px 10px 0px 0px;'>제
							&nbsp;&nbsp;&nbsp;목 :</p>
						<p>${product.prodName}</p>
						<p style='float: left; font-weight: 600; padding: 0px 10px 0px 0px;'>작성자
							:</p>
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
						<br><br><br>
			        </div>
			      </div>
			
			      <!--Footer-->
			      <div class="modal-footer justify-content-center">
			        <a type="button" id="addProdReport" name="addProdReport" class="btn btn-outline-brown waves-effect">신고</a>
			      </div>
			    </div>
			    <!--/.Content-->
			  </div>
			</div>
			
		</form>
		
		<form id="postForm">
			<div class="modal fade" id="orangeModalSubscription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-notify modal-warning" role="document">
			    <!--Content-->
			    <div class="modal-content">
			      <!--Header-->
			      <div class="modal-header text-center">
			        <h4 class="modal-title white-text w-100 font-weight-bold py-2">Report</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true" class="white-text">&times;</span>
			        </button>
			      </div>
			
			      <!--Body-->
			      <div class="modal-body">
			        <div class="md-form mb-5">
			        	<div style="text-align:center;">
						<i class="far fa-file-alt fa-4x mb-3 animated rotateIn"></i>
						<p style='font-weight: 600;'>게시글 신고</p>
						<p style='font-size: 14px;'>신고하게 된 사유를 선택해주시기 바랍니다.</p>
						</div>
						<hr style='border: solid 1px gray;'>
				        <input type="hidden" id="postNo" name="postNo" value="${post.postNo}">
						<input type="hidden" id="reportCount" name="reportCount"
							value="${post.reportCount}">
						<p style='float: left; font-weight: 600; padding: 0px 10px 0px 0px;'>제
							&nbsp;&nbsp;&nbsp;목 :</p>
						<p>${post.postName}</p>
						<p style='float: left; font-weight: 600; padding: 0px 10px 0px 0px;'>작성자
							:</p>
						<p>${post.user.nickname} (${post.user.userId})</p>
						<hr>
						<select class="custom-select d-block w-100" id="reportSelect">
						<option value="3">근거없는 욕설 및 비방</option>
						<option value="4">반복적 광고 및 홍보</option>
						<option value="5">타인의 명예인격권 침해</option>
						<option value="6">기타</option>
						</select> <br>
						<br><br><br>
			        </div>
			      </div>
			
			      <!--Footer-->
			      <div class="modal-footer justify-content-center">
			        <a type="button" id="addPostReport" name="addPostReport" class="btn btn-outline-brown waves-effect">신고</a>
			      </div>
			    </div>
			    <!--/.Content-->
			  </div>
			</div>
		</form>




</body>

</html>