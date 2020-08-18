<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<jsp:include page="/common/cdn.jsp"></jsp:include>
<!--  ///////////////////////// CSS ////////////////////////// -->
<link rel="stylesheet" href="../resources/css/common.css">
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "POST").attr("action", "/libero/user/getUserReportList").submit();
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

		$("#reportProd").on("click", function() {
			$("#reportProd").show();
			$("#reportPost").hide();
		})

		$("reportPost").on("click", function() {
			$("#reportProd").show();
			$("#reportPost").hide();
		})

	});
	
	$(document).on("click", ".updateProdPost button", function(){	
		var blindCode =  $("button[name='blindCode']").val(); 
		var prodPost =  $("input[name='menu']").val(); 
		if(prodPost ==  'prod'){
			var prodPostNo =  parseInt($(this).parent().find(".prodNo").val());
		} else if (prodPost =='post'){
			var prodPostNo =  parseInt($(this).parent().find(".postNo").val());
		}
		

	
		
		$.ajax(
		    	{
		        url : "/libero/report/json/updateBlindCode/",
		        method : "POST" ,
				dataType : "json" ,
				data : JSON.stringify({
					"prodPostNo": prodPostNo,
					"blindCode" : blindCode,
					"prodPost" : prodPost,
				}),
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {				
					if(blindCode == 'report'){
						swal("신청 완료", "심사후  공개로 전환됩니다.", "success");
					} else if(blindCode == 'require'){
						swal("승인 완료", "다시 공개됩니다", "success");
					}
					
					setTimeout(function() {
						window.location.reload();
				    }, 500);
				}	
			});

	});
</script>
</head>

