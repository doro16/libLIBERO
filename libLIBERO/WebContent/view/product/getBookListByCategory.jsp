<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/common/cdn.jsp"></jsp:include>

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

		
    

    <!--Tab panels-->
    <div class="tab-content mb-5">

      <!--Panel 1-->
      <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

        <!-- Grid row -->
        <div class="row" id="bookRow">

          <!-- Grid column -->
          
			
			 	<c:set var="i" value="0" />
		  		<c:forEach var="book" items="${book}" end="3">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-3">
            <!-- Card -->
            <a class="card hoverable mb-4 z-depth-0" id="productcard" data-toggle="modal" data-target="#basicExampleModal">

              <!-- Card image -->
              <img class="card-img-top z-depth-1" src="../../resources/images/publish/fileUpload/thumbnailFile/${book.prodThumbnail}" alt="Card image cap" width="250px" height="400px">
     

              <!-- Card content -->
              <div class="card-body" id="card-body">

                <h5 class="my-3">${book.prodName}</h5>
                <p class="card-text text-uppercase mb-3">${book.author}</p>

              </div>

            </a></div>
         
            <!-- Card -->
            </c:forEach>
            </div></div></div>
            
            <button type="button" class="btn btn-brown" id="button" value="${i}">more</button >
            
            
            		<c:set var="k" value="0" />
		  		<c:forEach var="book" items="${book}">
					<c:set var="k" value="${k+1}"/>
						<input type="hidden" id="prodNo${k}"	value="${book.prodNo}">
						<input type="hidden" id="thumbnail${k}" value="${book.prodThumbnail}">
						<input type="hidden" id="author${k}" 	value="${book.author}">
						<input type="hidden" id="prodName${k}" 	value="${book.prodName}">
				</c:forEach>

</body>
</html>

<script>


			$("#button").on("click", function() {
				var endUnit = $("#button").val();
				alert(endUnit);	
				var displayValue = "<div class='row'>";
				endUnit = parseInt(endUnit)+1;
				

				
				for(var k = endUnit ; k<endUnit+4 ; k++ ){
						var prodNo = $("#prodNo"+k).val();
				
						console.log(prodNo);
						
						if(prodNo == null){
							alert("목록이 더이상 없습니다");
							break;
						}else{
							

							var prodThumbnail = $("#thumbnail"+k).val();
							var prodName = $("#prodName"+k).val();
							var author = $("#author"+k).val();
							console.log(prodThumbnail);
							console.log(prodName);
							console.log(author);
								
							displayValue +=	
								"<div class='col-sm-3'>"
							  +"<a class='card hoverable mb-4 z-depth-0' id='productcard' data-toggle='modal' data-target='#basicExampleModal'>"
				              +"<img class='card-img-top z-depth-1' src='../../resources/images/publish/fileUpload/thumbnailFile/"+prodThumbnail+"' alt='Card image cap' width='250px' height='400px'>"
				              +"<div class='card-body' id='card-body'>"
				              +"<h5 class='my-3'>"+prodName+"</h5>"
				              +"<p class='card-text text-uppercase mb-3'>"+author+"</p>"
				              +"</div>"
				              +"</a>"
				              +"</div>"
							
							
						}
					

		              
				} 
				    displayValue += "</div>"
							$("#panel31").append(displayValue);
				    
				    $("#button").val(endUnit+3);

				
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
					var searchKeyword = $("input[name='searchKeyword'").val();
					
					alert(searchKeyword);
					//searchKeyword = encodeURIComponent(searchKeyword);
				
				$("form").attr("method", "GET").attr("action", "/libero/product/getBookListBySearch").submit();
				
				//location="/libero/product/getBookListBySearch?searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
				
			});


</script>