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
	
		<link rel="stylesheet" href="../resources/css/common.css">
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
                alt="First slide" width="400px" height="450px">
            </div>
            <c:if test="${product.coverFile != null }">
            <div class="carousel-item">
              <img src="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
                alt="Second slide" width="400px" height="450px">
            </div>
            </c:if>
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
              <c:if test="${product.coverFile != null }">
	              <figure class="col-md-4" style="margin: 22px; padding: 0px;">
	                <a href="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
	                  data-size="1600x1067">
	                  <img src="../../resources/images/publish/fileUpload/coverFile/${product.coverFile}"
	                    class="img-fluid z-depth-1" style="height: 200px; width:170px;">
	                </a>
	              </figure>
              </c:if>
            </div>
          </div>
        </div>
        
      </div>

      <div class="col-lg-5 text-center text-md-left">

        <h2 class="h2-responsive text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">${product.prodName}
        			
        			<span>
        			<c:if test="${wish == 1}"><i class="fas fa-heart fa-xs red-text" id="wish"></i></c:if>
					<c:if test="${wish == 0}"><i class="far fa-heart fa-xs red-text" id="wish"></i></c:if>
					</span>
					<!-- 신고 추가 -->
					<input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
					<button type="button" class="btn btn-link btn-md justify-content-right " id="reportBtn" data-toggle="modal" data-target="#redModalSubscription" style="font-size: 13px;">
					<span class="orange-text">신고</span>
					</button>
					<input type="hidden" id="prodPost" name="prodPost" value="prod"/>
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
         
          <p class="ml-xl-0 ml-4"><span class="grey-text"></p>
          <p class="ml-xl-0 ml-4"><span class="grey-text">환불규정 : </span>작가서비스 환불은 libLIBERO 규정에 의거합니다.</p>
		  <hr/>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">작가 이메일 : </span></strong>${product.creator } </p>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">상품종류 : </span></strong>${product.prodType} </p>
          <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text">등록일자 : </span></strong>${product.regDate} </p>
            <hr/>
            
             <p class="ml-xl-0 ml-4">
            <strong><span class="grey-text"></span></strong>
              <c:set var="i" value="0" />
							  <c:forEach var="hashtag" items="${hashtag}">
							  <c:set var="i" value="${ i+1 }" />
			
			 <a href="/libero/product/getProductListBySearch?searchCondition=hashTag&searchKeyword=${hashtag}"><strong><span class="grey-text">#${hashtag}, </span></strong></a> 

            				  </c:forEach>
            </p>
            
            
            
         
          <p class="ml-xl-0 ml-4">  
            <strong><span class="grey-text" style="font-size : 20px;">상품형태</span></strong><br/>
          <p class="ml-xl-0 ml-3">
              <c:if test="${product.prodType == 'design'}">
          	  <span class="grey-text" style="font-size : 15px;">미리 제작된 표지상품입니다. 이미지파일을 다운받으실 수 있습니다.</span>
          	  </c:if>
          	  <c:if test="${product.prodType == 'target'}">
          	  <span class="grey-text" style="font-size : 15px;">디자이너를 통해 맞춤형 표지를 제작하실 수 있습니다.</span>
          	  </c:if>
          	  <c:if test="${product.prodType == 'correct'}">
          	  <span class="grey-text" style="font-size : 15px;">교정, 교열 서비스를 제공하는 상품입니다.</span>
          	  </c:if>
          <div class="mt-5">
            <div class="row mt-3 mb-4">
            
              <div class="col-6" style="padding:10px ;">
            							
            							<!--  
						                <span class="def-number-input number-input safari_only" style="margin-right:0px; padding-top:0px;">
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
										  <input class="quantity" min="0" name="quantity" value="1" type="number" id="buyAmount" >
										  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
										  </span>-->
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
		
		
		<div class="container">		
		<!-- Nav tabs -->
<ul class="nav nav-tabs md-tabs nav-justified brown-color" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#panel555" role="tab">
      상품상세</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#panel666" role="tab">
      리뷰</a>
  </li>
</ul>
<!-- Nav tabs -->

