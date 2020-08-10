<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 통계 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		<div class="container">
			<div style="padding-top: 20px"><h5 class="text-brown">월별 판매 통계</h5></div>
			<canvas id="dayChart" class="row col-lg-12"></canvas>
			<div class="row">
				<canvas id="genderChart" class="col-lg-6"></canvas>
				<canvas id="ageChart" class="col-lg-6"></canvas>
			</div>
		</div>
		<!-- <button type="button" class="btn px-3 btn-primary" onclick="shareSNS()"><i class="fab fa-twitter"></i></button>
 -->	</body>
	<script type="text/javascript">
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
					borderWidth: 2
				}
			]
		},
		options: {
			responsive: true
		}
	});
	</c:forEach>
	
	//gender
	var ctxP = document.getElementById("genderChart").getContext('2d');
	<c:set var="i" value="0" />
  	<c:forEach var="st" items="${gender}" >
	<c:set var="i" value="${ i+1 }" />
		var myPieChart = new Chart(ctxP, {
			type: 'pie',
			data: {
				labels: ["여성", "남성"],
				datasets: [{
					data: ["${st.female}", "${st.male}"],
					backgroundColor: ["#F7464A", "#46BFBD"],
					hoverBackgroundColor: ["#FF5A5E", "#5AD3D1"]
				}]
			},
			options: {
				responsive: true
			}
		});
	</c:forEach>
	
	//age
	var ctxP = document.getElementById("ageChart").getContext('2d');
	<c:set var="i" value="0" />
  	<c:forEach var="st" items="${age}" >
	<c:set var="i" value="${ i+1 }" />
		var myPieChart = new Chart(ctxP, {
			type: 'pie',
			data: {
				labels: ["10대", "20대","30대","40대"],
				datasets: [{
					data: ["${st.teenager}", "${st.twenty}","${st.thirty}","${st.forty}"],
					backgroundColor: ["#F7464A", "#46BFBD","#FDB45C", "#949FB1"],
					hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5"]
				}]
			},
			options: {
				responsive: true
			}
		});
	</c:forEach>
		
	function shareSNS() {
			var path = window.location.href;
            var url = "https://twitter.com/intent/tweet?text=내책"+${param.prodNo}+"&url="+path;
            var name = "공유하기";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            
            window.open(url, name, option);
		
	}
	</script>
</html>