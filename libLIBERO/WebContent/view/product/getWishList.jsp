<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->

		<jsp:include page="cartWishTopButton.jsp"></jsp:include>	  
<div class="container my-5 py-3 z-depth-1 rounded">


  <!--Section: Content-->
  <section class="dark-grey-text">

    <!-- Shopping Cart table -->
    <div class="table-responsive">

      <table class="table product-table mb-0">

        <!-- Table head -->
        <thead class="brown lighten-4">
          <tr>
            <th></th>
            <th class="font-weight-bold">
              <strong>Product</strong>
            </th>
            <th class="font-weight-bold">
              <strong>ProdType</strong>
            </th>
            <th></th>
            <th class="font-weight-bold">
              <strong>Price</strong>
            </th>
            <th class="font-weight-bold">
              <strong></strong>
            </th>
            <th class="font-weight-bold">
              <strong></strong>
            </th>
            <th></th>
          </tr>
        </thead>
        <!-- /.Table head -->

        <!-- Table body -->
        <tbody>

		<c:set var="i" value="0" />
		<c:forEach var="wishList" items="${wishList}">
		<c:set var="i" value="${ i+1 }" />
          <!-- First row -->
          <tr>
            <th scope="row">
              <img src="../resources/images/publish/fileUpload/thumbnailFile/${wishList.prodThumbnail}" alt="" class="img-fluid z-depth-0" style="height:200px; width:150px;">
            </th>
            <td>
              <h5 class="mt-3">
                <strong><a href="/libero/product/getProduct/${wishList.prodNo}">${wishList.prodName}</a></strong>
              </h5>
              <p class="text-muted">
              <c:if test="${wishList.prodType == 'paper' or wishList.prodType == 'ebook'}">
              ${wishList.author}
              </c:if>
              <c:if test="${wishList.prodType != 'paper' and wishList.prodType != 'ebook' }">
              ${wishList.creator}
              </c:if>
              </p>
            </td>
            <td>${wishList.prodType}</td>
            <td></td>
            <td>${wishList.retailPrice}</td>
  
            <td class="font-weight-bold">
              <strong></strong>
            </td>
            <td>
              	<button class="btn btn-brown btn-rounded" id="addCart" style="margin-top:5px;" value="${i}">
              	<i class="fas fa-cart-plus mr-2" aria-hidden="true"></i> Add to cart</button>
              	<input type="hidden" id="prodType${i}" value="${wishList.prodType}"/>
              	<input type="hidden" id="prodNo${i}" value="${wishList.prodNo}"/>
            </td>
            <td>
              <button type="button" id="deleteWish" class="btn btn-sm btn-brown" data-toggle="tooltip" data-placement="top"
                title="Remove item" value="${i}">X
              </button>
            </td>
          </tr>
          <!-- /.First row -->
		 </c:forEach>
          
        </tbody>
        <!-- /.Table body -->

      </table>

    </div>
    <!-- /.Shopping Cart table -->

  </section>
  <!--Section: Content-->


</div>

</body>


<script type="text/javascript">

					$(document).ready(function(){
							$('#deleteWish').on("click", function(){
								var i = $(this).val();
								console.log(i);
								var userId = "${sessionScope.user.userId}";
								var prodNo = $("#prodNo"+i).val();
								
								console.log(prodNo);
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
									data: {"prodNo": prodNo, "userId": "${sessionScope.user.userId}" },
									success : function(data){
											
										if(data.message != null){
											alert(data.message);
										}
										
										window.location.reload();
									}//end success
								});//end ajax
							});//end click function
					});//end ready
					
				$(document).ready(function(){
					$('#addCart').on("click", function(){
						var i = $(this).val();
						var userId = "${sessionScope.user.userId}";
						var phoneCode = "${sessionScope.user.phoneCode}";
						var buyAmount = 1;
						var prodNo = $("#prodNo"+i).val();
						var prodType = $("#prodType"+i).val();
						console.log(prodNo);
						console.log(prodType)
						
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
									data: {"prodNo": prodNo, "prodType": prodType, "userId": "${sessionScope.user.userId}", "buyAmount": buyAmount, "from": "wish"},
									success : function(data){
												var message = data.result
												alert(message);
									}
								});//end ajax
					})
				})	
					
					</script>
</html>