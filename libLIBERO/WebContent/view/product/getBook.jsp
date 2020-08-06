<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<jsp:include page="../community/addReport.jsp"/>
	
	
	
	
	
<title>도서  상세</title>
		
</head>


<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
		<jsp:include page="../community/addReport.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	  	<style>
									.number-input input[type="number"] {
							-webkit-appearance: textfield;
							-moz-appearance: textfield;
							appearance: textfield;
							}
							
							.number-input input[type=number]::-webkit-inner-spin-button,
							.number-input input[type=number]::-webkit-outer-spin-button {
							-webkit-appearance: none;
							}
							
							.number-input {
							  display: flex;
							  justify-content: space-around;
							  align-items: center;
							}
							
							.number-input button {
							-webkit-appearance: none;
							background-color: transparent;
							border: none;
							align-items: center;
							justify-content: center;
							cursor: pointer;
							margin: 0;
							position: relative;
							}
							
							.number-input button:before,
							.number-input button:after {
							display: inline-block;
							position: absolute;
							content: '';
							height: 2px;
							transform: translate(-50%, -50%);
							}
							
							.number-input button.plus:after {
							transform: translate(-50%, -50%) rotate(90deg);
							}
							
							.number-input input[type=number] {
							text-align: center;
							}
							
							.number-input.number-input {
							border: 1px solid #ced4da;
							width: 10rem;
							border-radius: .25rem;
							}
							
							.number-input.number-input button {
							width: 2.6rem;
							height: .7rem;
							}
							
							.number-input.number-input button.minus {
							padding-left: 10px;
							}
							
							.number-input.number-input button:before,
							.number-input.number-input button:after {
							width: .7rem;
							background-color: #495057;
							}
							
							.number-input.number-input input[type=number] {
							max-width: 4rem;
							padding: .5rem;
							border: 1px solid #ced4da;
							border-width: 0 1px;
							font-size: 1rem;
							height: 2rem;
							color: #495057;
							}
							
							@media not all and (min-resolution:.001dpcm) {
							@supports (-webkit-appearance: none) and (stroke-color:transparent) {
							
							.number-input.def-number-input.safari_only button:before,
							.number-input.def-number-input.safari_only button:after {
							margin-top: -.3rem;
							}
							}
							}

	</style>
	
	
	
</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
					
					<div class="container my-5">

					  <section>
					    
					    <div class="card mb-4 z-depth-0 w-120">
					      
					      <div class="row">
					
					        <div class="col-md-6">
					          <img class="img-fluid rounded-left" src="../../resources/images/publish/fileUpload/thumbnailFile/${product.prodThumbnail }" alt="project image">
					        </div>
					
					        <div class="col-md-6 p-5 align-self-center ">
					
					          <h5 class="font-weight-normal mb-3">상품명</h5>
					
					          <p class="text-muted">${product.prodName}</p>
					
					          <ul class="list-unstyled font-small mt-5 mb-0">
					            <li>
					              <p class="text-uppercase mb-2"><strong>작가</strong></p>
					              <p class="text-muted mb-4">${product.creator}</p>
					            </li>
					
					            <li>
					              <p class="text-uppercase mb-2"><strong>등록일자</strong></p>
					              <p class="text-muted mb-4">${product.regDate}</p>
					            </li>
					
					            <li>
					              <p class="text-uppercase mb-2"><strong>도서 정보</strong></p>
					              <p class="text-muted mb-4">Page : ${product.bookPage}</p>
					              <p class="text-muted mb-4">Size : ${product.sizeType}</p>
					              <p class="text-muted mb-4">Color : ${product.colorType}</p>
					              <p class="text-muted mb-4">Cover : ${product.coverType}</p>
					              <p class="text-muted mb-4">Inner : ${product.innerType}</p>
					            </li>
					
					            <li>
					              <p class="text-uppercase mb-2"><strong>좋아요?</strong></p>
					              <img src="${wish}" id='wish_img' width="70px" height="70px"/><h6>designed by freepik</h6>
					            </li>
					
					            <li>
					              <p class="text-uppercase mt-4 mb-2"><strong>장바구니</strong></p>
					             		 
					              		<div class="def-number-input number-input safari_only">
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
										  <input class="quantity" min="0" name="quantity" value="1" type="number" id="buyAmount" >
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
										</div>
										<button type="button" class="btn btn-so" onclick="addCart()"><i class="fas fa-cart-plus" ></i></button>
					              
					            </li>
					
					          </ul>
					
					        </div>
					
					      </div>
					
					    </div>

  </section>

