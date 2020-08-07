<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 원고 등록</title>
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
			
			#file {
				margin-top: 60px;
				margin-bottom: 60px;
			}
			
		</style>
	</head>
	
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<!-- 아이콘 들어갈자리 -->
	   		<div class="col-lg-12 text-center">
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
				      	<li class="active">
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
	   		</div>
	   		<!-- 원고파일 등록 폼 Start -->
	   		<form>
	   			<input type="hidden" name="prodNo" value="${prod.prodNo}">
	   			<div class="form-group">
	   				<label class="formLabel col-lg-12" for="manuFile">원고 파일 등록</label>
	   				<div align="center">
	   					<c:if test="${prod.manuFile!=null}">
	   						등록된 파일 : ${prod.manuFile}<br/>
	   					</c:if>
				        <input type="file" id="file" name="file" onchange="checkFile(this)"><br/>
			    	</div>
	   			</div>
	   			<div class="form-group" align="center">
		      		<button type="button" class="btn btn-info brown lighten-1 btn-block" 
		      			onclick="addManu()">
		      			도서 정보 등록
		      		</button>
			  	</div>
	   		</form>
	   		<!-- form End -->
	   	</div>
	   	<!-- //////////// Bootstrap Container End/////////////////// -->
	</body>
	<script type="text/javascript">
	//================ form submit ======================
	function addManu() {
		var file = $("#file").val();
		var manuFile = "${prod.manuFile}";
		
		if (file=="") {
			if (manuFile!=null || manuFile !="") {
				$("form").attr("method" , "POST").attr("action" , "/libero/publish/addManu").attr("enctype","multipart/form-data").submit();
			}else{
			/* alert("파일을 업로드 해주세요"); */
			Swal.fire({
				  icon: 'error',
				  text: '파일을 업로드 해주세요.'
				});
			return;
			}
		}
		$("form").attr("method" , "POST").attr("action" , "/libero/publish/addManu").attr("enctype","multipart/form-data").submit();
	}
	//============== check file exc =====================
	function checkFile(f) {
		
		var file = f.files;
		
		if(!/\.(docx|pdf)$/i.test(file[0].name)) {
			Swal.fire({
				  icon: 'error',
				  text: 'docx, pdf 파일만 업로드 가능합니다.'
				});
		} else {
			return;
		}
		
		f.outerHTML = f.outerHTML;
	}
	</script>
</html>