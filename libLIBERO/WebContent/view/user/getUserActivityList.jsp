<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<script type="text/javascript">
			function fncGetUserList(currentPage) {
				$("#currentPage").val(currentPage);

				$("form").attr("method", "POST").attr("action", "/libero/user/getUserActivityList").submit();	
			}	
			
			
			
			$(function() {
				 $( ".fas.fa-search" ).on("click" , function() {
						fncGetUserList(1);
				 });
				 
				 $("#searchKeyword").on('keypress',function(e) {
					    if(e.which == 13) {
					        fncGetUserList(1);
					    }
				 });
				
			});

			$(function() {
				
				$("#myPost").on("click", function() {
		            $("#myPost").show();
		            $("#myComment").hide();
		            $("#myQna").hide();
		            
		        })

		        $("#myComment").on("click", function() {
		            $("#myComment").show();
		            $("#myPost").hide();
		            $("#myQna").hide();
		          
		        })
		        
		        $("#myQna").on("click", function() {
		        	 $("#myQna").show();
		             $("#myPost").hide();
		             $("#myComment").hide();
		          
		        })
				
			});
				
		</script>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row">
	   		<c:if test="${sessionScope.user.role != 'a'}">
		   		<div class="col-lg-2">
		   			<a href="/libero/user/getTempPublishList" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">임시저장 도서</a>
		   				
		   			<a href="/libero/user/getUserActivityList?menu=p" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">작성한 글</a>
		   				
		   			<a href="/libero/user/getUserActivityList?menu=c" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">작성한 댓글</a>
		   				
		   			<a href="/libero/user/getUserActivityList?menu=q" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 

		   				aria-pressed="true" style="margin-bottom: 10px">나의 문의</a>
		   		</div>

		   		<div class="col-lg-9">
		   	</c:if>
		   	<c:if test="${sessionScope.user.role == 'a'}">
		   		<%--<div class="col-lg-11" style="margin-left: 60px;"> --%>
		   		<div class="col-lg-12">
		   	</c:if>
		<%-- 공통 --%>  		
		 		  <form class="form-inline" style="float:right;">
				    
					  <div class="form-group">
					    <select class="form-control" name="searchCondition" >
							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>
							<c:if test="${param.menu!='c'}">제목</c:if>
							<c:if test="${param.menu=='c'}">내용</c:if>
							</option>
							<c:if test="${param.menu=='q'}"> 	
							<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>닉네임</option>
							</c:if>
						</select>
					  </div>
					  
					  <div class="form-group">
					    <label class="sr-only" for="searchKeyword">검색어</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					  </div>&nbsp;&nbsp;&nbsp;
					  <i class="fas fa-search"></i>&nbsp;&nbsp;&nbsp;
					  
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  <input type="hidden" id="menu" name="menu" value="${param.menu}" />
					  
					
					</form>
	    			<p style="padding-top: 20px; "> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 </p>  		
		   		
		<c:if test="${param.menu=='p'}"> 	
		   		<table class="table table-hover" id="myPost" style="font-size: 14px;text-align: center;">
	            <thead>
	                <tr>
	                	<th align="center">No</th>
	                    <th align="left" >제목</th>
	                    <th align="left" >닉네임</th>
	                    <th align="left" >작성일</th>
	                    <th align="left" >조회수</th>
	       
	                </tr>
	            </thead>
            	<tbody>
              
			   		<c:set var="i" value="0" />
				  	<c:forEach var="post" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					
					
                    <tr onClick = "location.href='/libero/community/getPost?postNo=${post.postNo}'">
                        
                  		<td align="center">${ i }</td>
                        <c:set var="postName" value="${post.postName}" />
                        <td align="left">${fn:substring(postName,0,20)}
                            <c:if test="${fn:length(postName)>20}">
                                ......
                            </c:if>
                            <span style="color: #FF7171;">&nbsp;[${post.commentCount}]</span>
                            <%-- <font color='red'>(${post.comments})</font>--%>     
                        </td>
                        <input type="hidden" value="${post.postNo}"/>
                        <td>${post.user.nickname}</td>
                        <td><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        <td>${post.viewCount}</td>
 
                    </tr>
                    
                    
                	</c:forEach>
                	<c:if test="${ empty list}">
		                <tr>
		                    <td colspan="6" style="padding: 40px;">아직 작성한 글이 없습니다</td>
		                </tr>
		            </c:if>
                	
                </tbody>
                </table>
        </c:if>
                <%-- ///////////////////////////////////////////////////////////////////////////// --%> 
		<c:if test="${param.menu=='c'}">                
                <table class="table table-hover" id="myComment" style="font-size: 14px;text-align: center;">
	            <thead>
	                <tr>
	                	<th align="center">No</th>
	                    <th align="left" >내용</th>
	                    <th align="left" >닉네임</th>
	                    <th align="left" >작성일</th>
	                    
	       
	                </tr>
	            </thead>
            	<tbody>
              
			   		<c:set var="i" value="0" />
				  	<c:forEach var="comment" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					
					
                    <tr onClick = "location.href='/libero/community/getPost?postNo=${comment.postNo}'">
                        
                  		<td align="center">${ i }</td>
                        <c:set var="commentContent" value="${comment.commentContent}" />
                        <td align="left">${fn:substring(commentContent,0,20)}
                            <c:if test="${fn:length(commentContent)>20}">
                                ......
                            </c:if>
                        </td>
                        <input type="hidden" value="${comment.postNo}"/>
                        
                        <td>${comment.user.nickname}</td>
                        <td><fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        
 
                    </tr>
                    
                    
                	</c:forEach>
                	<c:if test="${ empty list}">
		                <tr>
		                    <td colspan="6" style="padding: 40px;">아직 작성한 댓글이 없습니다</td>
		                </tr>
		            </c:if>
                	
                </tbody>
                </table>
		</c:if>
		<%-- ///////////////////////////////////////////////////////////////////////////// --%> 
		<c:if test="${param.menu=='q'}"> 	
		   		<table class="table table-hover" id="myPost" style="font-size: 14px;text-align: center;">
	            <thead>
	                <tr>
	                	<th align="center">No</th>
	                    <th align="left" >문의종류</th>
	                    <th align="left" >제목</th>
	                    <th align="left" >처리상태</th>
	                    <th align="left" >닉네임</th>
	       				<th align="left" >등록일</th>
	                </tr>
	            </thead>
            	<tbody>
              
			   		<c:set var="i" value="0" />
				  	<c:forEach var="post" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					
					
                    <tr onClick = "location.href='/libero/community/getPost?postNo=${post.postNo}&menu=q'">
                        
                  		<td align="center">${ i }</td>
                        <c:if test="${post.qnaRegType == 'p'}"><td>출판하기</td></c:if>
                        <c:if test="${post.qnaRegType == 'b'}"><td>구매하기</td></c:if>
                        <c:if test="${post.qnaRegType == 'u'}"><td>이용문의</td></c:if>
                        <c:if test="${post.qnaRegType == 'e'}"><td>기타</td></c:if>
                        
                        <c:set var="postName" value="${post.postName}" />
                        <td align="left">
                        	${fn:substring(postName,0,20)}
                            <c:if test="${fn:length(postName)>20}">
                                ......
                            </c:if>
                            <%-- <font color='red'>(${post.comments})</font>--%>     
                        </td>
                        <input type="hidden" value="${post.postNo}"/>
                        <c:if test="${post.qnaCode == 'o'}">
                        <td><button type="button" class="btn brown lighten-1 btn-rounded btn-sm my-0" style="border-radius: 20px; color: white;">답변완료</button></td>
                  		</c:if>
                        <c:if test="${post.qnaCode == 'x'}">
                        <td><button type="button" class="btn brown lighten-5 btn-rounded btn-sm my-0" style="border-radius: 20px;">&nbsp;&nbsp;대기중&nbsp;&nbsp;</button></td>
                  		</c:if>
                        <td>${post.user.nickname}</td>
                        <td><fmt:formatDate value="${post.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                 
                    </tr>
                    
                    
                	</c:forEach>
                	<c:if test="${ empty list}">
		                <tr>
		                    <td colspan="6" style="padding: 40px;">아직 작성한 문의가 없습니다</td>
		                </tr>
		            </c:if>
                	
                </tbody>
                </table>
        </c:if>
		
				</div> <%-- col9 --%>
				</div> <%-- row --%>
</div> <%-- container--%>
<jsp:include page="../../common/pageNavigator_new.jsp"/>    
<jsp:include page="../../common/footer.jsp"></jsp:include>    
</body>
	
	
	
	
</html>