<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<c:if test="${param.prodType=='cover'}">
			<title>libLIBERO : 표지 디자인 등록</title>
		</c:if>
		<c:if test="${param.prodType=='correct'}">
			<title>libLIBERO : 교정교열 등록</title>
		</c:if>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style>
			 .formLabel {
				font-size: 15px;
				color: #795548;
				width: 100%;
				padding-top: 10px;
				padding-bottom: 10px;
				margin-bottom: 0;
				font-family: 'Nanum Gothic', sans-serif;
			}
		</style>
	</head>
	<body>
	
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- ////////////Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   	
	   		<!-- form Start /////////////////////////////////////-->
			<form>
				<!-- 표지디자인 입력폼  -->
				<c:if test="${param.prodType=='cover'}">
					<div class="form-group">
					    <label class="formLabel" for="prodType">표지종류</label>
					    <div>
                            <input type="radio" name="prodType" value="design" checked> 레디메이드 표지 디자인
                        </div>
                        <div>
                            <input type="radio" name="prodType" value="target"> 맞춤형 표지 디자인
                        </div>
					</div>
				</c:if>
				<!-- 표지디자인 입력폼 끝 -->
				<!-- 교정교열 타입 입력폼 -->
				<c:if test="${param.prodType=='correct'}">
					<input type="hidden" name="prodType" value="${param.prodType}">
				</c:if>
				<!-- 교정교열 타입 입력폼 끝 -->
				<!-- 썸네일 입력폼 -->
				<div class="form-group">
				    <label class="formLabel" for="prodThumbnail">상품 썸네일</label>
				    <div align="center">
				        <input type="file" id="prodThumbnail" name="imgFile"><br/>
				        <img id="imgPreview" src="../resources/images/publish/fileUpload/null.png" width="150px" height="150px" />
			    	</div>
				</div>
				<!-- 썸네일 입력폼 끝 -->
				<!-- 표지파일 입력폼 -->
				<c:if test="${param.prodType=='cover'}">
					<div class="form-group coverFile">
					    <label class="formLabel" for="coverFile">표지 파일</label>
					    <div align="center">
					        <input type="file" id="coverFile" name="imgFile">
				    	</div>
					</div>
				</c:if>
				<!-- 표지파일 입력폼 끝 -->
				<div class="row">
				<!-- 상품 제목 입력폼  -->
				<div class="form-group col-6">
					<label class="formLabel" for="prodName">상품 제목</label>
					<div>
						<input type="text" id="prodName" name="prodName" class="form-control" placeholder="상품의 제목을 입력해주세요">
					</div>
				</div>
				<!-- 상품 제목 입력폼 끝  -->
				<!-- 상품 가격 입력폼  -->
				<div class="form-group col-6">
					<c:if test="${param.prodType=='cover'}">
						<label class="formLabel" for="retailPrice">표지 가격</label>
					</c:if>
					<c:if test="${param.prodType=='correct'}">
						<label class="formLabel" for="retailPrice">1page당 가격</label>
					</c:if>
					<div>
						<input type="number" id="retailPrice" name="retailPrice" class="form-control" placeholder="가격을 입력하세요">
					</div>
				</div>
				<!-- 상품 가격 입력폼 끝  -->
				</div>
				<!-- 상품 설명 입력폼(SummerNote) -->
				<div class="form-group">
				    <label class="formLabel" for="prodDetail">상품상세정보</label>
				    <div>
						<textarea id="prodDetail" name="prodDetail" class="summernote" style="display: none;"></textarea>
						<div id="summernote"></div>
				    </div>
				</div>
				<!-- 상품 설명 입력폼(SummerNote) 끝 -->
				<div class="form-group">
			    	<div align="right">
			      		<button type="button" class="btn btn-info brown lighten-1" onclick="addProd()">등&nbsp;록</button>
				  		<a class="btn btn-outline-brown waves-effect" href="javascript:history.back();" role="button">취&nbsp;소</a>
			    	</div>
			  	</div>
			</form>
	   	</div>
	</body>
	
	<!-- include summernote-lite css/js -->
	<link href="/libero/resources/css/summernote/summernote-lite.css" rel="stylesheet">
	<script src="/libero/resources/javascript/summernote/summernote-lite.js"></script>
	
	<!-- include summernote-ko-KR -->
	<script src="/libero/resources/javascript/summernote/lang/summernote-ko-KR.min.js"></script>
	
	<script type="text/javascript">
	//==============이미지 미리보기=========================
    $(function(){
    	function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                reader.onload = function (e) { 
                    //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                    $("#imgPreview").show();
                    $('#imgPreview').attr('src', e.target.result);
                    //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                    //(아래 코드에서 읽어들인 dataURL형식)
                }                    
                reader.readAsDataURL(input.files[0]);
                //File내용을 읽어 dataURL형식의 문자열로 저장
            }
    	}//readURL()--

    	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
   		$("#prodThumbnail").change(function(){
            //alert(this.value); //선택한 이미지 경로 표시
            readURL(this);
        });
    });
	
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
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
           		$(editor).summernote('insertImage', data.url);
			}
		});
	}
    
	//============= radio 처리 =====================
    $(function() {
        $(".coverFile").show();
          
        $("input[value='design']").on("click", function(){
        	$(".coverFile").show();
        });
    });
        
    $(function() {
        $("input[value='target']").on("click", function(){
        	$(".coverFile").hide();
        });
    });
    
    function addProd() {
    	
    	if ($("input[id='prodThumbnail']").val()==null) {
    		Swal.fire({
				  icon: 'error',
				  text: '상품 썸네일을 등록해주세요.'
				});
    		return;
		}
    	
    	if ($("input[name='prodName']").val()==null) {
    		Swal.fire({
				  icon: 'error',
				  text: '상품명을 입력해주세요.'
				});
    		return;
		}
    	
    	if ($("input[name='retailPrice']").val()==null) {
    		Swal.fire({
				  icon: 'error',
				  text: '가격을 입력해주세요.'
				});
		}
    	
    	
    	$('textarea[name="prodDetail"]').val($('#summernote').summernote('code'));
		$("form").attr("method" , "POST").attr("action" , "/libero/publish/addProduct").attr("enctype","multipart/form-data").submit();
	}
    
	</script>
</html>