<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
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
				

</body>
</html>