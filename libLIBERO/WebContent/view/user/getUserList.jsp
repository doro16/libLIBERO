<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 전체 회원 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
		
			body {
				font-family:'GyeonggiBatang';
			}
		
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<form>
	   		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		   	<table class="table table-hover table-striped" width="100%">
				<thead>
					<tr>
						<th class="text-center">No</th>
						<th>회원ID</th>
					    <th>회원 상태</th>
					    <th>회원 코드</th>
					    <th>정산 상태</th>
					    <th>가입 일자</th>
					</tr>  
				</thead>
				<tbody>
		   		<c:set var="i" value="0" />
			  	<c:forEach var="user" items="${list}">
				<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${i}</td>
						<td><a href="/libero/user/getUser?userId=${user.userId}">${user.userId}</a></td>
						<td>
							<c:if test="${user.userCode==1}">
								정상
							</c:if>
							<c:if test="${user.userCode==0}">
								탈퇴
							</c:if>
						</td>
						<td>
							<c:if test="${user.role=='a'}">
								관리자
							</c:if>
							<c:if test="${user.role=='f'}">
								인쇄소
							</c:if>
							<c:if test="${user.role=='u'}">
								유저
							</c:if>
						</td>
						<td>
							<c:if test="${user.cashCode=='af'}">
							<button type="button" class="btn btn-outline-warning waves-effect" id="okWithdraw" name="okWithdraw"><i class="fas fa-comments-dollar mr-1"></i> 정산</button>
								<input type="hidden" value="${user.userId}"/>
							</c:if>
						</td>
						<td>${user.regDate}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</form>
			<jsp:include page="../../common/pageNavigator_new.jsp"/>
	   	</div>
		<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
	   	$("form").attr("method" , "POST").attr("action" , "/libero/user/getUserList").submit();
	}
	
	$(function(){
		$("button[id^='okWithdraw']").on("click", function(){
			
			alert("정산 완료");
				
			var userId = $(this).next().val();
			window.location.href = "/libero/user/updateCash/"+userId;
		});	
	})
	</script>
</html>