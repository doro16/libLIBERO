<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
   	<jsp:include page="../../common/cdn.jsp" />
   	<link rel="stylesheet" href="../resources/css/common.css">
	<style>
      .md-pills .nav-link.active {
        color: #fff;
        background-color: #616161;
      }
      button.close {
        position: absolute;
        right: 0;
        z-index: 2;
        padding-right: 1rem;
        padding-top: .6rem;
      }
    </style>
    
    <script type="text/javascript">
		
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/libero/community/getPostList?menu=n").submit();	
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
        
    </script>
</head>

<body>
	<jsp:include page="../toolbar.jsp" />
	
   
    <div class="container-doc">
        			
					<h1 style="margin: 0px 240px 0; font-weight:bold;">공지사항</h1>   
					<h4 style="margin: 24px 240px 0; font-weight:400;">리브리베로의 새 소식을 가장 먼저 만나보세요.</h4> 
        <main class="doc-main">
            	
        		
				
                
                <p style="margin: 10px 240px; float:left; "> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 </p>
				 <form class="form-inline" style="margin: 84px 0 0 1040px;">
		    
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
					  </div>&nbsp;&nbsp;&nbsp;
					  <i class="fas fa-search"></i>&nbsp;&nbsp;&nbsp;
					 
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  <%-- <input type="hidden" id="postType" name="postType" value="${param.menu}" /> --%>
					  <input type="hidden" id="postType" name="postType" value="n" />
					  
								
				</form>
				    <br>
                    <div class="container my-5">
                    	
					
					  <!-- Section -->
					  <section>
                       
                        
             				
							<!--Tab panels-->
						    <div class="tab-content mb-5">
						
						      <!--Panel 1-->
						      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">
						
						        <!-- Grid row -->
						        <div class="row">
								<c:set var="i" value="0" />
								<c:forEach var="post" items="${list}"> 
		                        <c:set var="i" value="${ i+1 }" />	
						       	  <!-- Grid column -->
						          <div class="col-md-12 col-lg-4">
									
						            <!-- Card -->
						            <a class="card hoverable mb-4  border border-white" data-toggle="modal" data-target="#basicExampleModal" 
						            onclick="location.href='/libero/community/getPost?postNo=${post.postNo}' ">
						
						              <!-- Card image -->
						              <c:if test="${ fn:contains(post.postContent, '<img') }">
	             					 	<c:set var="imgAfter" value="${ fn:substringAfter(post.postContent, '<img src=\"') }" />
	             					 	<c:set var="imgBefore" value="${ fn:substringBefore(imgAfter, '\" style') }" />
										<img style='max-height: 200px;' class='card-img-top' src='<c:out value="${imgBefore}" />' alt='글사진' >
						              </c:if>
            						  <c:if test="${ fn:indexOf(post.postContent, '<img')== -1 }">
										<img style='max-height: 200px;' class='card-img-top' src="../resources/images/publish/fileUpload/null.png">
									  </c:if>
						              <!-- Card content -->
						              <div class="card-body" style="max-weight: 300px; max-height: 184px;  overflow: hidden; margin: -10px -18px;" >
										<c:set var="postName" value="${post.postName}" />
										
						                <h5 class="my-3" style="font-weight:bold;">
						                ${fn:substring(postName,0,20)}
                            			<c:if test="${fn:length(postName)>20}">......</c:if>
						                </h5>
						                
						                <div style= "max-height: 84px;  margin: -14px 0px; overflow: hidden;">
						                <p class="card-text text-uppercase mb-3" >${post.postContent}</p>
						                </div> 
						                     <div style="margin: 32px 0 0 274px; color: #5587ED; font-size: 14px;">
						                      	더 보기&nbsp;&nbsp;<i class="fas fa-plus"></i>    
						                     </div>      
						               
						              </div>
						
						            </a><!-- Card --> 
						            <br><br><br>
						            
       							  </div><!-- Grid column -->
       							  
       							  </c:forEach>
       							  <c:if test="${sessionScope.user.role == 'a'}">
							     <button type="button" class="btn btn-brown" style="margin: -40px 0 0 1020px;" onclick="location.href='/libero/community/addPost?postType=n'">글쓰기</button>
							     </c:if>
       							</div><!-- Grid row -->
       						  </div><!--Panel 1-->
       						</div><!--Tab panels-->
                           
                            </section>
                           
                          
                       
                    </div>
                    
               
            
        </main>
        
        <div class="dimmed_layer" style="display:none"></div>
         
				    
    </div>
<jsp:include page="../../common/pageNavigator_new.jsp"/>
<jsp:include page="../../common/footer.jsp"></jsp:include>
</body>

</html>