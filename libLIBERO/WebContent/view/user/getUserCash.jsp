<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 리베로캐쉬 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
		</style>
	</head>
	<body>
	
	<input type="hidden" id="cashMessage" name="cashMessage" value="${cashMessage}"/>
		
		
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row col-lg-12" style="margin: 10px">
	   		<c:if test="${!empty cashCode && cashCode eq 'bf'}">
	   			<h1>현재 정산 전</h1> &nbsp;&nbsp;
	   			<button type="button" class="btn btn-outline-warning waves-effect" id="reqWithdraw" name="reqWithdraw"><i class="fas fa-comments-dollar mr-1"></i> 정산 신청</button>
	   		</c:if>
	   		<c:if test="${!empty cashCode && cashCode eq 'af'}">
	   			<h1>정산 신청 완료</h1><br/>
	   		</c:if>
	   		</div>
	   		<div class="row col-lg-12" style="margin: 10px">
	   			<h6>정산일 : <input type='month' id='currentMonth' style="background-color:transparent;border:0 solid black;text-align:right;" readonly>15일</h6>
	   		</div>
	   		<div class="row text-center" style="text-align:center; float:center;margin: 10px">
	   			<div class="col-lg-3">
	   				<h6><strong>누적 정산금</strong></h6>${cash.cashAmount}원
	   			</div>
	   			<div class="col-lg-3">
	   				<h6><strong>현재 정산 가능한 가격</strong></h6>${cash.cashCurrent}원
	   			</div>
	   			<div class="col-lg-3">
	   				<h6><strong>신청한 정산 가격</strong></h6>${cash.cashWithdraw}원
	   				
	   			</div>
	   		</div>
	   		<div class="row d-flex justify-content-center"  style="margin: 10px">
	   			<canvas id="dayChart" id="dayChart" class="row col-lg-12"></canvas>
	   		</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	   	
	   	<!-- //////////// MORAL START ////////////////// -->
	   	<div class="modal fade" id="modalreqWithdrawForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">정산 신청</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5" >
          <i class="fas fa-chevron-down prefix grey-text"></i> &nbsp;
          <div>
          <select class="mdb-select md-form">
		  	<option value="" disabled selected>Choose your Bank</option>
			<option value="기업">기업은행</option>
			<option value="농협">농협은행</option>
			<option value="국민">국민은행</option>
			<option value="우리">우리은행</option>
			<option value="SC제일">SC제일은행</option>
			<option value="한국씨티">한국씨티은행</option>
			<option value="신한">신한은행</option>
		</select>
		</div>
        </div>
        
        

        <div class="md-form mb-4">
          <i class="fas fa-pen prefix grey-text"></i>
          <input type="text" id="defaultForm-pass" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Your Account Number</label>
        </div>
        
         <div class="md-form mb-4">
          <i class="fas fa-pen prefix grey-text"></i>
          <input type="text" id="withDraw" name="withDraw" class="form-control validate">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">정산 금액 입력</label>
        </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button id="inputWithdraw" class="btn btn-default">신청</button>
      </div>
    </div>
  </div>
</div>
<!-- //////////// MORAL END ////////////////// -->

	</body>
	<script type="text/javascript">
	
	 document.getElementById('currentMonth').value= new Date().toISOString().slice(0, 7);
	 
	 
	//monthly
	var ctxL = document.getElementById("dayChart").getContext('2d');
	<c:set var="i" value="0" />
  	<c:forEach var="st" items="${day}" >
	<c:set var="i" value="${ i+1 }" />
	
	var myLineChart = new Chart(ctxL, {
		type: 'line',
		data: {
			labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월","8월","9월","10월","11월","12월"],
			datasets: [
				{
					label: "판매량",
					data: ["${st.jan}", "${st.feb}", "${st.mar}", "${st.apr}", "${st.may}", "${st.jun}", "${st.jul}","${st.aug}","${st.sep}","${st.oct}","${st.nov}","${st.dec}"],
					backgroundColor: ['rgba(255, 204, 102, .4)',],
					borderColor: ['rgba(255, 204, 102, .7)',],
					borderwith: 2
				}
			]
		},
		options: {
			responsive: true
		}
	});
	</c:forEach>
	
	$(function(){
		
		var cashMessage = $("#cashMessage").val();
		if(cashMessage ==  '0'){
			
			Swal.fire({
				  icon: 'error',
				  title: '정산 신청 불가',
				  text: '정산 가능한 가격을 초과하였습니다.',
				})
		}
		
		$("#reqWithdraw").on("click", function(){
			$('#modalreqWithdrawForm').modal('show');
		})
		
		$("#inputWithdraw").on("click", function(){
			var withDraw = $("#withDraw").val();
			window.location.href = "/libero/user/requestCash/"+withDraw;
		})
	})
	</script>
</html>