<!-- Tab panels -->
<div class="tab-content">

  <!-- Panel 1 -->
  <div class="tab-pane fade in show active" id="panel555" role="tabpanel">

    <!-- Nav tabs -->
    <div class="row">
      <div class="col-md-12" style="padding-top: 20px">
       
      ${product.prodDetail}
     
      </div>
    </div>
    <!-- Nav tabs -->

  </div>
  <!-- Panel 1 -->

  <!-- Panel 2 -->
  <div class="tab-pane fade" id="panel666" role="tabpanel">

   <div class="container my-5">


  <!--Section: Block Content-->
  <section class="dark-grey-text mb-5">

    <!-- Section heading -->
    <h3 class="font-weight-bold text-center mb-5">Product Reviews</h3>
    						  <c:set var="i" value="0" />
							  <c:forEach var="review" items="${review}">
							  <c:set var="i" value="${ i+1 }" />
    
    <div class="media mb-3">
      <img class="card-img-100 rounded-circle z-depth-1-half d-flex mr-3" src="../../resources/images/user/fileUpload/${review.user.profile}" alt="Generic placeholder image">
      <div class="media-body">
        <a>
          <h5 class="user-name font-weight-bold">${review.user.nickname}</h5>
        </a>
        <!-- Rating -->
        <ul class="rating mb-2">
          <li>
          
        <c:choose>
         
         <c:when test = "${15 > review.starRate && review.starRate >=1}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when>
          <c:when test = "${20>review.starRate && review.starRate >=15}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star-half-alt yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when>
          <c:when test = "${25>review.starRate && review.starRate>=20}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when>
          <c:when test = "${30>review.starRate && review.starRate>=25}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star-half-alt yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when>    
          <c:when test = "${35>review.starRate && review.starRate>=30}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when> 
          <c:when test = "${40>review.starRate && review.starRate>=35}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star-half-alt yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
          </c:when>     
           <c:when test = "${45>review.starRate && review.starRate>=40}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="far fa-star yellow-text"></i>
         </c:when>  
         <c:when test = "${50>review.starRate && review.starRate>=45}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star-half-alt yellow-text"></i>
         </c:when>  
          <c:when test = "${50==review.starRate}">
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
 			<i class="fas fa-star yellow-text"></i>
         </c:when>  

         
      </c:choose>
          </li>
        </ul>
        <div class="card-data">
          <ul class="list-unstyled mb-1">
            <li class="comment-date font-small grey-text">
              <i class="far fa-clock"></i>${review.regDate}</li>
          </ul>
        </div>
        <p class="dark-grey-text article">${review.reviewContent}</p>
        <!-- <p><a href="#" class="more" id="more${i}" value="${i}">more</a></p> -->
        <button class="more btn btn-link" id="${i}" value="0">more</button>
        <div id="img${i}"></div>
        <input type="hidden" id="imgset${i}" value="${review.reviewImage}">
      </div>
    </div>
    	</c:forEach>
    
  

	</section>
  <!--Section: Block Content-->


</div>

  </div>
  <!-- Panel 2 -->

</div>
<!-- Tab panels -->

<!-- 장바구니 모달 -->
<div class="modal fade right" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-side and then add class .modal-top-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-warning" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100 text-white" id="myModalLabel">장바구니 등록 완료</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-3">
      			<p></p>
      			<p class="text-center">
      				<i class="fas fa-shopping-cart fa-4x"></i>
      			</p>
      		</div>
      		<div class="col-9">
            	<p>장바구니에 물건이 담겼습니다.</p>
            	<span class="badge">${product.prodName}</span>
            </div>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-warning waves-effect btn-md" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-warning lighten-1 btn-md" onclick="location.href='/libero/product/getCartList'">장바구니 이동</button>
      </div>
    </div>
  </div>
</div>
<!-- Side Modal Top Right -->

</div>		
		
		
<jsp:include page="../../common/footer.jsp"></jsp:include>	
		
		
		
		
		
		
		
		
		
	
  
 
		
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
						var wishwish = "fas fa-heart fa-xs red-text";
					}else if(data.wish == "n"){
						var wishwish = "far fa-heart fa-xs red-text";
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
			//alert("로그인 해주세요.");
			swal("로그인 해주세요!","","warning")
			return;
		}
		if (phoneCode!=1) {
			//alert("휴대폰 본인인증을 완료한 회원만 가능합니다.");
			swal("휴대폰인증을 완료한 회원만 가능합니다.","","warning")
			return;
		}
		if (buyAmount==0) {
			//alert("수량을 선택해주세요.");
			swal("수량을 선택해 주세요","","warning")
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
			data: {"prodNo": ${product.prodNo}, "prodType": "${product.prodType}", "userId": "${sessionScope.user.userId}", "buyAmount": 1, "from": "product"},
			success : function(data){
						var message = data.result
						$("#cartModal").modal("show");
			}
		});//end ajax
		
	}//end addCart
	

	$(function(){
		$(".more").on("click",function(){
			
			morecode = $(this).val();
			
			var i = $(this).attr("id");
			console.log(i);
			var reviewImage = $("#imgset"+i).val();
			console.log(reviewImage);
			
			
			if(morecode == 0){
				
				
				
				var displayValue = "<img src='../../resources/images/product/fileUpload/review/"+reviewImage+"'>"
				
				
				$("#img"+i).append(displayValue);
				$(this).val(1);
				
				
			}else if(morecode == 1){
				$("#img"+i).remove();
				$(this).val(0);
			}
			
			
			})
			
			
		})//end function
	
		
		//$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addCart").submit();
	</script>
</html>