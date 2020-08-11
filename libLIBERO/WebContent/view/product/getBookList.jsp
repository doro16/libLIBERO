<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>
	<link rel="stylesheet" href="../resources/css/common.css">

<style>

.collapse-content .fa.fa-heart:hover {
  color: #f44336 !important;
}
.collapse-content .fa.fa-share-alt:hover {
  color: #0d47a1 !important;
}


    #getBook{
      width: 150px;
      height: 150px;
      margin: 50px;

      /* list 앞에 점마크 지우기*/
      list-style: none;

      /* inline 배치로 바꾸기 */
      display: inline-block;
    }

    #getBook{

      /* 일렬로 나열 */
      white-space: nowrap;
    }

</style>


</head>
<body>
		<!-- ToolBar Start /////////////////////////////////////-->
		<jsp:include page="../toolbar.jsp" />
	   	<!-- ToolBar End /////////////////////////////////////-->

<br/><br/><br/><br/><br/><br/>
<h6 class="font-weight-bold text-center grey-text text-uppercase small mb-4">서점</h6>
    <h3 class="font-weight-bold text-center dark-grey-text pb-2">ALL</h3>
    <hr class="w-header my-4">

	
	<!-- 검색 -->
	<div class="container">
	<div class="row">
	<!-- 검색조건 -->
			<div class="btn-group dropup">
			  <button type="button" class="btn btn-brown lighten-1 h-75" id="searchConditionText">검색조건</button>
			  <button type="button" class="btn btn-brown lighten-1 dropdown-toggle px-2 h-75" data-toggle="dropdown" aria-haspopup="true"
			    aria-expanded="false">
			    <span class="sr-only">Toggle Dropdown</span>
			  </button>
			  <div class="dropdown-menu">
			    <a class="dropdown-item" href="#">제목</a>
			    <a class="dropdown-item" >작가명</a>
			    <a class="dropdown-item" href="#">해쉬태그</a>
			  </div>
			</div>

	
	<!-- Search form -->
			<form class="form-inline mr-auto">
			  <input type="hidden" id="searchCondition" name="searchCondition">
			  <input class="form-control mr-sm-2" type="text" name="searchKeyword" >
			  <button class="btn btn-brown btn-rounded btn-sm my-0" id="searchButton" >Search</button>
			</form>
	</div>
	</div>
	<!-- 검색 -->
	
	<!-- 페이지 정보 -->
	
	<input type="hidden" id="currentPage" value="${resultPage.currentPage}">
	
	
    <!--Tab panels-->
    <div class="tab-content mb-5"> 

      <!--Panel 1-->
      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

        <!-- Grid row -->
        <div class="row" id="bookRow">

          <!-- Grid column -->
          
			
			 	<c:set var="i" value="0" />
		  		<c:forEach var="book" items="${book}">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-2" style="margin:50px 0px 0px 30px;">
				
				<div style="padding:50px 10px 10px 20px;">
           <!-- Card -->
            <a class="card hoverable mb-4 z-depth-0 h-10" id="productcard" data-toggle="modal" data-target="#basicExampleModal">

            <!-- Card image -->
            <img class="card-img-top z-depth-1" id="cardImage" src="../resources/images/publish/fileUpload/thumbnailFile/${book.prodThumbnail}" alt="Card image cap" width="180px" height="250px">
            
              <!-- Card content -->
              
             	<h6><a href="/libero/product/getProduct/${book.prodNo}">${book.prodName}</a></h6>
                <h6>${book.author}</h6>
             	<h6>${book.retailPrice}원</h6>
             
             
           		 <!--	<div class="card-text text-uppercase mb-1" style="padding:0px; margin:0px;"><a href="/libero/product/getProduct/${book.prodNo}">${book.prodName}</a></div>
                <div class="card-text text-uppercase mb-2">${book.author}</div>&nbsp;&nbsp;
                <div class="card-text text-uppercase mb-3">${book.retailPrice}원</div>  -->

            

            </a></div></div>
         
            <!-- Card -->
            </c:forEach>
            </div></div></div>
            
            <div class="text-center">
  				<button type="button" class="btn btn-brown btn-rounded" id="button" value="${i}">5개 더보기</button>
			</div>
            	<input type="hidden" id="k" value="${book[0].prodType}">
            	<input type="hidden" id="maxPage" value="${maxPage}">

</body>


<script>


			$("#button").on("click", function() {
				
				var curPage = $("#currentPage").val();
				var prodType = $("#k").val();
				var maxPage = $("#maxPage").val();
				
				curPage = parseInt(curPage);
				
				alert("최대 출력페이지 : "+maxPage);
				//alert(curPage);
				
				
				
					
					$.ajax({
						url : "/libero/product/json/getBookList/",
						type: "POST",
						dataType: "json",
						header : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
						},
						data: {"currentPage": parseInt(curPage), "prodType": prodType },
						success : function(data){
							
							//alert("success");
							var currentPage = data.currentPage;
							//alert(currentPage);
							
						if(data.product == ""){
								alert("더이상 상품이 없습니다");
							}
						if(data.product != ""){
							
							var displayValue = "<div class='row'>";
							
							$.each(data.product, function(index,product){
								
						
								
							displayValue +=	
							   "<div class='col-sm-2' style='margin:50px 0px 0px 30px;'>"
							  +"<div style='padding:50px 10px 10px 20px;'>"
							  +"<a class='card hoverable mb-4 z-depth-0 h-10' id='productcard' data-toggle='modal' data-target='#basicExampleModal'>"
				              +"<img class='card-img-top z-depth-1' id='cardImage' src='../resources/images/publish/fileUpload/thumbnailFile"+product.prodThumbnail+"' alt='Card image cap' width='180px' height='250px'>"
				              +"<h6><a href=/libero/product/getProduct/"+product.prodNo+">"+product.prodName+"<a></h6>"
				              +"<h6>"+product.author+"</h6>"
				              +"<h6>"+product.retailPrice+"</h6>"
				              +"</a>"
				              +"</div>"
				              +"</div>"
							});//end each
							
							 displayValue += "</div>"
								 $("#panel31").append(displayValue);
							  	 $("#currentPage").val(currentPage);
						  }//end if	
						}//end success	
					});//end ajax
					

				});

			//검색조건 선택에 따른 화면표시
			$(".dropdown-item").on("click", function() {
				var searchCondition = $(this).text();
				$("#searchConditionText").text(searchCondition);
				$("#searchCondition").val(searchCondition);
				
			});
			
			
			//검색
			$("#searchButton").on("click", function() {
				var searchCondition = $("#searchConditionText").text();
					$("#searchConditionText").val(searchCondition);
				var searchCondition = $("#searchConditionText").val();
					alert(searchCondition);
					if(searchCondition == "작가명"){
						var searchCondition = "author";
						
					}else if(searchCondition == "해쉬태그"){
						var searchCondition = "hashTag";
					}else{
						var searchCondition = "prodName";
					}
					
					$("#searchCondition").val(searchCondition);
					var searchKeyword = $("input[name='searchKeyword']").val();
					
					alert(searchKeyword);
					//searchKeyword = encodeURIComponent(searchKeyword);

				
				$("form").attr("method", "GET").attr("action", "/libero/product/getBookListBySearch").submit();
				
				//location="/libero/product/getBookListBySearch?searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
				
			});




</script>

</html>