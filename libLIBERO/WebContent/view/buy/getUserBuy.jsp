<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/cdn.jsp"></jsp:include>
<link rel="stylesheet" href="../resources/css/common.css">
<jsp:include page="../toolbar.jsp"></jsp:include>


<html>
<head>
<meta charset="UTF-8">

<title>libLIBERO</title>

<!--  ///////////////////////// CSS ////////////////////////// -->
		
<script type="text/javascript">
function relocate(prodNo){
	self.location="/libero/product/getProduct/"+prodNo;	
}
</script>
	<style>
				     		.starR1{
							    background: url('../resources/images/product/star_review.png') no-repeat -52px 0;
							    background-size: auto 100%;
							    width: 15px;
							    height: 30px;
							    float:left;
							    text-indent: -9999px;
							    cursor: pointer;
							}
							.starR2{
							    background: url('../resources/images/product/star_review.png') no-repeat right 0;
							    background-size: auto 100%;
							    width: 15px;
							    height: 30px;
							    float:left;
							    text-indent: -9999px;
							    cursor: pointer;
							}
							.starR1.on{background-position:0 0;}
							.starR2.on{background-position:-15px 0;}
							
								.file-field.medium .file-path-wrapper {
								height: 3rem; }
								.file-field.medium .file-path-wrapper .file-path {
								height: 2.8rem; }
								
								.file-field.big-2 .file-path-wrapper {
								height: 3.7rem; }
								.file-field.big-2 .file-path-wrapper .file-path {
								height: 3.5rem; }
																	
				</style>

	
</head>
<body>

<div class="container">
<jsp:include page="/view/user/topButton.jsp"></jsp:include>
<div class="row">
<div class="col-lg-2">
		   			<button class="btn btn-outline-brown waves-effect btn-block" role="button" 
		   				aria-pressed="true" style="margin-bottom: 10px" disabled>주문 상품 상세</button>
