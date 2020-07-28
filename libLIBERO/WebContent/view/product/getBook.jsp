<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
	
	
	
	
<title>Insert title here</title>
</head>


<body>

		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>
	   	<br/>

					å��ȣ ${product.prodNo} <br/>
					��ǰ Ÿ�� ${product.prodType} <br/>
					��ǰ �� ${product.prodDetail} <br/>
					��ǰ�� ${product.prodName} <br/> 
					�Һ��ڰ� ${product.retailPrice} <br/>
					���� ${product.author} <br/>
					���ο��� ${product.blindCode} <br/>
					�÷� ${product.colorType} <br/>
					ǥ�� ${product.coverType} <br/>
					���� ${product.innerType} <br/>
					�ۼ��� ${product.creator}	<br/>
					
	
		<img src="${wish}" id='wish_img' width="70px" height="70px"/>
		<input type="number" name="buyCount" id="buyCount" onblur="buyCount()">��</td>
		<div class="form-group" align="center">
			<button type="button" id="button" class="btn btn-info btn-block" 
				onclick="addCart()">
				��ٱ���
			</button>
		</div>
		
		 	

</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    //alert(${product.prodNo});
	    alert("${sessionScope.user.userId}");
	});
	
// 	$(function(){
// 		$("input").attr("onclick","buyCount()");
// 	})
	
	function buyCount(){
		var buyCount = $("#buyCount").val();
	}
	
	$(document).ready(function(){
			$('#wish_img').on("click", function(){
			
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
		var buyCount = $("#buyCount").val();
		alert(buyCount);
		
		if (userId=="") {
			alert("�α��� ���ּ���.");
			return;
		}
		if (phoneCode!=1) {
			alert("�޴��� ���������� �Ϸ��� ȸ���� �����մϴ�.");
			return;
		}
		if (buyCount==null) {
			alert("������ �������ּ���.");
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
			data: {"prodNo": ${product.prodNo}, "userId": "${sessionScope.user.userId}", "buyCount": buyCount},
			success : function(data){
						var message = data.result
						alert(message);
			}
		});//end ajax
		
	}//end addCart
		
		//$("form").attr("method" , "POST").attr("action" , "/libero/product/json/addCart").submit();
	</script>
</html>