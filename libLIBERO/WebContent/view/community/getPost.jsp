<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
    <meta charset="utf-8">
	<jsp:include page="../../common/cdn.jsp" />
	<link rel="stylesheet" href="../resources/css/common.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/lyk.css" type="text/css">

	

</head>
<body>
<jsp:include page="../toolbar.jsp" />


		<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
           
           	   <p style="font-size: 14px; margin-bottom:3px;">
           	   <c:if test="${post.postType == 'f'}">자유게시판</c:if>
           	   <c:if test="${post.postType == 'q'}">문의하기</c:if>
           	   <c:if test="${post.postType == 'n'}">공지사항</c:if>
           	   </p>
               <h4>
               <c:if test="${post.qnaRegType == 'p'}">출판하기&nbsp;| &nbsp;</c:if>
               <c:if test="${post.qnaRegType == 'b'}">구매하기&nbsp;| &nbsp;</c:if>
               <c:if test="${post.qnaRegType == 'u'}">이용문의&nbsp;| &nbsp;</c:if>
               <c:if test="${post.qnaRegType == 'e'}">기타&nbsp;| &nbsp;</c:if>
               
               ${post.postName}</h4>
               <img src='../resources/images/user/fileUpload/${post.user.profile}' style='height: 50px; width: 50px; float: left; margin:5px 10px 10px 0;'>
               <span style="margin:0 0 -18px 0; font-size: 16px; font-weight:bold;">${post.user.nickname}</span>
               <c:if test="${post.postType != 'q'}">
               		<span style="float:left;"><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;&nbsp;조회 &nbsp;${post.viewCount}&nbsp;&nbsp;댓글 &nbsp;${post.commentCount}</span>
               </c:if>
               <c:if test="${post.postType == 'q'}">
               		<span style="float:left;"><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
               </c:if> 
                
               
         	   <div style="float:right;">
	           <c:if test="${sessionScope.user.userId == post.user.userId}">
		           	<button type="button" class="btn btn-brown btn-md">수정</button>
				   	<a href="/libero/community/deletePost?postNo=${post.postNo}" class="btn btn-outline-brown btn-md" role="button" aria-pressed="true">삭제</a>	
		       </c:if>
		       <c:if test="${sessionScope.user.userId != post.user.userId and post.postType == 'f' and post.user.role != 'a'}">     
		       <button type="button" class="btn btn-brown btn-md" id="reportBtn" data-toggle="modal" data-target="#orangeModalSubscription">신고
		       </button>
		       </c:if>    
	           </div>
                <br><br>
                
           </div>
          

			
           <div class="txt_board">
         
              
               <p>${post.postContent}</p>
           </div>
		</section>
		<br><br><br>

		<button type="button" class="btn btn-outline-brown" style="margin-top:-30px; float: right;">목록으로</button>
		<jsp:include page="comment.jsp"></jsp:include>
		<div class="border-bottom mt-2 mb-4 py-4" id="hh"></div>  
		</article>

<input type="hidden" id="postNo" name="postNo" value="${post.postNo}"/>
<input type="hidden" id="userId" name="userId" value="${post.user.userId}"/>
<input type="hidden" id="prodPost" name="prodPost" value="post"/>
<input type="hidden" id="postType" name="postType" value="${post.postType}"/> 


	<jsp:include page="addReport.jsp"></jsp:include>


<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
		
		
		$(function() {
			
			$("button:contains('수정')").on("click", function(){
				self.location = "/libero/community/updatePost?postNo=${post.postNo}"
			})	
			
			$("button:contains('목록')").on("click", function(){
				
				var postType = $("#postType").val();
				if(postType!='q'){
					self.location = "/libero/community/getPostList?menu="+postType; 
				} else if (postType=='q'){
					self.location = "/libero/user/getUserActivityList?menu="+postType; 
				}
			})
			
		});
	
	
</script>
</html>