</div>
<div class="col">

		  <c:forEach var="getProduct" items="${getProduct}">
			<c:set var="i" value="${ i+1 }" />
			
			<script type="text/javascript">
			
			
			$(function(){
				$("#prodImg"+${i}).on("click",function(){
					self.location="/libero/product/getProduct/"+${getProduct.prodNo};
				})
			
		
			
			//alert($("#addReviewButton${i}").val()+"태욱스")
				//별점 설정 이벤트
				$('.starRev span').click(function(){
					  $(this).parent().children('span').removeClass('on');
					  $(this).addClass('on').prevAll('span').addClass('on');
					  //var content = $("#textarea-char-counter").text();   실험
					  var starRate = $(this).attr("id");
					  
					  $("#starRate${i}").val(starRate);
					  //var star = $("#starRate").val(); 실험
					  //alert(star); 실험
					  //alert(starRate); 실험
					  
					  return false;
				});//end starRev click function
				
		
				
				//등록 버튼 클릭 이벤트
		$('#addButton${i}').click(function(){
					
			var starRate = $('span[class*=on]:last').attr("id"); //별점이 찍힌 가장 마지막 span의 아이디값
				//alert(starRate);
			var content = $("#textarea-char-counter${i}").val(); // 입력한 리뷰내용
				//alert(content);
		//리뷰 내용, 별점
		$.ajax({
			url : "/libero/product/json/addReview",
			type: "POST",
			dataType: "json",
			header : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					 },
			data: {"userId": "${sessionScope.user.userId}", "starRate" : starRate, "reviewContent" : content, "buyNo" : ${getProduct.buyNo} },
			success : function(data, success){
				
				
				var message = data.message;
				//alert(message);
				$('#addReviewModal${i}').modal("hide");
				window.location.reload();
				//alert("성공");
				
			}//end succes
		});//end ajax
		
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	var files = inputFile[0].files;
		formData.append('files', files[0]);
		formData.append('buyNo', $("#addReviewButton${i}").val());
		
		//alert(files);
		//alert(formData.get('buyNo'));
		
		
		$.ajax({
			url : "/libero/product/json/addReviewImage",
			processData : false,
			contentType : false,
			data : formData,
			type: "POST",
			success : function(data, success){
				
				
				var message = data.message;
				//alert(message);
				window.location.reload();
				//alert("성공2");
				
			}//end success
		});//end ajax	
	
		});
		
		

//////////////////////////UPDATE REVIEW
			$("#updateButton${i}").on("click",function(){
				var starRate = $('span[class*=on]:last').attr("id"); //별점이 찍힌 가장 마지막 span의 아이디값
				//alert(starRate);
				var content = $("#textarea-char-counter${i}").val(); // 입력한 리뷰내용
				//alert(content);
				
			$.ajax({
				url : "/libero/product/json/updateReview",
				type: "POST",
				dataType: "json",
				header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
				data: {"userId": "${sessionScope.user.userId}", "starRate" : starRate, "reviewContent" : content, "buyNo" : ${getProduct.buyNo} },
				success : function(data, success){
					
					
					var message = data.message;
					//alert(message);
					$('#addReviewModal${i}').modal("hide");
					window.location.reload();
					//alert("성공");
					
				}//end succes
			});//end ajax
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			formData.append('files', files[0]);
			formData.append('buyNo', $("#updateReviewButton${i}").val());
			
			//alert(files);
			//alert(formData.get('buyNo'));
			
			
			$.ajax({
				url : "/libero/product/json/addReviewImage",
				processData : false,
				contentType : false,
				data : formData,
				type: "POST",
				success : function(data, success){
					
					
					var message = data.message;
					//alert(message);
					window.location.reload();
					//alert("성공2");
					
				}//end success
			});//end ajax	


			})
			
			})	
			
			</script>
			
			
			 <div class="card border-light mb-3" style="margin-bottom: 20px">
				<div class="card-body">
					<div class="row">
						<div class="col-lg-7 align-self-center">
							  			<table>
							  				<tbody>
								  				<tr>
							  						<th>상품 이름</th>
							  						<td>: ${getProduct.prodName}</td>
								  					</tr>
							  					<tr>
							  						<th>상품 가격</th>
							  						<td>:  ${getProduct.retailPrice }</td>
							  					</tr>
							  					<tr>
							  						<th>상품 종류</th>
							  						<td>:  ${getProduct.prodType}</td>
							  					</tr>
							  					<tr>
							  						<th>구매 수량</th>
							  						<td>:  ${getProduct.buyAmount}</td>
							  					</tr>
							  					<tr><th>
							  					<td>
							  					
