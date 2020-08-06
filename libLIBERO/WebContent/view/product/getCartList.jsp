<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
<br/>
<br/>
<br/>
<br/>

		<div class="container my-5 py-3 z-depth-0 rounded">


  <!--Section: Content-->
  <section class="dark-grey-text">

    <!-- Shopping Cart table -->
    <div class="table-responsive">

      <table class="table product-table mb-0">

        <!-- Table head -->
        <thead class="mdb-color lighten-5">
          <tr>
            <th></th>
            <th class="font-weight-bold">
              <strong>Product</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Color</strong>
            </th>
            <th></th>
            <th class="font-weight-bold">
              <strong>Price</strong>
            </th>
            <th class="font-weight-bold">
              <strong>QTY</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Amount</strong>
            </th>
            <th></th>
          </tr>
        </thead>
        <!-- /.Table head -->

        <!-- Table body -->
        <tbody>

          <!-- First row -->
          <!--  
          <c:set var="totalPrice" value="0"/>
		  <c:set var="i" value="0" />
		  <c:forEach var="cartList" items="${cartList}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var="totalPrice" value="${totalPrice + cartList.buyAmount * cartList.retailPrice }"/>
			<tr>
				<td align="center">${ i }</td>
				<form id="form${i}" value="${i}">
				 	<input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
				 	구매번호 : ${buyNoList[i-1]}</br> 
					상품번호 : ${cartList.prodNo }	 <br/>	<input type="hidden" class="prodNo" id="prodNo${i}" name="prodNo${i}"  value="${cartList.prodNo}">
					상품타입 : ${cartList.prodType} <br/>
					상품명 : ${cartList.prodName} <br/>
					가격 : ${cartList.retailPrice} <br/><input type="hidden" class="retailPrice" name="retailPrice${i}" id="retailPrice${i}" value="${cartList.retailPrice}">
					수량 : ${cartList.buyAmount}<br/><input type="number" class="buyAmount" name="buyAmount${i}" id="${i}" value="${cartList.buyAmount}">개
					<p id="each${i}">가격 : ${cartList.buyAmount * cartList.retailPrice}</p> 
					<input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
					<button type="button" class="removeButton" id="button${i}" class="btn btn-info btn-block" value="${cartList.prodNo}">삭제</button>
					
				</form></tr>
				

          </c:forEach>-->
          
          
          
          
          
          
          <!--  -->
           <c:set var="totalPrice" value="0"/>
		  <c:set var="i" value="0" />
		  <c:forEach var="cartList" items="${cartList}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var="totalPrice" value="${totalPrice + cartList.buyAmount * cartList.retailPrice }"/>
          	<form id="form${i}" value="${i}">
          
          
          
          <tr>
            <th scope="row">
              <img src="../../resources/images/publish/fileUpload/thumbnailFile/${cartList.prodThumbnail }" alt="" class="img-fluid z-depth-0">
            </th>
            <td>
              <h5 class="mt-3">
                <strong>${cartList.prodName}</strong>
              </h5>
              <p class="text-muted">${product.author}</p>
            </td>
            <td>White</td>
            <td></td>
            <td>${cartList.retailPrice}</td><input type="hidden" class="retailPrice" name="retailPrice${i}" id="retailPrice${i}" value="${cartList.retailPrice }">
            <td>
              <input type="number" value="${cartList.buyAmount}" aria-label="Search" class="form-control" name="buyAmount${i}" id="${i}" style="width: 100px" value="${cartList.buyAmount}">
            </td>
            <td class="font-weight-bold">
              <strong id="each${i}">${cartList.buyAmount * cartList.retailPrice}</strong>
            </td>
            <td>
              <button type="button" class="removeButton btn btn-dark" data-toggle="tooltip" data-placement="top" title="Remove item" name="buyAmount${i}" id="button${i}" value="${cartList.prodNo}">X </button>
              <input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
              <input type="hidden" class="prodNo" id="prodNo${i}" name="prodNo${i}" value="${cartList.prodNo}">
             
            </td>
          </tr>
				</form>
          </c:forEach>
          
          <!-- /.First row -->

        </tbody>
        <!-- /.Table body -->

      </table>
      
      <h1 id="totalPrice">총액 : ${totalPrice} </h1>
        		<form>
					<input type="hidden" name="buyNoList" value="${buyNoList}">
					<input type="hidden" id="actualPrice" name="actualPrice" value="${totalPrice}">
				</form>
		<button type="button" id="button" class="btn btn-light">구매</button>

    </div>
    <!-- /.Shopping Cart table -->

  </section>
  <!--Section: Content-->


