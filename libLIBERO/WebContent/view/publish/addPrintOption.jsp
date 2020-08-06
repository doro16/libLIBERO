<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 종이책 인쇄 옵션 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		
		<style type="text/css">
			
			.formLabel {
				font-size: 15px;
				color: #795548;
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
			.tableLabel {
				font-size: 15px;
				color: #795548;
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				padding-left: 5px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
			.hrColor {
				border-color: #795548;
			}
			.typeSelector {
				font-size: 12px;
			}
			.typeSelector input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.black {
				background-image: url(../resources/images/publish/book_black.png);
			}
			.color {
				background-image: url(../resources/images/publish/book_color.png);
			}
			.a5 {
				background-image: url(../resources/images/publish/size_a5.png);
			}
			.b5 {
				background-image: url(../resources/images/publish/size_b5.png);
			}
			.a4 {
				background-image: url(../resources/images/publish/size_a4.png);
			}
			.cover {
				background-image: url(../resources/images/publish/cover.png);
			}
			.white {
				background-image: url(../resources/images/publish/white.png);
			}
			.ivory {
				background-image: url(../resources/images/publish/ivory.png);
			}
			.colorType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:182px; height:125px;
			    margin-top: 10px;
			    padding-top: 130px;
			}
			.sizeType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:80px; height:90px;
			    margin-top: 10px;
			    padding-top: 110px;
			}
			.coverType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:90px; height:90px;
			    margin-top: 10px;
			}
			input[type="radio"]:checked + label {
    			border: black 1px solid;
			}
			.rightform {
				float: right;
				position: -webkit-sticky; /* Safari */
				position: sticky;
				top: 0;
				min-height: 100%;
				height: 100%;
				background-color: red;
			}
			.detail {
				height: auto;
				background-color: #FFFFFF;
				border: #a1887f 1px solid;
				padding: 20px;
				font-size: 15px;
			}
			th {
				padding: 10px;
			}
		</style>
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<!-- Horizontal Steppers -->
			<div class="row">
				<div class="col-md-12">
			
			    <!-- Stepers Wrapper -->
			    <ul class="stepper stepper-horizontal">
			
			    	<!-- First Step -->
			    	<li class="completed">
			        	<a href="#!">
			          		<span class="circle">1</span>
			          		<span class="label">인쇄옵션 등록</span>
			        	</a>
			      	</li>
			
			      	<!-- Second Step -->
			      	<li>
			        	<a href="#!">
			          		<span class="circle">2</span>
			          		<span class="label">원고 등록</span>
			        	</a>
			      	</li>
			
			      	<!-- Third Step -->
			      	<li>
				        <a href="#!">
				          	<span class="circle">3</span>
				          	<span class="label">도서 정보 등록</span>
				        </a>
			     	</li>
			     	
			     	<!-- Fourth Step -->
			      	<li>
				        <a href="#!">
				          	<span class="circle">4</span>
				          	<span class="label">가격 책정</span>
				        </a>
			     	</li>
				
			    </ul>
			    <!-- /.Stepers Wrapper -->
			
			  	</div>
			</div>
			<!-- /.Horizontal Steppers -->
	   		<c:if test="${param.prodType=='paper'}">
	   		<!-- ////////////////// paper form Start /////////////////////-->
			<form>
				<input type="hidden" name="prodType" value="paper">
				<div class="form-group col-lg-4 rightform">
					<div class="row justify-content-right">
						<div class="tableLabel brown lighten-2">상세정보</div>
					</div>
					<div class="row detail text-left">
						<table>
							<tbody>
								<tr>
									<th>제본 방식</th>
									<td>: 무선제본</td>
								</tr>
								<tr>
									<th>컬러</th>
									<td id="colorType">: 흑백 도서</td>
								</tr>
								<tr>
									<th>책 규격</th>
									<td id="sizeType">: A5(148*210mm)</td>
								</tr>
								<tr>
									<th>표지 재질</th>
									<td id="coverType">: 스노우지(스노우 250g, 무광)</td>
								</tr>
								<tr>
									<th>내지 재질</th>
									<td id="innerType">: 백상지 90g</td>
								</tr>
								<tr>
									<th>페이지 수</th>
									<td>: <input type="number" name="bookPage" id="bookPage" onblur="pageCount()">pages</td>
								</tr>
								<!-- <tr>
									<th>책 등 두께</th>
									<td id="thickness">: </td>
								</tr>  -->
							</tbody>
						</table>
					</div>	
					<div class="row justify-content-right">
						<div class="tableLabel brown lighten-2 col">인쇄소 선택</div>
					</div>
					<div class="row detail text-left">
						<table>
							<tbody>
								<c:set var="i" value="0" />
								<c:forEach var="user" items="${list}">
									<tr>
										<td><input type="radio" name="factoryId" value="${user.userId}"></td>
										<th>${user.nickname}</th>
										<td class="text-right" id="price${i}"></td>
									</tr>
									<c:set var="i" value="${ i+1 }" />
								</c:forEach>
							</tbody>
						</table>
					</div>			
				</div>
				<!-- 컬러선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="colorType">도서 컬러 선택</label>
				    <div class="row col-lg-7 justify-content-center d-flex">
					    <div class="p-3">
	                    	<input type="radio" name="colorType" value="black" id="black" checked>
	                        <label class="colorType black text-center" for="black"><b>흑백</b><br/>(표지:컬러  내지:흑백)</label>
	                    </div>
	                    <div class="p-3">
	                        <input type="radio" name="colorType" value="color" id="color">
	                        <label class="colorType color text-center" for="color"><b>컬러</b><br/>(표지:컬러  내지:컬러)</label>
                        </div>
                    </div>
				</div>
				<!-- 컬러선택 End -->
				<!-- 종이 규격 선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="sizeType">책 규격 선택</label>
					<div class="row col-lg-7 justify-content-center d-flex">
						<div class="p-4">
							<input type="radio" name="sizeType" value="a5" id="a5" checked>
							<label class="sizeType a5 text-center" for="a5"><b>A5</b><br/>148*210mm<br/>일반도서</label>
						</div>
						<div class="p-4">
							<input type="radio" name="sizeType" value="b5" id="b5">
							<label class="sizeType b5 text-center" for="b5"><b>B5</b><br/>182*257mm<br/>문제지, 잡지</label>
						</div>
						<div class="p-4">
							<input type="radio" name="sizeType" value="a4" id="a4">
							<label class="sizeType a4 text-center" for="a4"><b>A4</b><br/>210*297mm<br/>문제지, 잡지</label>
						</div>
					</div>
				</div>
				<!-- 종이 규격 선택 End -->
				<!-- 표지 재질 선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="coverType">표지재질 선택</label>
					<div class="row col-lg-7 justify-content-center d-flex">
						<div class="p-4">
							<input type="radio" name="coverType" value="snow" id="snow" checked>
							<label class="coverType cover text-center rounded-circle" for="snow"><br/><br/><br/><br/><br/><b>스노우</b><br/></label>
						</div>
						<div class="p-4">
							<input type="radio" name="coverType" value="mont" id="mont">
							<label class="coverType cover text-center rounded-circle" for="mont"><br/><br/><br/><br/><br/><b>몽블랑</b><br/></label>
						</div>
						<div class="p-4">
							<input type="radio" name="coverType" value="arte" id="arte">
							<label class="coverType cover text-center rounded-circle" for="arte"><br/><br/><br/><br/><br/><b>아트</b><br/></label>
						</div>
					</div>
				</div>
				<!-- 표지 재질 선택 End -->
				<!-- 내지 재질 선택 Start -->
				<div class="form-group typeSelector">
					<label class="formLabel col-lg-7" for="innerType">내지재질 선택</label>
					<div class="row col-lg-7 justify-content-center d-flex">
						<div class="p-4">
							<input type="radio" name="innerType" value="white" id="white" checked>
							<label class="coverType white text-center rounded-circle" for="white"><br/><br/><br/><br/><br/><b>백상지</b><br/></label>
						</div>
						<div class="p-4">
							<input type="radio" name="innerType" value="ivory" id="ivory">
							<label class="coverType ivory text-center rounded-circle" for="ivory"><br/><br/><br/><br/><br/><b>미색지</b><br/></label>
						</div>
						<div class="p-4">
							<input type="radio" name="innerType" value="rough" id="rough">
							<label class="coverType cover text-center rounded-circle" for="rough"><br/><br/><br/><br/><br/><b>갱지</b><br/></label>
						</div>
					</div>
				</div>
				<!-- 내지 재질 선택 End -->
				<div class="form-group md-form" align="center">
		      		<button type="button" class="btn btn-brown lighten-1 btn-block" 
		      			onclick="addPrintOption()">
		      			원고 등록
		      		</button>
			  	</div>
			</form>
			</c:if>
			<!-- ////////////////// paper form End ////////////////////// -->
			<!-- /////////////////////eBook form Start/////////////////// -->
			<c:if test="${param.prodType=='ebook'}">
				<form>
					<input type="hidden" name="prodType" value="ebook">
					<div class="form-group md-form" align="center">
						<p>전자책은 인쇄옵션을 선택하지 않습니다. 페이지수를 입력해주세요.</p>
						<input type="number" name="bookPage" id="bookPage">pages
			  		</div>
			  		<div class="form-group md-form" align="center">
			  			<button type="button" class="btn btn-info brown lighten-1 btn-block" 
			      			onclick="addPrintOption()">
			      			원고 등록
			      		</button>
			  		</div>
			  		
				</form>
			</c:if>
	   	</div>
	   	<!-- ///////////// Bootstrap Container End ////////////////// -->
	</body>
	<script type="text/javascript">
		//============= Event Start =====================
		$(function(){
			$("input").attr("onclick","selectType(); pageCount()");
			
		});
		//============= 옵션 선택 Event=====================
		function selectType() {
			
			var colorType = $("input[name='colorType']:checked").val();
			var sizeType = $("input[name='sizeType']:checked").val();
			var coverType = $("input[name='coverType']:checked").val();
			var innerType = $("input[name='innerType']:checked").val();
			
			if (colorType=="color") {
				$("#colorType").html(": 컬러 도서");
			} else {
				$("#colorType").html(": 흑백 도서");
			}
			
			if (sizeType=="a5") {
				$("#sizeType").html(": A5(148*210mm)");
			}else if(sizeType=="b5") {
				$("#sizeType").html(": B5(182*257mm)");
			}else if(sizeType=="a4") {
				$("#sizeType").html(": A4(210*297mm)");
			}
			
			if (coverType=="snow") {
				$("#coverType").html(": 스노우지(스노우 250g, 무광)");
			}else if (coverType=="mont") {
				$("#coverType").html(": 몽블랑지(몽블랑 210g, 무광)");
			}else if (coverType=="arte") {
				$("#coverType").html(": 아트지(아트 210g, 무광)");
			}
			
			if (innerType=="white") {
				$("#innerType").html(": 백상지 90g");
			}else if (innerType=="ivory") {
				$("#innerType").html(": 미색지 90g");
			}else if (innerType=="rough") {
				$("#innerType").html(": 갱지 54g");
			}
		}
		
		//================ form submit ======================
		function addPrintOption() {
			var userId = "${sessionScope.user.userId}";
			var phoneCode = "${sessionScope.user.phoneCode}";
			var prodType = "${param.prodType}";
			var pages = $("#bookPage").val();
			
			if (userId=="") {
				Swal.fire({
					  icon: 'error',
					  text: '로그인 해주세요.'
					});
				return;
			}
			if (phoneCode!=1) {
				Swal.fire({
					  icon: 'error',
					  text: '휴대폰 본인인증을 완료한 회원만 가능합니다.'
					});
				return;
			}
			if (pages==null) {
				Swal.fire({
					  icon: 'error',
					  text: '페이지 수를 입력해주세요.'
					});
				return;
			}
			if (prodType=="paper") {
				if ($("input[name='factoryId']:checked").val()==null) {
					Swal.fire({
						  icon: 'error',
						  text: '인쇄소를 선택해주세요.'
						});
					return;
				}
			}
			
			
			$("form").attr("method" , "POST").attr("action" , "/libero/publish/addPrintOption").submit();
		}
		//======================== 인쇄비 계산 Event =================
		function pageCount() {
			var pages = $("#bookPage").val();
			var colorPrice = new Array();
			var blackPrice = new Array();
			var a5Price = new Array();
			var b5Price = new Array();
			var a4Price = new Array();
			var snowPrice = new Array();
			var montPrice = new Array();
			var artePrice = new Array();
			var whitePrice = new Array();
			var ivoryPrice = new Array();
			var roughPrice = new Array();
			var colorType = $("input[name='colorType']:checked").val();
			var sizeType = $("input[name='sizeType']:checked").val();
			var coverType = $("input[name='coverType']:checked").val();
			var innerType = $("input[name='innerType']:checked").val();
			
			<c:forEach items="${list}" var="user">
				colorPrice.push("${user.colorPrice}");
				blackPrice.push("${user.blackPrice}");
				a5Price.push("${user.a5Price}");
				b5Price.push("${user.b5Price}");
				a4Price.push("${user.a4Price}");
				snowPrice.push("${user.snowPrice}");
				montPrice.push("${user.montPrice}");
				artePrice.push("${user.artePrice}");
				whitePrice.push("${user.whitePrice}");
				ivoryPrice.push("${user.ivoryPrice}");
				roughPrice.push("${user.roughPrice}");
			</c:forEach>
			//한권당 인쇄비 계산 = 컬러+표지비+((규격+내지비용)x페이지수)
			for (var i = 0; i <= colorPrice.length; i++) {
				var color = colorType=="color" ? colorPrice[i] : blackPrice[i];
				var size = sizeType=="a5" ? a5Price[i] : sizeType=="b5" ? b5Price[i] : a4Price[i];
				var cover = coverType=="snow" ? snowPrice[i] : coverType=="mont" ? montPrice[i] : artePrice[i];
				var inner = innerType=="white" ? whitePrice[i] : innerType=="ivory" ? ivoryPrice[i] : roughPrice[i];
				$("#price"+i).html(parseInt(color)+parseInt(cover)+((parseInt(size)+parseInt(inner))*pages)+"원");
			}
		}
	</script>
</html>