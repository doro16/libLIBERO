<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
   	<jsp:include page="../../common/cdn.jsp" />
    <link rel="stylesheet" href="../resources/css/lyk.css" type="text/css">

    <script type="text/javascript">
		
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/libero/community/getPostList?menu=f").submit();	
		}  

		$(function() {
			 $( "button.btn.btn-default" ).on("click" , function() {
					fncGetUserList(1);
			 });
			 
			 $("#searchKeyword").on('keypress',function(e) {
				    if(e.which == 13) {
				        fncGetUserList(1);
				    }
			 });
			
		});
    </script>
</head>

<body>
	<jsp:include page="../toolbar.jsp" />
    <div class="container-doc">
        
        <main class="doc-main">
            	
        
				
                <article id="mainContent" class="content-article content-board">
                    
				    <form class="form-inline" style="float:right;">
				    
					  <div class="form-group">
					    <select class="form-control" name="searchCondition" >
							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>제목</option>
							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>내용</option>
							<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>닉네임</option>
						</select>
					  </div>
					  
					  <div class="form-group">
					    <label class="sr-only" for="searchKeyword">검색어</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					  </div>
					  
					  <button type="button" class="btn btn-default">검색</button>
					  <button type="button" class="btn btn-info" onclick="location.href='/libero/community/addPost?postType=f'">글쓰기</button>
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  <%-- <input type="hidden" id="postType" name="postType" value="${param.menu}" /> --%>
					  <input type="hidden" id="postType" name="postType" value="f" />
					  
					
					</form>
	    			<p style="padding-top: 20px; "> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 </p>
				    
                    <div class="warp_board">
                        <ul class="list_news">
                            <!-- 변수 지정하기  -->
							<c:set var="i" value="0" />
							<c:forEach var="post" items="${list}"> 
                            <c:set var="i" value="${ i+1 }" />
                            
                            <li style="max-height: 183px;  overflow: hidden;">
                                <a href="/libero/community/getPost?postNo=${post.postNo}" class="link_news before_thumb">
                				<strong class="tit_news">${ i }&nbsp;&nbsp;${post.postName}</strong>
                				<i class="far fa-eye">&nbsp;&nbsp;${post.viewCount}</i>
             					</a>
             					
             					 <a class="link_thumb">
             					 <c:if test="${ fn:contains(post.postContent, '<img') }">
             					 	<c:set var="imgAfter" value="${ fn:substringAfter(post.postContent, '<img src=\"') }" />
             					 	<c:set var="imgBefore" value="${ fn:substringBefore(imgAfter, '\" style') }" />
									
									<img src='<c:out value="${imgBefore}" />' alt='글사진' class='thumb_img' >

									<%-- 
									비포 : <c:out value="${imgAfter}" />
									애프터 : <c:out value="${imgBefore}" />
									<c:out value="${imgName}" escapeXml="true"/>
									 --%>
             					 </c:if>
             					
             					
                                </a>
                                <div class="txt_news" onclick="location.href='/libero/community/getPost?postNo=${post.postNo}' ">
                                ${post.postContent}
                                </div>
                                
                                
                                
                                
                                <span class="txt_date">${post.regDate}</span>
                            </li>
                            </c:forEach>
                           
                          
                        </ul>
                    </div>
                    
                </article>
            
        </main>
        
        <div class="dimmed_layer" style="display:none"></div>
        
    </div>
<jsp:include page="../../common/pageNavigator_new.jsp"/>
</body>

</html>