</div>
		
		
		
		
		
		


</body>



<script type = "text/javascript">
	
	
// 		$(function() {
// 			var total = 0;
			
			
// 			$("input:checkbox").on("click", function(){
// 				if($("input:checkbox").is(":checked")==true){
// 					alert("dd")
// 				var i = $(this).next().val();
// 				alert(i)


// 				total = total + parseInt(i);
// 				alert(total)
// 				})	
// 			})
// 		})

		$(function() {
			
			$('.form-control').click(function(){
					
				var buyAmount = $(this).val();
				alert(buyAmount);
				//i는 포문의 몇번째인지 뽑기 위해 일부로 buyAmount의 id를 i로 설정해놓고 뽑아온것
				var i = $(this).attr("id"); //상품이 리스트중 몇번째 상품인지 추출
				//alert(i);
				var prodNo = $("#prodNo"+i).val();
				var retailPrice = $("#retailPrice"+i).val();
				//alert(retailPrice);
				var eachPrice = parseInt(retailPrice)*parseInt(buyAmount);
				//alert(eachPrice)
				$("#each"+i).html("가격 : "+eachPrice);//업데이트된 eachPrice 화면출력
				$("#eachPrice"+i).val(eachPrice);//업데이트된 eachPrice input의 value 업데이트
				var each = $("#eachPrice"+i).val()
				alert(each);
				var k = $(".buyAmount:Last").attr("id"); //상품 리스트 갯수 추출
				var kk = parseInt(k)+1;
				//alert(k);
				//alert(kk);
				
				
// 				var eachPrice1 = $("#eachPrice1").val();
// 				var eachPrice2 = $("#eachPrice2").val();
// 				var eachPrice3 = $("#eachPrice3").val();
// 				alert(eachPrice1);
// 				alert(eachPrice2);
// 				alert(eachPrice3);
				var totalPrice=0;
				for (var i=1; i<kk ; i++){
					
							var eachPrice=parseInt($("#eachPrice"+i).val());
							totalPrice += eachPrice;
				}
				$("#totalPrice").html("총액 : "+totalPrice);
				$("#actualPrice").val(totalPrice);
				var actualPrice = $("#actualPrice").val();
				alert(actualPrice);
				
				//var prodNo = $("#prodNo"+i).val();//for 문 때문에 i 변한듯 위에서 선언해야됨
				alert(prodNo);
				$.ajax({
					url : "/libero/product/json/addCart",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": prodNo, "userId": "${sessionScope.user.userId}", "buyAmount": buyAmount, "from": "cart"},
					success : function(data){
								var message = data.result
								//alert(message);
					}
				});//end ajax
			})
		})
		
		$(function(){
			
			$("#button").on("click", function(){
				$("form").attr("method", "POST").attr("action", "/libero/buy/beforePay").submit();
			})
		});
		
		
		$(function(){
			$(".removeButton").on("click", function(){
				
				var prodNo = $(this).val();
				
				
				$.ajax({
					url : "/libero/product/json/removeCart",
					type: "POST",
					dataType: "json",
					header : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
					},
					data: {"prodNo": prodNo, "userId": "${sessionScope.user.userId}" },
					success : function(data){
						var message = data.result
						alert(message);
						window.location.reload();
					}//end success
				});//end ajax
			})
		});

</script>


</html>	