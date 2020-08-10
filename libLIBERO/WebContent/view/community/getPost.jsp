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
<input type="hidden" id="menu" name="menu" value="${param.menu}" />
</form>
		<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
               <h4>&nbsp;${post.postName}</h4>
               <img src='../resources/images/user/fileUpload/${post.user.profile}' style='height: 50px; width: 50px; float: left; margin:10px 10px 10px 0;'>
               <span style="margin:6px 0 -18px 0; font-size: 16px; font-weight:bold;">${post.user.nickname}</span>
               <span style="float:left;"> ${post.regDate} &nbsp;&nbsp;조회 &nbsp;${post.viewCount}&nbsp;&nbsp;댓글 &nbsp;${post.commentCount}</span>
         	   <div style="float:right;">
	           <c:if test="${sessionScope.user.userId == post.user.userId}">
		           	<button type="button" class="btn btn-brown btn-md">수정</button>
				   	<a href="/libero/community/deletePost?postNo=${post.postNo}" class="btn btn-outline-brown btn-md" role="button" aria-pressed="true">삭제</a>	
		       </c:if>
		       <c:if test="${sessionScope.user.userId != post.user.userId}">     
		            <button type="button" id="reportBtn" class="btn btn-brown btn-md">신고</button>
		       </c:if>    
	           </div>
                <br><br>
                
           </div>
          

			
           <div class="txt_board">
         
              
               <p>${post.postContent}</p>
           </div>
		</section>
		<br><br><br><br><br>

		<button type="button" class="btn btn-outline-brown" style="margin-top:-30px; float: right;">목록으로</button>
		<jsp:include page="comment.jsp"></jsp:include>
		<div class="border-bottom mt-2 mb-4 py-4" id="hh"></div>  
		</article>


	<jsp:include page="addReport.jsp"></jsp:include>


</body>
<script type="text/javascript">
		
		
		$(function() {
			$("button:contains('수정')").on("click", function(){
				self.location = "/libero/community/updatePost?postNo=${post.postNo}"
			})	
			
			$("button:contains('목록')").on("click", function(){
				<%-- self.location = "/libero/community/getPostList?menu=" --%>
				self.location = "javascript:history.go(-1)";
			})
			
		});
	
	
</script>
</html>