<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
    <meta charset="utf-8">
	<jsp:include page="../../common/cdn.jsp" />
    <link rel="stylesheet" href="../resources/css/lyk.css" type="text/css">

	

</head>
<body>
<jsp:include page="../toolbar.jsp" />
<form>
<input type="hidden" id="postNo" name="postNo" value="${post.postNo}"/>
<input type="hidden" id="userId" name="userId" value="${post.user.userId}"/>
<input type="hidden" id="prodPost" name="prodPost" value="post"/>
</form>
		<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
               <h4>${post.postName}</h4> <h3>${post.user.nickname}</h3>
               <span> ${post.regDate}</span>
               <bttton id="reportBtn" style="float:right;">신고</button> 
           </div>
           

			
           <div class="txt_board">
           	<%--<p><img src="../images/uploadFiles/${post.postImage}"></p>  --%>
              
               <p>${post.postContent}</p>
           </div>
		</section>
		<br><br><br>
		<button type="button" class="btn btn-outline-info">수정하기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-info">삭제하기</button>
		<button type="button" class="btn btn-info" style="float: right;">목록으로</button>
		</article>

<div class="container">
	<jsp:include page="comment.jsp"></jsp:include>
	<jsp:include page="addReport.jsp"></jsp:include>
	<div class="border-bottom mt-2 mb-4 py-4" id="hh"></div>  
</div>
</body>
<script type="text/javascript">
		$(function() {
			$("button:contains('수정')").on("click", function(){
				self.location = "/libero/community/updatePost?postNo=${post.postNo}"
			})	
			
			$("button:contains('삭제')").on("click", function(){
				self.location = "/libero/community/deletePost?postNo=${post.postNo}"
				alert("게시글이 삭제되었습니다.");
			})
			
			$("button:contains('목록')").on("click", function(){
				<%-- self.location = "/libero/community/getPostList?menu=" --%>
				self.location = "javascript:history.go(-1)";
			})
			
		});
	
	
</script>
</html>