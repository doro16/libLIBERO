<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	

<title>도서  상세</title>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
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

<div class="container my-5 py-5 z-depth-0">


  <!--Section: Content-->
  <section class="text-center">

    <!-- Section heading -->
    <h3 class="font-weight-bold mb-5">Product Details</h3>

    <div class="row">
      <div class="col-lg-6">

        <!--Carousel Wrapper-->
        <div id="carousel-thumb1" class="carousel slide carousel-fade carousel-thumbnails mb-5 pb-4" data-ride="carousel" style="margin-bottom: 0px; padding-bottom: 0px">

          <!--Slides-->
          <div class="carousel-inner text-center text-md-left z-depth-1" style="width: 400px; height: 450px; margin-bottom: 0px; padding-bottom: 0px" role="listbox">
            <div class="carousel-item active">
              <img style="margin-bottom: 0px;" src="../../resources/images/publish/fileUpload/thumbnailFile/${product.prodThumbnail}"
                alt="First slide" class="img-fluid">
            </div>
            <div class="carousel-item">
              <img src="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
                alt="Second slide" class="img-fluid">
            </div>
          </div>
          <!--/.Slides-->

          <!--Thumbnails-->
          <a class="carousel-control-prev" href="#carousel-thumb1" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel-thumb1" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          <!--/.Thumbnails-->

        </div>
        <!--/.Carousel Wrapper-->
        
        <div class="row mb-4">
          <div class="col-md-12">
            <div id="mdb-lightbox-ui"></div>
            <div class="row mdb-lightbox no-margin" style="width: 500px;">
              <figure class="col-md-4" style="margin: 22px; padding: 0px; height:200px;">
                <a href="../../resources/images/publish/fileUpload/thumbnailFile/${product.prodThumbnail}"
                  data-size="1600x1067">
                  <img src="../../resources/images/publish/fileUpload/thumbnailFile/${product.prodThumbnail}"
                    class="img-fluid z-depth-1" style="height: 200px; width:170px;">
                </a>
              </figure>
              <figure class="col-md-4" style="margin: 22px; padding: 0px;">
                <a href="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
                  data-size="1600x1067">
                  <img src="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
                    class="img-fluid z-depth-1" style="height: 200px; width:170px;">
                </a>
              </figure>
            </div>
          </div>
        </div>
        
      </div>

      <div class="col-lg-5 text-center text-md-left">

        <h2 class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">${product.prodName}
        			
        			<span>
        			<c:if test="${wish == 1}"><i class="fas fa-heart" id="wish"></i></c:if>
					<c:if test="${wish == 0}"><i class="far fa-heart" id="wish"></i></c:if>
					</span>
					<img src="../resources/images/community/">
					</h2>
        			
        <span class="badge badge-danger product mb-4 ml-xl-0 ml-4">bestseller</span>
        <span class="badge badge-success product mb-4 ml-2">SALE</span>

        <h3 class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
          <span class="red-text font-weight-bold">
            <strong>￦<fmt:formatNumber value="${product.retailPrice}" pattern="#,###.###" type="currency"/></strong>
          </span>
          <span class="grey-text">
            <small>
              <s>￦<fmt:formatNumber value="${product.retailPrice*1.1}" pattern="#,###.###" type="currency"/></s>
            </small>
          </span>
        </h3>

        <div class="font-weight-normal">
          <hr/>
          <p class="ml-xl-0 ml-4"><span class="grey-text">배송일 : </span>영업일 기준 약 2~8일 소요됩니다. </p>
          <p class="ml-xl-0 ml-4"><span class="grey-text">환불규정 : </span>주문 후 인쇄되므로 배송이 준비된 후에는 환불이 불가능합니다.</p>
		  <hr/>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">작가 : </span></strong>${product.author} </p>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">상품종류 : </span></strong>${product.prodType} </p>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">등록일자 : </span></strong>${product.regDate} </p>
            <hr/>
          
          <p class="ml-xl-0 ml-4">  
            <strong><span class="grey-text" style="font-size : 20px;">상품형태</span></strong><br/>
          <p class="ml-xl-0 ml-3">
            <strong><span class="grey-text">페이지수 : </span></strong>${product.bookPage}p</p>
              <c:if test="${product.prodType == 'paper'}">
          	  <span class="grey-text" style="font-size : 15px;">인쇄컬러 : </span>${product.colorType}, <span class="grey-text" style="font-size : 15px;">표지 : </span>${product.coverType}, <span class="grey-text" style="font-size : 15px;">내지 : </span>${product.innerType} , <span class="grey-text" style="font-size : 15px;">판형 : </span>${product.sizeType }</p>
          	  </c:if>
          <div class="mt-5">
            <div class="row mt-3 mb-4">
            
              <div class="col-6" style="padding:10px ;">
            
						                <span class="def-number-input number-input safari_only" style="margin-right:0px; padding-top:0px;">
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
										  <input class="quantity" min="0" name="quantity" value="1" type="number" id="buyAmount" >
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
										  </span>
              </div>
              							<span class="col-6">
										  <button class="btn btn-brown btn-rounded" onclick="addCart()" style="margin-top:5px;">
                 						  <i class="fas fa-cart-plus mr-2" aria-hidden="true"></i> Add to cart</button>
										</span>
            </div>
          </div>

        </div>

      </div>
    </div>

  </section>
  <!--Section: Content-->


</div>		
		<!-- 신고 추가 -->
		<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
		<button type="button" class="btn btn-brown btn-md" id="reportBtn" data-toggle="modal" data-target="#redModalSubscription">신고
		</button>
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
		      <div class="container my-5">

  
  <!-- Section: Block Content -->
  <section>
    
    <div class="row">
      <div class="col-12">
      	<div class="card card-list">
          <div class="card-header white d-flex justify-content-between align-items-center py-3">
            <p class="h5-responsive font-weight-bold mb-0">Last Orders</p>
            <ul class="list-unstyled d-flex align-items-center mb-0">
              <li><i class="far fa-window-minimize fa-sm pl-3"></i></li>
              <li><i class="fas fa-times fa-sm pl-3"></i></li>
            </ul>
          </div>
          <div class="card-body">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Order ID</th>
                  <th scope="col">Item</th>
                  <th scope="col">Status</th>
                  <th scope="col">Popularity</th>
                </tr>
              </thead>
              <tbody>
              	  <c:set var="i" value="0" />
				  <c:forEach var="review" items="${review}">
				  <c:set var="i" value="${ i+1 }" />
                <tr>
                  <th scope="row"><a class="text-primary">OR9842</a></th>
                  <td>${review.userId }</td>
                  <td>${review.regDate}</td>
                  <td>${review.Content}</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div class="card-footer white py-3 d-flex justify-content-between">
            <button class="btn btn-primary btn-md px-3 my-0 mr-0">Place New Order</button>
            <button class="btn btn-light btn-md px-3 my-0 ml-0">View All Orders</button>
          </div>
        </div>
      </div>
    </div>

  </section>
  <!-- Section: Block Content -->

  
</div>
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

<jsp:include page="../community/addReport.jsp"/>	
	
<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    //alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyAmount()");
// 	})
	
	function buyAmount(){
		var buyAmount = $("#buyAmount").val();
	}
	
	$(document).ready(function(){
		$('#wish').on("click", function(){
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
					
					if(data.wish == "y"){
						var wishwish = "fas fa-heart";
					}else if(data.wish == "n"){
						var wishwish = "far fa-heart";
					}
					
					
					if(data.message != null){
						alert(data.message);
					}
					
					
					
					$('#wish').attr('class', wishwish);
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