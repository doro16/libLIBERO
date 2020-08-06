<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	
	
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
					          <img class="img-fluid rounded-left" src="../../resources/images/publish/fileUpload/${product.prodThumbnail }" alt="project image">
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
					              <p class="text-uppercase mb-2"><strong>Skills</strong></p>
					              <p class="text-muted mb-4">Design, HTML, CSS, Javascript</p>
					            </li>
					
					            <li>
					              <p class="text-uppercase mb-2"><strong>Address</strong></p>
					              <img src="${wish}" id='wish_img' width="70px" height="70px"/><h6>designed by freepik</h6>
					            </li>
					
					            <li>
					              <p class="text-uppercase mt-4 mb-2"><strong>Share</strong></p>
					             		 
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
				

</body>

<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyAmount()");
// 	})
	
// 	function buyAmount(){
// 		var buyAmount = $("#buyAmount").val();
// 	}
	
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