<body>
	<jsp:include page="../toolbar.jsp" />

	<div class="container">
		<jsp:include page="topButton.jsp"></jsp:include>
		<div class="row">
			<div class="col-lg-2">

				<a href="/libero/user/getUserReportList?menu=prod"
					class="btn btn-outline-brown waves-effect btn-block" role="button"
					aria-pressed="true" style="margin-bottom: 10px">도서</a> 
				<a href="/libero/user/getUserReportList?menu=post"
					class="btn btn-outline-brown waves-effect btn-block" role="button"
					aria-pressed="true" style="margin-bottom: 10px">게시글</a>


			</div>
			<div class="col-lg-9">



				<form class="form-inline" style="float:right;">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>제목</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>아이디</option>
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
				

			<c:if test="${param.menu=='prod'}"> 
				<table class="table table-hover" id="reportProd" style="font-size: 14px;text-align: center;">
	            <thead>
	                <tr>
						<th align="center">No</th>
						<th align="left">신고 대상</th>
						<th align="left">사유</th>
						<th align="left">신고날짜</th>
						<th align="left">현재상태</th>
						<th align="left">아이디</th>
					</tr>
				</thead>
				<tbody>

						<c:set var="i" value="0" />
						<c:forEach var="report" items="${list}">
							<c:set var="i" value="${ i+1 }" />

							<!-- <tr onClick="location.href='/libero/product/getProduct/${report.product.prodNo}'">  -->
							<tr> 

								<td align="center">${ i }
								<input type="hidden" name="reportNo2" value="${report.reportNo}"/>	
								</td>
								<c:set var="prodName" value="${report.product.prodName}" />
								<td align="left">${fn:substring(prodName,0,15)}
								<c:if test="${fn:length(prodName)>15}">
                                ......
                            	</c:if> 
								</td>
								
								
								<td><c:if test="${report.reportType == 1}">
										<a>성인본 정책 위반</a>
									</c:if> <c:if test="${report.reportType == 2}">
										<a>허위 및 과장 상품</a>
									</c:if> <c:if test="${report.reportType == 3}">
										<a>근거없는 욕설 및 비방</a>
									</c:if> <c:if test="${report.reportType == 4}">
										<a>반복적 광고 및 홍보</a>
									</c:if> <c:if test="${report.reportType == 5}">
										<a>타인의 명예인격권 침해</a>
									</c:if> <c:if test="${report.reportType == 6}">
										<a>기타</a>
									</c:if></td>
								<td><fmt:formatDate value="${report.regDate}" pattern="yyyy.MM.dd" /></td>
								
								<td id="update${report.product.prodNo}" class="updateProdPost"> 
                        		
                        		<c:if test="${report.product.blindCode == 'show'}">공개</c:if>
                        		<c:if test="${user.role!='a' && report.product.blindCode == 'report'}">
                        		<input type='hidden' class="prodNo" name="prodNo" value="${report.product.prodNo}" style="display: none;">
                        		<button type="button" class="btn brown lighten-2 btn-rounded btn-sm my-0 ss" 
                        		name="blindCode" value="${report.product.blindCode}" style="border-radius: 20px; color: white;">숨김 해제
                        		</button>
                        		</c:if>
                        		
                        		<c:if test="${user.role!='a' && report.product.blindCode == 'require'}">
                        		<button type="button" class="btn btn-light btn-rounded btn-sm my-0" 
                        		name="blindCode" value="${report.product.blindCode}"  disabled style="border-radius: 20px;">숨김 해제
                        		</button>
                  				</c:if>
                  				
                  				<c:if test="${user.role=='a' && report.product.blindCode == 'report'}">숨김</c:if>
                  				
                  				<c:if test="${user.role=='a' && report.product.blindCode == 'require'}">	
                  				<input type='hidden' class="prodNo" name="prodNo" value="${report.product.prodNo}" style="display: none;">		
                  				<button type="button" class="btn brown lighten-2 btn-rounded btn-sm my-0 ss" 
                        		name="blindCode" value="${report.product.blindCode}" style="border-radius: 20px; color: white">공개 승인</button>
                  				</c:if>                     		
                        		</td>
								
								<td>${report.product.creator}</td>

							</tr>


						</c:forEach>
						<c:if test="${ empty list}">
							<tr>
								<td colspan="6" style="padding: 40px;">신고된 도서가 없습니다</td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</c:if>
                <%-- ///////////////////////////////////////////////////////////////////////////// --%> 
			<c:if test="${param.menu=='post'}">   
				<table class="table table-hover" id="reportPost" style="font-size: 14px;text-align: center;">
	            <thead>
	                <tr>
						<th align="center">No</th>
						<th align="left">신고 대상</th>
						<th align="left">사유</th>
						<th align="left">신고날짜</th>
						<th align="left">현재상태</th>
						<th align="left">아이디</th>
					</tr>
				</thead>
				<tbody>

						<c:set var="i" value="0" />
						<c:forEach var="report" items="${list}">
							<c:set var="i" value="${ i+1 }" />

							<tr>

								<td align="center">${ i }
								<input type="hidden" name="reportNo1" value="${report.reportNo}"/>
					
								</td>
								<c:set var="postName" value="${report.post.postName}" />
								<td align="left" onClick="location.href='/libero/community/getPost?postNo=${report.post.postNo}'">${fn:substring(postName,0,15)}
								<c:if test="${fn:length(postName)>15}">
                                ......
                            	</c:if> 
								</td>
							
								<td><c:if test="${report.reportType == 1}">
										<a>성인본 정책 위반</a>
									</c:if> <c:if test="${report.reportType == 2}">
										<a>허위 및 과장 상품</a>
									</c:if> <c:if test="${report.reportType == 3}">
										<a>근거없는 욕설 및 비방</a>
									</c:if> <c:if test="${report.reportType == 4}">
										<a>반복적 광고 및 홍보</a>
									</c:if> <c:if test="${report.reportType == 5}">
										<a>타인의 명예인격권 침해</a>
									</c:if> <c:if test="${report.reportType == 6}">
										<a>기타</a>
									</c:if></td>
								<td><fmt:formatDate value="${report.regDate}" pattern="yyyy.MM.dd" /></td>
								
								
							
								
	
								
                        		<td id="update${report.post.postNo}" class="updateProdPost"> 
                        		
                        		<c:if test="${report.post.blindCode == 'show'}">공개</c:if>
                        		<c:if test="${user.role!='a' && report.post.blindCode == 'report'}">
                        		<input type='hidden' class="postNo" name="postNo" value="${report.post.postNo}" style="display: none;">
                        		<button type="button" class="btn brown lighten-2 btn-rounded btn-sm my-0 ss" 
                        		name="blindCode" value="${report.post.blindCode}" style="border-radius: 20px; color: white;">숨김 해제
                        		</button>
                        		</c:if>
                        		
                        		<c:if test="${user.role!='a' && report.post.blindCode == 'require'}">
                        		<button type="button" class="btn btn-light btn-rounded btn-sm my-0" 
                        		name="blindCode" value="${report.post.blindCode}"  disabled style="border-radius: 20px;">숨김 해제
                        		</button>
                  				</c:if>
                  				
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'report'}">숨김</c:if>
                  				
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'require'}">	
                  				<input type='hidden' class="postNo" name="postNo" value="${report.post.postNo}" style="display: none;">		
                  				<button type="button" class="btn brown lighten-2 btn-rounded btn-sm my-0 ss" 
                        		name="blindCode" value="${report.post.blindCode}" style="border-radius: 20px; color: white">공개 승인</button>
                  				</c:if>                     		
                        		</td>
                  				
								<td>${report.user.userId}</td>
								
							</tr>


						</c:forEach>
						<c:if test="${ empty list}">
							<tr>
								<td colspan="6" style="padding: 40px;">신고된 글이 없습니다</td>
							</tr>
						</c:if>

					</tbody>
				</table>
			</c:if>






			</div>
			<%-- col9 --%>
		</div>
		<%-- row --%>
	</div>
	<%-- container--%>
	<jsp:include page="../../common/pageNavigator_new.jsp" />
	<jsp:include page="../../common/footer.jsp"></jsp:include>

</body>

</html>