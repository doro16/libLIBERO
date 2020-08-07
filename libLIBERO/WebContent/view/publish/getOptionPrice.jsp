<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 인쇄옵션 가격 조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.formLabel {
				font-size: 20px;
				color: #795548;
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
			.hrColor {
				border-color: #795548;
			}
			figure figcaption {
			    text-align: center;
			    font-size: 12px;
			}
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   	
	   		<div class="row">
		   		<div class="col-lg-12">
		   			<div class="formLabel">인쇄옵션 가격 조회</div>
		   			<hr class="hrColor">
		   		</div>
	   		</div>
	   		
	   		<form>
	   			<input type="hidden" name="userId" value="${sessionScope.user.userId}">
		   		<div class="row">
			   		<div class="col-lg-6">
			   			<div style="font-family: 'Nanum Gothic', sans-serif; margin-bottom: 10px">컬러 가격</div>
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="color">
					   				<img src="../resources/images/publish/book_black.png" width="100px" height="65px" >
					   				<figcaption>흑백</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="blackPrice" value="${user.blackPrice}">
					   			<p class="col-lg-6">${user.blackPrice}원</p>
				   			</div>
			   			</div>
			   			<div class="row justify-content-center">
			   				<div class="col-lg-5">
					   			<figure class="color">
					   				<img src="../resources/images/publish/book_color.png" width="100px" height="65px" >
					   				<figcaption>컬러</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="colorPrice" value="${user.colorPrice}">
					   			<p class="col-lg-6">${user.colorPrice}원</p>
				   			</div>
			   			</div>
			   		</div>
			   		<div class="col-lg-6">
			   			<div style="font-family: 'Nanum Gothic', sans-serif; margin-bottom: 10px">규격 가격</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/size_a5.png" width="60px" height="80px" >
					   				<figcaption>A5</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="a5Price" value="${user.a5Price}">
					   			<p class="col-lg-6">${user.a5Price}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/size_b5.png" width="60px" height="80px" >
					   				<figcaption>B5</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="b5Price" value="${user.b5Price}">
					   			<p class="col-lg-6">${user.b5Price}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/size_a4.png" width="60px" height="80px" >
					   				<figcaption>A4</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="a4Price" value="${user.a4Price}">
					   			<p class="col-lg-6">${user.a4Price}원</p>
				   			</div>
			   			</div>
			   			
			   		</div>
		   		</div>
	   			<div class="row">
	   			
	   				<div class="col-lg-12">
	   					<div style="font-family: 'Nanum Gothic', sans-serif; margin-bottom: 10px">재질 가격</div>
	   					<hr class="hrColor">
	   				</div>
	   				
	   				<div class="col-lg-6">
	   					<div style="font-family: 'Nanum Gothic', sans-serif; margin-bottom: 10px">표지 재질</div>
	   					
	   					<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/cover.png" width="60px" height="60px" >
					   				<figcaption>스노우</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="snowPrice" value="${user.snowPrice}">
					   			<p class="col-lg-6">${user.snowPrice}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/cover.png" width="60px" height="60px" >
					   				<figcaption>몽블랑</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="montPrice" value="${user.montPrice}">
					   			<p class="col-lg-6">${user.montPrice}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/cover.png" width="60px" height="60px" >
					   				<figcaption>아트</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="artePrice" value="${user.artePrice}">
					   			<p class="col-lg-6">${user.artePrice}원</p>
				   			</div>
			   			</div>
			   			
	   				</div>
	   				
	   				<div class="col-lg-6">
	   					<div style="font-family: 'Nanum Gothic', sans-serif; margin-bottom: 10px">내지 재질</div>
	   					
	   					<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/white.png" width="60px" height="60px" >
					   				<figcaption>백상지</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="whitePrice" value="${user.whitePrice}">
					   			<p class="col-lg-6">${user.whitePrice}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/ivory.png" width="60px" height="60px" >
					   				<figcaption>미색지</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="ivoryPrice" value="${user.ivoryPrice}">
					   			<p class="col-lg-6">${user.ivoryPrice}원</p>
				   			</div>
			   			</div>
			   			
			   			<div class="row justify-content-center">
				   			<div class="col-lg-5">
					   			<figure class="size">
					   				<img src="../resources/images/publish/cover.png" width="60px" height="60px" >
					   				<figcaption>갱지</figcaption>
					   			</figure>
				   			</div>
				   			<div class="md-form form-group col-lg-5">
					   			<input class="col-lg-6" type="text" name="roughPrice" value="${user.roughPrice}">
					   			<p class="col-lg-6">${user.roughPrice}원</p>
				   			</div>
			   			</div>
			   			
	   				</div>
	   			</div>
	   		</form>
	   		<div class="row justify-content-center">
	   			<button class="btn btn-info brown lighten-1 btn-block" onclick="update()" name="updateGet">수정</button>
	   			<button class="btn btn-info brown lighten-1 btn-block" onclick="submit()" name="updatePost">수정완료</button>
	   		</div>
	   	</div>
	   	<!-- ///////////// Bootstrap Container End ////////////////// -->
	</body>
	<script type="text/javascript">
		$(function(){
			var colorWidth = $(".color img").width();
		    $(".color").width(colorWidth);
		    var sizeWidth = $(".size img").width();
		    $(".size").width(sizeWidth);
		     
		    $("input").hide();
		    $("button[name='updatePost']").hide();
		});
		
		function update() {
			$("input").show();
			$("p").hide();
			$("button[name='updateGet']").hide();
			$("button[name='updatePost']").show();
		}
		
		function submit() {
			var tableArray = [];
			
			$("form").find("input[type='text']").each(function(idx, input){
			     tableArray.push($(input).val());
			});
			tableArray.shift();
			
			for (var i = 0; i < tableArray.length; i++) {
				if (tableArray[i]=="") {
					alert("모든 가격을 등록해주세요.");
				}
			}

			$("form").attr("method" , "POST").attr("action" , "/libero/publish/updateOptionPrice").submit();
		}
	</script>
</html>