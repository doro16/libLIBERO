<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO : 등록 도서  조회</title>
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="../resources/css/common.css">
		<style type="text/css">
			.prodThumbnail {
				width: 80px;
				height: 100px;
			}
		</style>
	</head>
	<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	
	   	<!-- //////////// Bootstrap Container Start////////////////// -->
	   	<div class="container">
	   		<jsp:include page="topButton.jsp"></jsp:include>
	   		<div class="row">
		   		<div class="col-lg-2" style="padding-top: 65px">
		   			<a href="/libero/user/getUserPublishList?prodType=book" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px">도서</a>
		   				
		   			<a href="/libero/user/getUserPublishList?prodType=prod" 
		   				class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true">서비스상품</a>
		   		</div>
		   		<form>
		   			<input type="hidden" id="currentPage" name="currentPage" value="${search.currentPage}"/>
		   		</form>
		   		
		   		<div id="prodList" class="col-lg-9">
		   		<p style="padding-top: 20px; "> 전체  ${resultPage.totalCount } 건 </p>
				  	<c:forEach var="prod" items="${list}">
						<div class="card border-light mb-3" style="margin-bottom: 20px">
							<div class="card-body">
								<div class="row">
									
							  		<div class="col-lg-2 align-self-center">
						  				<img class="prodThumbnail" src="../resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}">
							  		</div>
							  		
							  		<div class="col-lg-7 align-self-center">
							  			<table>
							  				<tbody>
							  					<tr>
							  						<th>
							  							${param.prodType=='book' ? '도서' : '상품' } 제목</th>
							  						<td>: ${prod.prodName}</td>
							  					</tr>
							  					<c:if test="${param.prodType=='book'}">
								  					<tr>
								  						<th>저자</th>
								  						<td>: ${prod.author}</td>
								  					</tr>
							  					</c:if>
							  					<tr>
							  						<th>등록 일자</th>
							  						<td>: ${prod.regDate}</td>
							  					</tr>
							  					<tr>
							  						<th>판매량</th>
							  						<td>: ${prod.salesCount}</td>
							  					</tr>
							  				</tbody>
							  			</table>
							  		</div>
							  		
							  		<div class="col-lg-3">
							  			<a href="javascript:popup(${prod.prodNo})" 
							   				class="btn btn-info brown lighten-1 btn-block" role="button" 
							   				aria-pressed="true" style="margin-bottom: 10px">판매 통계 조회</a>
							   			<c:if test="${prod.blindCode=='show'}">
							  				<button class="btn btn-outline-brown waves-effect btn-block" onclick="updateCode('${prod.prodNo}','hide',this)">판매 중지하기</button>
							  			</c:if>
							  			<c:if test="${prod.blindCode=='hide'}">
							  				<button class="btn btn-info brown lighten-1 btn-block" onclick="updateCode('${prod.prodNo}','show',this)">판매 재개</button>
							  			</c:if>
							  			<c:if test="${param.prodType=='prod'}">
							  				<a href="/libero/publish/updateProduct?prodNo=${prod.prodNo}"
												class="btn btn-info brown lighten-1 btn-block" role="button" 
												aria-pressed="true" style="margin-top: 10px">상품 수정</a>
							  			</c:if>
							  		</div>
						  		</div>
						  		<!-- row End -->
						  		<c:if test="${prod.blindCode=='report'}">
						  		<div class="row col-lg-12" style="margin:0;padding:0">
										<p style="margin: 0">신고 당한 상품입니다.</p>
								</div>
								</c:if>
						  	</div>
						  	<!-- Card Body End -->
						</div>
					</c:forEach>
				</div>
				
			</div>
	   	</div>
	   	<!-- //////////// Bootstrap Container End////////////////// -->
	   	<jsp:include page="../../common/footer.jsp"></jsp:include>
	</body>
	
	<script type="text/javascript">
		//===============blindCode 수정 =================
		function updateCode(prodNo,blindCode,e) {
			
			$.ajax({
     			type     	: 'GET',
        		url			: '/libero/publish/json/updateBlindCode/'+prodNo+'/'+blindCode,
        		dataType 	: 'json',
                contentType	: "application/json",
        		success: function (data, status) {
        			console.log(e);
        			var hide = "<button class='btn btn-outline-brown waves-effect btn-block' onclick=\"updateCode('"+prodNo+"','hide',this)\">판매 중지하기</button>";
        			var show = "<button class='btn btn-info brown lighten-1 btn-block' onclick=\"updateCode('"+prodNo+"','show',this)\">판매 재개</button>";
        			if (data.blindCode == 'show') {
						$(e).replaceWith(hide);
					}else {
						$(e).replaceWith(show);
					}
        		}
			});
		}
		//==============판매 통계 팝업 ====================
		function popup(prodNo){
	        var url = "/libero/publish/getStatistics?prodNo="+prodNo;
	        var name = "판매 통계 조회";
	        var option = "width = 1000, height = 500, top = 50, left = 50, location = no"
	        window.open(url, name, option);
	    }
	
		$(function () {
			var curPage = 1;
			curPage = parseInt(curPage);
			
			$(window).scroll(function() {
				
		    	if ($(window).scrollTop()+5 >= $(document).height() - $(window).height()) {
		    		var prodType = "${param.prodType}";
		    		curPage++;
		    		getProdList(curPage,prodType);
		     		
		    	}
		  	});
		});
		
		function getProdList(curPage,prodType) {
			
			$.ajax({
     			type     	: 'POST',
        		url			: '/libero/user/json/getUserPublishList/'+prodType,
        		data 		: JSON.stringify({"currentPage": curPage}) ,
        		dataType 	: 'json',
                contentType	: "application/json",
        		success: function (data, status) {
          		// Append next contents
          			if (data.list!="") {
          				$.each(data.list, function(index,prod){
          					var report = (prod.reportType=='1') ? '11111111111': (prod.reportType=='2') ? '22222222222' : (prod.reportType=='3') ? '333333333333' : '44444444444';
          					
              				var card = "<div class='card border-light mb-3' style='margin-bottom: 20px'>"
              								+"<div class='card-body'>"
              									+"<div class='row'>"
             										+"<div class='col-lg-2 align-self-center'>"
   							  							+"<img class='prodThumbnail' src='../resources/images/publish/fileUpload/thumbnailFile/"+prod.prodThumbnail+"'>"
   							  						+"</div>"
    							  					+"<div class='col-lg-7 align-self-center'>"
    										  			+"<table>"
    									  					+"<tbody>"
    									  						+"<tr>"
    									  							+"<th>${param.prodType=='book' ? '도서' : '상품' } 제목</th>"
    									  							+"<td>: "+prod.prodName+"</td>"
    									  						+"</tr>";
    						if (prod.prodType=='paper' || prod.prodType == 'ebook') {
								card += 						"<tr>"
																	+"<th>저자</th>"
																	+"<td>: "+prod.author+"</td>"
																+"</tr>";
							}    						
    						card +=	    					 	"<tr>"
									  								+"<th>등록 일자</th>"
									  								+"<td>: "+prod.regDate+"</td>"
									  							+"</tr>"
									  							+"<tr>"
									  								+"<th>판매량</th>"
									  								+"<td>: "+prod.salesCount+"</td>"
									  							+"</tr>"
									  						+"</tbody>"
														+"</table>"
													+"</div>"
    												+"<div class='col-lg-3'>"
    														+"<a href='javascript:popup("+prod.prodNo+")' class='btn btn-info brown lighten-1 btn-block' role='button' aria-pressed='true' style='margin-bottom:10px'>판매 통계 조회</a>";
														
    						if (prod.blindCode=='show') {
								card += 					'<button class="btn btn-outline-brown waves-effect btn-block" onclick="updateCode(\''+prod.prodNo+'\',\'hide\',this)">판매 중지하기</button>';
							}
    						if (prod.blindCode=='hide') {
    							card += 					"<button class='btn btn-info brown lighten-1 btn-block' onclick='updateCode(\'"+prod.prodNo+"\','show',this)'>판매 재개</button>";
							}
    						
    						if (prodType=='prod') {
    							card += 					"<a href='/libero/publish/updateProduct?prodNo="+prod.prodNo+"' class='btn btn-info brown lighten-1 btn-block' role='button' aria-pressed='true' style='margin-top: 10px'>상품 수정</a>";
							}
							card +=		  			"</div>";
							if (prod.blindCode=='report') {
								card +=				"<div class='row col-lg-12' style='margin:0'>"
														+"<p style='margin: 0'>신고 당한 상품입니다.</p>"
													+"</div>";
							}
							
							card +=				"</div>"
											+"</div>"
										+"</div>";	
              				$("#prodList:last").append(card);
              			});
					}
        		}
      		});
		}
	</script>
</html>