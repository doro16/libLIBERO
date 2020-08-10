<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<tbody>
		<h2>${userId}의 위시리스트</h2>
		
		
		  <c:set var="i" value="0" />
		  <c:forEach var="wishList" items="${wishList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
				<td align="center">${ i }</td>
				<td align="left"  title="Click : 주문정보 확인">		
					${wishList.prodType} </br>
					${wishList.prodName} <br/>
					${wishList.retailPrice} <br/>
				</td>
          </c:forEach>
        
        </tbody>
<div class="container my-5 py-3 z-depth-1 rounded">


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

		<c:set var="i" value="0" />
		<c:forEach var="wishList" items="${wishList}">
		<c:set var="i" value="${ i+1 }" />
          <!-- First row -->
          <tr>
            <th scope="row">
              <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/13.jpg" alt="" class="img-fluid z-depth-0">
            </th>
            <td>
              <h5 class="mt-3">
                <strong>iPhone</strong>
              </h5>
              <p class="text-muted">Apple</p>
            </td>
            <td>White</td>
            <td></td>
            <td>$800</td>
            <td>
              <input type="number" value="2" aria-label="Search" class="form-control" style="width: 100px">
            </td>
            <td class="font-weight-bold">
              <strong>$800</strong>
            </td>
            <td>
              <button type="button" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top"
                title="Remove item">X
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
</html>