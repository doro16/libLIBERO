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
              <strong>Type</strong>
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

        
           <c:set var="totalPrice" value="0"/>
		  <c:set var="i" value="0" />
		  <c:forEach var="cartList" items="${cartList}">
			<c:set var="i" value="${ i+1 }" />
			<c:set var="totalPrice" value="${totalPrice + cartList.buyAmount * cartList.retailPrice }"/>
          	<form id="form${i}" value="${i}">
          
          
          
          <tr>
            <th scope="row">
              <img src="../resources/images/publish/fileUpload/thumbnailFile/${cartList.prodThumbnail }" alt="" class="img-fluid z-depth-0" style="height:200px; width:150px;">
            </th>
            <td class="align-middle">
              <h5 class="mt-3">
                <strong><a href="/libero/product/getProduct/${cartList.prodNo}">${cartList.prodName}</a></strong>
              </h5>
            </td>
              <p class="text-muted"></p>
            </td>
            <td class="align-middle">${cartList.prodType}</td>
            <td></td>
            <td class="align-middle">${cartList.retailPrice}</td><input type="hidden" class="retailPrice" name="retailPrice${i}" id="retailPrice${i}" value="${cartList.retailPrice }">
            <td class="align-middle">
           	  <c:if test="${cartList.prodType == 'paper' or cartList.prodType == 'ebook' }">
              <input type="number"  aria-label="Search" class="form-control" name="buyAmount${i}" id="${i}" style="width: 100px" value="${cartList.buyAmount}">
              </c:if>
              <c:if test="${cartList.prodType != 'paper' and cartList.prodType != 'ebook' }">
              <input type="text"  aria-label="Search" class="form-control" name="buyAmount${i}" id="${i}" style="width: 100px" value="1">
              </c:if>
            </td>
            <td class="font-weight-bold align-middle">
              <strong id="each${i}">${cartList.buyAmount * cartList.retailPrice}</strong>
            </td>
            <td class="align-middle" style="padding-bottom : 25px;">
              <!-- <button type="button" class="removeButton btn btn-brown" data-toggle="tooltip" data-placement="top" title="Remove item" name="buyAmount${i}" id="button${i}" value="${cartList.prodNo}">X </button> --> 
               <button type="button" class="removeButton btn btn-sm btn-brown" data-toggle="tooltip" data-placement="top" title="Remove item" name="buyAmount${i}" id="button${i}" value="${cartList.prodNo}">X</button>
              <input type="hidden" class="eachPrice" id="eachPrice${i}" name="eachPrice${i}"  value="${cartList.buyAmount * cartList.retailPrice}">
              <input type="hidden" class="prodNo" id="prodNo${i}" name="prodNo${i}" value="${cartList.prodNo}">
             
            </td>
          </tr>
				</form>
          </c:forEach>
          
          <!-- /.First row -->
          <!-- Fourth row -->
          <tr>
            <td colspan="3" align="center"><h4 class="mt-2">주문금액</h4></td>
            <td colspan="3"><h4 class="mt-2">배송비</h4></td>
            <td colspan="3"><h4 class="mt-2">총액</h4></td>
          </tr>
            <tr>
            <td colspan="3" align="center"><h5 class="mt-2">주문금액</h5></td>
            <td colspan="3"><h5 class="mt-2">배송비</h5></td>
            <td colspan="3"><h5 class="mt-2">합계 : <fmt:formatNumber value="${totalPrice}" pattern="#,###.###" type="currency"/>원</h2></h5></td>
            <div align="right"><button type="button" id="button" class="btn btn-brown lighten-4" >구매</button></div>
          </tr>
         
        
          
             

        </tbody>
        <!-- /.Table body -->

      </table>
      
      			<form>
					<input type="hidden" name="buyNoList" value="${buyNoList}">
					<input type="hidden" id="actualPrice" name="actualPrice" value="${totalPrice}">
				</form>
      
      
    
      
      
      
      <!--  
      <div align="right"><h2 id="total">합계 : <fmt:formatNumber value="${totalPrice}" pattern="#,###.###" type="currency"/>원</h2></div>
        		<form>
					<input type="hidden" name="buyNoList" value="${buyNoList}">
					<input type="hidden" id="actualPrice" name="actualPrice" value="${totalPrice}">
				</form>
		<div align="right"><button type="button" id="button" class="btn btn-brown lighten-4" >구매</button></div>-->

    </div>
    <!-- /.Shopping Cart table -->

  </section>
  <!--Section: Content-->


</div>
		


</body>



<script type = "text/javascript">
	
	
		function numberConvert(x) {
    		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}


	
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
			
			$("input[type='number']").click(function(){
					
				var buyAmount = $(this).val();
				//alert(buyAmount);
				//i는 포문의 몇번째인지 뽑기 위해 일부로 buyAmount의 id를 i로 설정해놓고 뽑아온것
				var i = $(this).attr("id"); //상품이 리스트중 몇번째 상품인지 추출
				//alert(i);
				var prodNo = $("#prodNo"+i).val();
				var retailPrice = $("#retailPrice"+i).val();
				//alert(retailPrice);
				var eachPrice = parseInt(retailPrice)*parseInt(buyAmount);
				//alert(eachPrice)
				$("#each"+i).html(eachPrice);//업데이트된 eachPrice 화면출력
				$("#eachPrice"+i).val(eachPrice);//업데이트된 eachPrice input의 value 업데이트
				var each = $("#eachPrice"+i).val()
				//alert(each);
				var k = $(".form-control:Last").attr("id"); //상품 리스트 갯수 추출
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
							//alert("eachPrice는");
							//alert(eachPrice);
							totalPrice += eachPrice;
				}
				//$("#totalPrice").html("총액 : "+totalPrice);
				//$("#totalPrice").val(totalPrice);
				$("#actualPrice").val(totalPrice);
				var actual = $("#actualPrice").val();
				var actualPrice = numberConvert(actual);
				


				//alert(actualPrice);
				$("#total").html("합계 : "+actualPrice+"원");
				
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