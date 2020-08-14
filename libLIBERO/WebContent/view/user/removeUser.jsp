<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
		<!-- Bootstrap Container Start -->
		<div class="container">
			<jsp:include page="topButton.jsp"></jsp:include>
			<h2><b>회원탈퇴</b></h2>
			<h6><b>유의사항</b></h6>
			<div style="border: 1px #eeeeee solid; background-color: #fafafa; padding: 10px;font-size: 0.8em;margin: 10px">
				- 회원 탈퇴 시 회원님께서 보유하셨던 <b>비현금성 캐시, 회원정보, 거래정보 등은 모두 삭제</b> 됩니다.<br/>
				- 회원 탈퇴 후 해지 및 재가입 방지를 목적으로 1개월간 회원의 성명, 아이디, 비밀번호, 로그기록을 보관합니다. 거래 정보가 있는 경우, 판매 거래 정보관리를 위하여
				구매와 관련된 상품정보, 아이디, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다.<br/>
				- 회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 탈퇴 전의 회원정보와 거래정보 및 캐시 정보등은 복구되지 않습니다.
			</div>
			<form>
				<div class="md-form form-group">
					<input type="checkbox" name="check" value="true"><span style="font-size: 0.8em">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</span>
				</div>
			<h6>회원 탈퇴를 위해 비밀번호를 입력해주세요</h6>
			
				<input type="hidden" name="userId" value="${user.userId}">
				<div class="md-form">
					<input id="pwd" type="password" name="password" class="form-control">
				</div>
				<div class="md-form" align="right">
					<button id="removeUser" type="button" class="btn btn-info brown lighten-1">탈퇴</button>
				</div>
			</form>
		</div>
		<!-- Bootstrap Container End -->
		<jsp:include page="../../common/footer.jsp"></jsp:include>
	</body>
	
	<script type="text/javascript">
		$(function(){
			$("#removeUser").on("click", function(){
				var passwd = "${user.password}";
				var passwd2 = $("#pwd").val();
				var check = $("input[name='check']:checked").val();
				
				console.log(check);
				if (passwd != passwd2) {
					
					Swal.fire({
						  icon: 'error',
						  text: '비밀번호가 다릅니다.'
						});
		    		return;
				}
				
				if (check != 'true') {
					
					Swal.fire({
						  icon: 'error',
						  text: '약관에 동의해주세요'
						});
		    		return;
				}
				
				if (passwd == passwd2) {
					if (check == 'true') {
						$("form").attr("method" , "POST").attr("action" , "/libero/user/removeUser").submit();
					}
					if (check != 'true') {
						Swal.fire({
							  icon: 'error',
							  text: '약관에 동의해주세요'
							});
			    		return;
					}
					
				}
			});
		});
	</script>
</html>