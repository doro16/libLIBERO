<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 도서정보 등록</title>
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
			.freeSelect input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.imgSelector input{
		    	margin:0;padding:0;
		    	-webkit-appearance:none;
		       	-moz-appearance:none;
		        appearance:none;
			}
			.picture {
				background-image: url(../resources/images/publish/freeTemplate/picture/picture.png);
			}
			.icon {
				background-image: url(../resources/images/publish/freeTemplate/icon/icon.png);
			}
			.img {
				background-image: url(../resources/images/publish/freeTemplate/img/image.png);
			}
			.img1 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t1_preview.png);
			}
			.img2 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t2_preview.png);
			}
			.img3 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t3_preview.png);
			}
			.img4 {
				background-image: url(../resources/images/publish/freeTemplate/picture/t4_preview.png);
			}
			.imgType{
			    cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:82px; height:100px;
			    margin-top: 10px;
			    padding-top: 105px;
			    font-size: 12px;
			}
			.imgSelect {
				cursor:pointer;
			    background-size:contain;
			    background-repeat:no-repeat;
			    display:inline-block;
			    width:145px; height:100px;
			    margin-top: 10px;
			}
			input[type="radio"]:checked + label {
    			border: black 1px solid;
			}
			#preview {
				width: 510px; height: 340px;
				border: 1px black solid;
				background-size: cover;
				position: relative;
			}
			#titlePreview {
				position: absolute;
				top: 55px;
				left: 345px; /*계산해서 스크립트로 추가*/
				float: right;
			}
			
			#authorPreview {
				position: absolute;
				top: 90px;
				left: 430px; /*계산해서 스크립트로 추가*/
				float: right;
				font-size: 12px;
			}
			
			#preview #liberoImg {
				position: absolute;
				bottom:5px;
				right:0px;
				background-image: url("../resources/images/common/logo.png");
				background-size: cover;
				width: 80px; height: 20px;
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
				      	<li class="completed">
				        	<a href="#!">
				          		<span class="circle">2</span>
				          		<span class="label">원고 등록</span>
				        	</a>
				      	</li>
				
				      	<!-- Third Step -->
				      	<li class="active">
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
	   		<!-- 도서정보 등록 폼 Start -->
	   		<form>
	   			<input type="hidden" name="prodNo" value="${prod.prodNo}">
	   			<input type="hidden" name="prodType" value="${prod.prodType}">
	   			<!-- 표지타입 선택 Start -->
	   			<div class="form-group">
	   				<label class="formLabel" for="coverSelect">표지 등록</label>
	   				<div class="col-lg-12">
	   					<input type="radio" name="coverSelect" value="freeTemplate" onclick="checkCover()" checked>무료 템플릿
	   				</div>
	   				<div class="col-lg-12">
	   					<input type="radio" name="coverSelect" value="fileUpload" onclick="checkCover()">직접 올리기
	   				</div>
	   			</div>
	   			<!-- 표지타입 선택 End -->
	   			<!-- 무료템플릿 선택 Start -->
	   			<!-- 타입 선택 Start -->
	   			<div class="form-group freeSelect">
	   				<div class="row col-lg-12 justify-content-left d-flex">
	   					<div class="p-3">
			   				<input type="radio" name="imgType" value="picture" id="picture" checked>
			   				<label class="picture imgType text-center" for="picture"><b>사진형</b></label>
			   			</div>
			   			<div class="p-3">
			   				<input type="radio" name="imgType" value="icon" id="icon">
			   				<label class="icon imgType text-center" for="icon"><b>아이콘형</b></label>
		   				</div>
		   				<div class="p-3">
			   				<input type="radio" name="imgType" value="img" id="img">
			   				<label class="img imgType text-center" for="img"><b>이미지형</b></label>
		   				</div>
	   				</div>
	   			</div>
	   			<!-- 타입선택 End -->
	   			<!-- 이미지 선택 Start -->
	   			<div class="form-group imgSelector">
	   				<div class="row col-lg-12 justify-content-left d-flex">
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t1" id="img1">
	   						<label class="img1 imgSelect text-center" for="img1"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t2" id="img2">
	   						<label class="img2 imgSelect text-center" for="img2"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t3" id="img3">
	   						<label class="img3 imgSelect text-center" for="img3"></label>
	   					</div>
	   					<div class="p-2">
	   						<input type="radio" name="imgSelect" value="t4" id="img4">
	   						<label class="img4 imgSelect text-center" for="img4"></label>
	   					</div>
	   				</div>
	   			</div>
	   			<!-- 이미지 선택 End -->
	   			
	   			<!-- 직접 올리기 Start -->
	   			<div id="fileUpload" style="text-align: left">
		   			<div class="form-group md-form" align="center">
		   				<div class="formLabel" style="text-align: left">도서 썸네일</div>
		   				<input type="file" id="file" name="imgFile" onchange="checkFile(this)"><br/>
		   			</div>
		   			<div class="form-group md-form" align="center">
		   				<div class="formLabel" style="text-align: left">도서 표지파일</div>
		   				<input type="file" id="file" name="imgFile" onchange="checkFile(this)"><br/>
		   			</div>
	   			</div>
	   			<!-- 직접 올리기 End -->
	   			
	   			<!-- 이미지 미리보기 Start -->
	   			<div class="form-group imgPreview">
	   				<div class="row col-lg-12 justify-content-center">
	   					<div id="preview">
		   					<div id="titlePreview"></div>
		   					<div id="authorPreview"></div>
		   					<div id="liberoImg"></div>
		   					<img src="" id="uploadPreview" width="100%" height="100%">
	   					</div>
	   				</div>
	   			</div>
	   			<!-- 이미지 미리보기 End -->
	   			<!-- 무료템플릿 선택 End -->
	   			
	   			<!-- 도서제목 입력 Start -->
	   			<div class="form-group md-form">
	   				<div class="md-form">
	   					<div class="formLabel">도서제목</div>
						<input placeholder="도서 제목" type="text" id="prodName" value="${prod.prodName}" class="form-control" name="prodName" onkeyup="addTitle()">
					</div>
	   			</div>
	   			<!-- Grid row -->
				<div class="row">
				    <!-- Grid column -->
				    <div class="col">
				      <!-- Material input -->
				      <div class="md-form mt-0">
				      	<div class="formLabel">저자</div>
				        <input type="text" name="author" value="${prod.author}" class="form-control" placeholder="저자" onkeyup="addAuthor()">
				      </div>
				    </div>
				    <!-- Grid column -->
				
				    <!-- Grid column -->
				    <div class="col">
				      <!-- Material input -->
				      <div class="md-form mt-0">
				      	<div class="formLabel">카테고리</div>
				      	<select name="bookCategory" class="browser-default custom-select">
				      		<option value="시">시</option>
				      		<option value="소설">소설</option>
				      		<option value="수필">수필</option>
				      		<option value="비문학">비문학</option>
				      		<option value="교육">교육</option>
				      	</select>
				      </div>
				    </div>
				    <!-- Grid column -->
				</div>
	   			<div class="form-group">
	   				<div>
	   					<div class="formLabel">해시태그</div>
	   					<div class="bs-example">
							<input type="text" value="${prod.hashtagName}" id="hashtagName" class="tags" name="hashtagName" placeholder="">
						</div>
					</div>
	   			</div>
	   			<div class="form-group md-form">
	   				<div class="formLabel">제작 목적</div>
	   				<div class="row">
		   				<div class="col-lg-2">
		   					<input type="radio" name="purposeCode" value="sale" checked>일반 판매용
		   				</div>
		   				<div class="col-lg-2">
		   					<input type="radio" name="purposeCode" value="have">소장용
		   				</div>
	   				</div>
	   			</div>
	   			
	   			<!-- 도서 설명 입력폼(SummerNote) -->
				<div class="form-group">
				    <label class="formLabel" for="prodDetail">상품상세정보</label>
				    <div>
						<textarea id="prodDetail" name="prodDetail" value="${prod.prodDetail}" class="summernote" style="display: none;"></textarea>
						<div id="summernote"></div>
				    </div>
				</div>
				<!-- 도서 설명 입력폼(SummerNote) 끝 -->
				<div class="form-group" align="center">
		      		<button type="button" class="btn btn-info brown lighten-1 btn-block" 
		      			onclick="addInfo()">
		      			가격 책정
		      		</button>
			  	</div>
	   		</form>
	   		<!-- 도서정보 등록 폼 End -->
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	</body>
	
	<!-- include summernote-lite css/js -->
	<link href="/libero/resources/css/summernote/summernote-lite.css" rel="stylesheet">
	<script src="/libero/resources/javascript/summernote/summernote-lite.js"></script>
	
	<!-- include summernote-ko-KR -->
	<script src="/libero/resources/javascript/summernote/lang/summernote-ko-KR.min.js"></script>
	
	<!-- taginput js -->
	<link href="../resources/css/taginput/jquery.tagsinput.min.css" rel="stylesheet">
	<script src="../resources/javascript/taginput/jquery.tagsinput.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			
			$("#liberoImg").hide();
			$("#titlePreview").hide();
			$("#fileUpload").hide();
			$("#uploadPreview").hide();
			var cover = "${prod.coverFile}";
			if (cover!=null) {
				$("#preview").css("background-image", "url(../resources/images/publish/fileUpload/coverFile/"+cover+")");
			}
			
			$("input[name='imgType']").on("click", function(){
				var type = $("input[name='imgType']:checked").val();
				var img = $("input[name='imgSelect']:checked").val();
				
				$("div .imgSelect").show();
				$("div .imgPreview").show();
				
				$(".img1").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t1_preview.png)");
				$(".img2").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t2_preview.png)");
				$(".img3").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t3_preview.png)");
				$(".img4").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/t4_preview.png)");
				
				$("#preview").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/"+img+"_preview.png)");
				$("#liberoImg").show();
				$("#titlePreview").show();
				
				//logo div 위치 변경
				if (type=="picture") {
					$("#titlePreview").css("top","55px");
					$("#authorPreview").css("top","90px");
				}else if (type=="icon") {
					$("#titlePreview").css("top","200px");
					$("#authorPreview").css("top","220px");
				}else if (type=="img") {
					$("#titlePreview").css("top","265px");
					$("#authorPreview").css("top","280px");
				}
				
			});
			
			$("input[name='imgSelect']").on("click", function(){
				var type = $("input[name='imgType']:checked").val();
				var img = $("input[name='imgSelect']:checked").val();
				
				$("#preview").css("background-image", "url(../resources/images/publish/freeTemplate/"+type+"/"+img+"_preview.png)");
				$("#liberoImg").show();
				$("#titlePreview").show();
			});
		});
		//============= 표지 종류 : 무료, 직접 선택 ===================
		function checkCover() {
			var cover = $("input[name='coverSelect']:checked").val();
			
			if (cover=="freeTemplate") {
				$("div .freeSelect").show();
				$("div .imgSelect").show();
				$("div .imgPreview").show();
				$("#fileUpload").hide();
			}
			if (cover=="fileUpload") {
				$("div .freeSelect").hide();
				$("div .imgSelect").hide();
				$("#fileUpload").show();
				$("div .imgPreview").show();
				$("#titlePreview").hide();
				$("#authorPreview").hide();
			}
		}
		
		function addTitle() {
			//제목 추가
			var title = $("input[name='prodName']").val();
			$("#titlePreview").html(title);
			//위치변경
			var divWidth = $("#preview").width();
			var titleWidth = $("#titlePreview").width();
			var type = $("input[name='imgType']:checked").val();
			
			if (type!="img") {
				var leftWidth = Math.ceil((divWidth/4)*3-(titleWidth/2)+5);
			} else {
				var leftWidth = Math.ceil((divWidth/2)+20);
			}
			
			$("#titlePreview").css("left",leftWidth);
			
		}
		
		function addAuthor() {
			//저자 추가
			var author = $("input[name='author']").val();
			$("#authorPreview").html(author);
			
			//위치변경
			var divWidth = $("#preview").width();
			var authorWidth = $("#authorPreview").width();
			var type = $("input[name='imgType']:checked").val();
			
			if (type=="icon") {
				var leftWidth = Math.ceil((divWidth/4)*3-(authorWidth/2)+5);
			} else if (type=="img" || type=="picture") {
				var leftWidth = Math.ceil((divWidth)-(authorWidth)-30);
			}
			
			$("#authorPreview").css("left",leftWidth);
		}
		
		//summernote
	    $(function() {
	  	  	$('#summernote').summernote({
	  		  placeholder: '내용을 입력하세요',
		   	        tabsize: 1,
		   	        height: 300,
		   	     	lang: 'ko-KR', // default: 'en-US'
		   	     	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files, editor, welEditable) {
						console.log(files);
						for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
					}
				}
	  	  	});
	  		$("div.note-editable").on('drop',function(e){
	            for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
	            	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
	            }
	      		e.preventDefault();
	  		});
	  	});
	    
	    /**
		* 이미지 파일 업로드
		*/
		function sendFile(file, editor) {
			data = new FormData();
			data.append("file", file);
			
			$.ajax({
				data : data,
				type : "POST",
				url : "/libero/publish/json/addProduct",
				//cache: false,
				contentType : false,
				enctype: 'multipart/form-data',
				processData : false,
				success : function(data) {
	            	//항상 업로드된 파일의 url이 있어야 한다.
	           		$(editor).summernote('insertImage', data.url);
				}
			});
		}
	    
		//============== check file exc =====================
		function checkFile(f) {
			
			var file = f.files;
			
			if(!/\.(jpg|png)$/i.test(file[0].name)) 
				alert("jpg, png 파일만 업로드 가능합니다.");
			
			else return;
			
			f.outerHTML = f.outerHTML;
		}
		
		//==============이미지 미리보기=========================
	    $(function(){
	    	function readURL(input) {
	            if (input.files && input.files[0]) {
	                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	                reader.onload = function (e) { 
	                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                    $("#uploadPreview").show();
	                    $('#uploadPreview').attr('src', e.target.result);
	                    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                    //(아래 코드에서 읽어들인 dataURL형식)
	                }                    
	                reader.readAsDataURL(input.files[0]);
	                //File내용을 읽어 dataURL형식의 문자열로 저장
	            }
	    	}//readURL()--

	    	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	   		$("#file").change(function(){
	            //alert(this.value); //선택한 이미지 경로 표시
	            readURL(this);
	        });
	    });
		
		//addTag
		
		$(function() {

			$('#hashtagName').tagsInput({
				width:'auto',
				defaultText:''
			});
			
		});
		
	    function addInfo() {
	    	var hash = $("input[name=hashtagName]").val();
			var title = $("input[name='prodName']").val();
			console.log(title);
			var author = $("input[name='author']").val();
			var imgSelect = $("input[name='imgSelect']:checked").val();
			var thumbnail = "${prod.prodThumbnail}";
			
			if (title==null) {
				Swal.fire({
					  icon: 'error',
					  text: '제목을 입력해주세요.'
					});
				return;
			}
			
			if (author==null) {
				Swal.fire({
					  icon: 'error',
					  text: '저자를 입력해주세요.'
					});
				return;
			}
			if (thumbnail==null) {
				if ($("input[name='coverSelect']:checked").val()=="freeTemplate") {
					if (imgSelect==null) {
						Swal.fire({
							  icon: 'error',
							  text: '표지를 선택해주세요.'
							});
						return;
					}
				}else {
					if ($("input[name='file']").val()==null) {
						Swal.fire({
							  icon: 'error',
							  text: '표지를 업로드해주세요.'
							});
						return;
					}
				}
			}
			if ($("input[name='purposeCode']:checked").val()==null) {
				Swal.fire({
					  icon: 'error',
					  text: '제작목적을 선택해주세요.'
					});
				return;
			}
			
	    	$('textarea[name="prodDetail"]').val($('#summernote').summernote('code'));
			$("form").attr("method" , "POST").attr("action" , "/libero/publish/addProductInfo").attr("enctype","multipart/form-data").submit();
		}
	</script>
</html>