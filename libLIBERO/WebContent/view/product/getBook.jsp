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





</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    alert(${product.prodNo});
	    alert("${product.creator}");
	});
	
	
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
					data: {"prodNo": ${product.prodNo}, "userId": "${product.creator}" },
					success : function(data){
						
						var wish_img = data.wishImage
			
						$('#wish_img').attr('src', wish_img);
					}
				});
			});
	});
	
	</script>
</html>