</div>
		<!-- 신고 추가 -->
		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
		<button id="reportBtn" class="btn btn-outline-info">신고</button>
		<input type="hidden" id="prodPost" name="prodPost" value="prod"/>
		
		<!-- Classic tabs -->
		<div class="classic-tabs">
		
		  <ul class="nav tabs-cyan" id="myClassicTab" role="tablist">
		    <li class="nav-item">
		      <a class="nav-link  waves-light active show" id="profile-tab-classic" data-toggle="tab" href="#profile-classic"
		        role="tab" aria-controls="profile-classic" aria-selected="true">Profile</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="follow-tab-classic" data-toggle="tab" href="#follow-classic" role="tab"
		        aria-controls="follow-classic" aria-selected="false">Follow</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="contact-tab-classic" data-toggle="tab" href="#contact-classic" role="tab"
		        aria-controls="contact-classic" aria-selected="false">Contact</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link waves-light" id="awesome-tab-classic" data-toggle="tab" href="#awesome-classic" role="tab"
		        aria-controls="awesome-classic" aria-selected="false">Be awesome</a>
		    </li>
		  </ul>
		  <div class="tab-content border-right border-bottom border-left rounded-bottom" id="myClassicTabContent">
		    <div class="tab-pane fade active show" id="profile-classic" role="tabpanel" aria-labelledby="profile-tab-classic">
		      
		    </div>
		    <div class="tab-pane fade" id="follow-classic" role="tabpanel" aria-labelledby="follow-tab-classic">
						 
						 
			 		  <c:set var="i" value="0" />
							  <c:forEach var="review" items="${review}">
								<c:set var="i" value="${ i+1 }" />
								<tr>
									<td align="center">${ i }</td>
									<td align="left"  title="Click : 주문정보 확인">
									
										${review.starRate} <br/>
										${review.userId }<br/>
										${review.regDate} <br/>
										${review.reviewContent} <br/>
										${review.reviewImage}
										<img src="../../resources/images/product/fileUpload/review/${review.reviewImage}">
										
									</td>
					          </c:forEach>
					
		    </div>
		    <div class="tab-pane fade" id="contact-classic" role="tabpanel" aria-labelledby="contact-tab-classic">
		      <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
		        deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
		        provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.
		        Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est
		        eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas
		        assumenda est, omnis dolor repellendus. </p>
		    </div>
		    <div class="tab-pane fade" id="awesome-classic" role="tabpanel" aria-labelledby="awesome-tab-classic">
		      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
		        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
		        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
		        eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
		        deserunt mollit anim id est laborum.</p>
		    </div>
		  </div>
		
		</div>
		<!-- Classic tabs -->
		
		 	

</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyAmount()");
// 	})
	
	function buyAmount(){
		var buyAmount = $("#buyAmount").val();
	}
	
	$(document).ready(function(){
			$('#wish_img').on("click", function(){
				var userId = "${sessionScope.user.userId}";
				if (userId=="") {
					alert("로그인 해주세요.");
					return;
				}
				
				
			
				$.ajax({
					url : "/libero/product/json/addWish",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": ${product.prodNo}, "userId": "${sessionScope.user.userId}" },
					success : function(data){
						
						var wish_img = data.wishImage
			
						$('#wish_img').attr('src', wish_img);
					}//end success
				});//end ajax
			});//end click function
	});//end ready
	
	function addCart() {
		var userId = "${sessionScope.user.userId}";
		var phoneCode = "${sessionScope.user.phoneCode}";
		var buyAmount = $("#buyAmount").val();
		//alert(buyAmount);
		
		if (userId=="") {
			alert("로그인 해주세요.");
			return;
		}
		if (phoneCode!=1) {
			alert("휴대폰 본인인증을 완료한 회원만 가능합니다.");
			return;
		}
		if (buyAmount==0) {
			alert("수량을 선택해주세요.");
			return;
		}
		
		$.ajax({
			url : "/libero/product/json/addCart",
			type: "POST",
			dataType: "json",
			header : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
			},
			data: {"prodNo": ${product.prodNo}, "prodType": "${product.prodType}", "userId": "${sessionScope.user.userId}", "buyAmount": buyAmount, "from": "product"},
			success : function(data){
						var message = data.result
						alert(message);
			}
		});//end ajax
		
	}//end addCart
		
		//$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addCart").submit();
	</script>
</html>