<!-- 				리뷰 등록 버튼, 모달 내용 -->
								<c:if test="${getProduct.deliveryStatus == 5 }">
								<ul class="navbar-nav">
									<li class="nav-item" id="review${i}">
										<c:if test="${getProduct.reviewFlag == false }">
										<button data-target="#addReviewModal${i}" data-toggle="modal" id="addReviewButton${i}" class="btn btn-outline-brown lighten-3 waves-effect float-left" value="${getProduct.buyNo }" >리뷰등록</button>
										</c:if>
										<c:if test="${getProduct.reviewFlag== true }">
										<button  data-target="#addReviewModal${i}" data-toggle="modal" id="updateReviewButton${i}" class="btn btn-outline-brown lighten-3 waves-effect float-left" value="${getProduct.buyNo }">리뷰수정</button>
										</c:if>
									</li>
								</ul>
								</c:if>
				<!-- 리뷰등록 모달창 -->				
				<div class="modal fade" id="addReviewModal${i}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
						<div class="modal-content">
								<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">리뷰 등록</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
										</button>
								</div>
								<div class="modal-body">
										<form name="addReviewForm">
												<div class="form-group">
												<label for="recipient-name" class="col-form-label">별점</label>
													<div class="starRev">
													  <span class="starR1 on" id="5" >별1_왼쪽</span>
													  <span class="starR2" id="10" >별1_오른쪽</span>
													  <span class="starR1" id="15" >별2_왼쪽</span>
													  <span class="starR2" id="20" >별2_오른쪽</span>
													  <span class="starR1" id="25" >별3_왼쪽</span>
													  <span class="starR2" id="30" >별3_오른쪽</span>
													  <span class="starR1" id="35" >별4_왼쪽</span>
													  <span class="starR2" id="40" >별4_오른쪽</span>
													  <span class="starR1" id="45" >별5_왼쪽</span>
													  <span class="starR2" id="50" >별5_오른쪽</span>
													  <input type="hidden" id="starRate${i}" name="starRate" value="">
													</div></br>
													</br>
												
												<!--Material textarea-->
													
													<div class="md-form">
														  <textarea id="textarea-char-counter${i }" class="form-control md-textarea" length="120" rows="3" name="reviewContent"></textarea>
														  <label for="textarea-char-counter" id="review${i}">리뷰 내용</label>
														  <input type="hidden" id="reviewContent${i}" name="reviewContent">
													</div>
												</div>
												
												<div class="md-form" action="#">
												  <div class="file-field">
												    <div class="btn blue-gradient btn-sm float-left">
												      <span><i class="fas fa-cloud-upload-alt mr-2" aria-hidden="true"></i>리뷰 사진</span>
												      <input type="file" name='uploadFile' multiple>
												    </div>
												    
												  </div>
												</div>
										</form>
								</div>
								
								
								
								<div class="modal-footer">
								
								<c:if test="${getProduct.reviewFlag == false }">
										<button type="button" class="btn btn-cyan" id="addButton${i}">등록</button>
								</c:if>		
								<c:if test="${getProduct.reviewFlag == true }">
										<button type="button" class="btn btn-cyan" id="updateButton${i}">수정</button>
								</c:if>
										
										<button type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">취소</button>
								</div>
							</div>
							</div>
						</div>		
				
				
					
											  					
							  					</tr>
							  				</tbody>
							  			</table>
<%-- 							  			<br><br><br><jsp:include page="/view/product/addReview.jsp"/> --%>
							  		</div>
<!-- 							  		여기는 테이블옆부분 -->
									<div class="view overlay zoom" >
									 <img src="/libero/resources/images/publish/fileUpload/thumbnailFile/${getProduct.prodThumbnail }" class="img-thumbnail hoverable" alt="Responsive image" width= 200px onClick="relocate(${getProduct.prodNo})">
									  <div class="mask flex-center waves-effect waves-light" id="prodImg${i}">
									    <p class="white-text">상세정보</p>
									  </div>
									</div>
								</div>
								<c:if test="${getProduct.prodType == 'ebook' }">
								<div>
									<a href="/libero/resources/images/publish/fileUpload/manuFile/${getProduct.manuFile}" download="manuFile"><button class="btn btn-outline-warning waves-effect" type="button">전자책 다운로드</button></a>
								</div>
								</c:if>
								<c:if test="${getProduct.prodType == 'design' }">
								<div>
									<a href="/libero/resources/images/publish/fileUpload/coverFile/${getProduct.coverFile}" download="manuFile"><button class="btn btn-outline-warning waves-effect" type="button">표지 파일</button></a>
								</div>
								</c:if>
								<c:if test="${getProduct.prodType == 'target' }">
								<div>
									<a href="/libero/resources/images/publish/fileUpload/coverFile/${getProduct.coverFile}" download="manuFile"><button class="btn btn-outline-warning waves-effect" type="button">표지 파일</button></a>
								</div>
								</c:if>	
									
					  		<!-- row End -->
					  		
						</div>
					</div>
				
				
				
          </c:forEach>
          </div>
          </div>
          </div>
        
</body>



</body>
<jsp:include page="/common/footer.jsp"></jsp:include>
</html>
