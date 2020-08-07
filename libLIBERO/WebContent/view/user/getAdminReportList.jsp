<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		$("form").attr("method", "POST").attr("action",
				"/libero/user/getAdminReportList").submit();
	}

	$(function() {

		$("#reportProd").on("click", function() {
			$("#reportProd").css("display", "block");
			$("#reportPost").css("display", "none");
		})

		$("reportPost").on("click", function() {
			$("#reportProd").css("display", "none");
			$("#reportPost").css("display", "block");
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

				<a href="/libero/user/getAdminActivityList?menu=c"
					class="btn btn-outline-brown waves-effect btn-block" role="button"
					aria-pressed="true" style="margin-bottom: 10px">도서</a> <a href="#"
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

				<p style="float: left">전체 ${resultPage.totalCount } 건수, 현재
					${resultPage.currentPage} 페이지</p>


				<table class="table table-hover" id="myPost"
					style="font-size: 14px; text-align: center;">
					<thead>
						<tr>
							<th align="center">No</th>
							<th align="left">신고 대상</th>
							<th align="left">사유</th>
							<th align="left">신고날짜</th>
							<th align="left">현재상태</th>
							<th align="left">신고자</th>
							<th align="left">피신고자</th>
						</tr>
					</thead>
					<tbody>

						<c:set var="i" value="0" />
						<c:forEach var="report" items="${list}">
							<c:set var="i" value="${ i+1 }" />


							<tr>

								<td align="center"
									onClick="location.href='/libero/community/getPost?postNo=${report.post.postNo}'">${ i }</td>
								<c:set var="postName" value="${report.post.postName}" />
								<td align="left">${fn:substring(postName,0,20)}<c:if
										test="${fn:length(postName)>20}">
                                ......
                            </c:if> <%-- <font color='red'>(${post.comments})</font>--%>
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
								<td>${report.regDate}</td>
								<td>${report.post.blindCode}</td>
								<td>${report.user.nickname}</td>
								<td>${report.post.user.userId}</td>

							</tr>


						</c:forEach>
						<c:if test="${ empty list}">
							<tr>
								<td colspan="6" style="padding: 40px;">아직 작성한 글이 없습니다</td>
							</tr>
						</c:if>

					</tbody>
				</table>








			</div>
			<%-- col9 --%>
		</div>
		<%-- row --%>
	</div>
	<%-- container--%>
	<jsp:include page="../../common/pageNavigator_new.jsp" />

</body>

</html>