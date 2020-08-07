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

		$("#reportProd").on("click", function() {
			$("#reportProd").show();
			$("#reportPost").hide();
		})

		$("reportPost").on("click", function() {
			$("#reportProd").show();
			$("#reportPost").hide();
		})

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



				<form class="form-inline text-right">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>글번호</option>
							<option value="1"
								${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>글제목</option>
							<option value="2"
								${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>글내용</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">검색</button>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>

				<p style="float: left">전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</p>

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


							<tr onClick="location.href='/libero/product/getProduct/${report.product.prodNo}'"> 

								<td align="center">${ i }</td>
								<c:set var="prodName" value="${report.product.prodName}" />
								<td align="left">${fn:substring(prodName,0,20)}
								<c:if test="${fn:length(prodName)>20}">
                                ......
                            	</c:if> 
								</td>
								<input type="hidden" value="${report.product.prodNo}" />
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
								<c:if test="${report.post.blindCode == 'show'}"><td>공개</td></c:if>
								<c:if test="${user.role!='a' && report.post.blindCode == 'report'}">
                        		<td>
                        		<button type="button" class="btn btn-warning btn-rounded btn-sm my-0" style="border-radius: 20px;">숨김 해제<%-- 유저가요청 --%>
                        		</button>
                        		</td>
                  				</c:if>
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'report'}">
                        		<td>
                        		숨김
                        		</td>
                  				</c:if>
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'require'}">							
                        		<td><button type="button" class="btn btn-primary btn-rounded btn-sm my-0" style="border-radius: 20px;">공개 승인</button></td>
                  				</c:if>
								
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


							<tr onClick="location.href='/libero/community/getPost?postNo=${report.post.postNo}'">

								<td align="center">${ i }</td>
								<c:set var="postName" value="${report.post.postName}" />
								<td align="left">${fn:substring(postName,0,20)}
								<c:if test="${fn:length(postName)>20}">
                                ......
                            	</c:if> 
								</td>
								<input type="hidden" value="${report.post.postNo}" />
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
								<c:if test="${report.post.blindCode == 'show'}"><td>공개</td></c:if>
								<c:if test="${user.role!='a' && report.post.blindCode == 'report'}">
                        		<td>
                        		<button type="button" class="btn btn-warning btn-rounded btn-sm my-0" style="border-radius: 20px;">숨김 해제<%-- 유저가요청 --%>
                        		</button>
                        		</td>
                  				</c:if>
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'report'}">
                        		<td>
                        		숨김
                        		</td>
                  				</c:if>
                  				<c:if test="${user.role=='a' && report.post.blindCode == 'require'}">							
                        		<td><button type="button" class="btn btn-primary btn-rounded btn-sm my-0" style="border-radius: 20px;">공개 승인</button></td>
                  				</c:if>
								
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

</body>

</html>