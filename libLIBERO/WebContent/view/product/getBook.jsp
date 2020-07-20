<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<script type="text/javascript">
	
// 	$(function() {
// 			$( "button:contains('좋아요')").on("click" , function() {
				
// 				var prodNo = "${product.prodNo}"
// 				var userId = "${product.creator}"
				
// 				$.ajax({
// 					url : "/product/json/addWish",
// 					type: "POST",
// 					cache: false,
// 					dataType: "json",
// 					data: 'prodNo='+prodNo+'&userId='+userId,
// 					success: function(data){
// 						var wish_img = '';
						
// 						if(data.wish_check == 0){
// 							wish_img = "./~~~";
// 						}else{
// 							wish_img = "./images/like.png";
// 						}
// 						$('#')
// 					}
// 				})
// 			})
// 	})
	
	</script>
<title>Insert title here</title>
</head>


<body>

					책번호 ${product.prodNo} <br/>
					상품 타입 ${product.prodType} <br/>
					상품 상세 ${product.prodDetail} <br/>
					상품명 ${product.prodName} <br/>
					소비자가 ${product.retailPrice} <br/>
					저자 ${product.author} <br/>
					할인여부 ${product.blindCode} <br/>
					컬러 ${product.colorType} <br/>
					표지 ${product.coverType} <br/>
					내지 ${product.innerType} <br/>
					작성자 ${product.creator}
					<div>
						<button type="button" class="btn btn-primary">좋아요</button>
					</div>

</body>
</html>