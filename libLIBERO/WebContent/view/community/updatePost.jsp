<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<jsp:include page="../../common/cdn.jsp" />
</head>

<body>
	<jsp:include page="../toolbar.jsp" />

	<div class="mt-5">&nbsp;</div>
	<div class="container">
    <h1>게시글 작성</h1>
        <form class="form-group my-5 py-5">
            <input type="hidden" name="postType" value="${post.postType}">
            <input type="hidden" name="postNo" value="${post.postNo}">
            <div class="form-row my-3">
                <div class="input-group col-lg-12">
                    <input type="text" class="form-control" name="postName" value="${post.postName}">
                </div>
            </div>
            <div>
				<textarea id="postContent" name="postContent" class="summernote" style="display: none;"></textarea>
				<div id="summernote">${post.postContent}</div>
			</div>
            <div class="form-row justify-content-center my-5">
               
				<button type="button" class="btn btn-outline-brown waves-effect" href="javascript:history.back();" role="button">취&nbsp;소</button>
			    <button type="button" class="btn btn-brown">등&nbsp;록</button>	
            </div>
        </form>

    </div>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>

<link href="/libero/resources/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/libero/resources/javascript/summernote/summernote-lite.js"></script>
<script src="/libero/resources/javascript/summernote/lang/summernote-ko-KR.min.js"></script>

<script type="text/javascript">


	$(function() {

		$('#summernote').summernote({
			minHeight: 600,
	        maxHeight: 600,
			lang : 'ko-KR',
			focus: true,
			toolbar: [
 			    ['fontname', ['fontname']],
 			    ['fontsize', ['fontsize']],
 			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
 			    ['color', ['forecolor','color']],
 			    ['table', ['table']],
 			    ['para', ['ul', 'ol', 'paragraph']],
 			    ['height', ['height']],
 			    ['insert',['picture','link','video']],
 			    ['view', ['fullscreen', 'help']]
 			  ],
 			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {	
				onImageUpload : function(files, editor, welEditable) {
					console.log(files);

					for (var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
				}
			}
  	  	}); //summernote
		
		$("div.note-editable").on('drop',function(e){
            for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
            	sendFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
            }
      		e.preventDefault();
  		});
  	  	
		$("button:contains('등')").on("click", function(){
			$('textarea[name="postContent"]').val($('#summernote').summernote('code'));
			var postName = $("input[name='postName']").val();
			var postContent = $("textarea[name='postContent']").val();
		
			
			if(postName == null || postName.length <1){
				alert("제목을 입력해주세요.");
				return;
			}
			
			if(postContent == "<p><br></p>"){
				alert("내용을 입력해주세요.");
				return;
			}
			
			swal("게시글이 수정되었습니다.", "", "success");
			setTimeout(function() {
				$("form").attr("method" , "POST").attr("action" , "/libero/community/updatePost").attr("enctype","multipart/form-data").submit();
			 }, 1500);
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
			url : "/libero/community/json/updatePost",
			//cache: false,
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
           		$(editor).summernote('insertImage', data.url);
			}
		});
	}
	 
	
</script>

</html>