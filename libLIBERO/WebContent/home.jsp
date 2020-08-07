<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO</title>
		
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		
		<!--  ///////////////////////// CSS ////////////////////////// -->
		<link rel="stylesheet" href="resources/css/common.css">
		<style type="text/css">
			html,body { 
				margin:0; 
				padding:0; 
				width:100%; height:100%;
			}
        	.box { 
        		width:100%; height:100%; 
        		position:relative; 
        		background-size: cover;
        	}
        	.title {
        		position: absolute;
        		top:30%;
        		left:10%;
        		color: #FFFFFF;
        		font-family: 'Nanum Gothic', sans-serif;
        		font-size: 30px;
        	}
        	.title2 {
        		margin-left:auto;
        		margin-right:auto;
        		color: #FFFFFF;
        		font-family: 'Nanum Gothic', sans-serif;
        		font-size: 100px;
        		vertical-align: middle;
        	}
        	table {
        		position:absolute;
        		top:25%;
        		margin-left:auto;
        		margin-right:auto;
        		color: #FFFFFF;
        		display: table;
        	}
        	.contentText{
        		font-size: 15px;
        		padding: 60px;
        		font-family: 'Noto Sans KR', sans-serif;
        	}
        	.button{
        		border: 1px black solid; 
        		padding: 5px; 
        		cursor: pointer;
        	}
        	.button:hover{
        		border: 1px white solid; 
        		padding: 5px; 
        		cursor: pointer;
        		color: white;
        	}
		</style>
	</head>
	<body>
		<!-- Toolbar Start -->
		<jsp:include page="/view/toolbar.jsp" />
		<!-- Toolbar End -->
		
		<div class="box" style="background-image: url(resources/images/common/index1.jpg);">
			<div class="title" align="left">자가 출판 플랫폼<br/>리브리베로</div>
		</div>
	    <div class="box" style="background-image: url(resources/images/common/index3.jpg);display: flex; justify-content: center; align-items: center;">
	    	<table>
	    		<tbody>
	    			<tr>
	    				<td colspan="4"><div class="title2" align="center" ><b>Writer</b></div></td>
	    			</tr>
	    			<tr style="height: 100px; text-align: center;">
	    				<c:forEach var="list" items="${list}">
		    				<td class="contentText"><h5>${list.prodCount}<br/><br/>등록된 도서</h5><br/><br/>리브리베로에 등록된<br/>도서의 개수입니다.</td>
		    				<td class="contentText"><h5>${list.creatorCount}<br/><br/>활동중인 작가</h5><br/>리브리베로에는<br/>이미 많은 작가분들이<br/>활동하고 있습니다.</td>
		    				<td class="contentText"><h5>${list.salesCount}<br/><br/>도서 판매 부수</h5><br/><br/>이만큼의 <br/>도서가 판매되었습니다.</td>
		    				<td class="contentText"><h5>${list.nowCount}<br/><br/>오늘 출간된 책</h5><br/><br/>오늘 <br/>등록된 도서를 확인하세요.</td>
	    				</c:forEach>
	    			</tr>
	    		</tbody>
	    	</table>
	    </div>
	    <div class="box" style="background-image: url(resources/images/common/index2.png);display: flex; justify-content: center; align-items: center;">
	    	<div align="center">
		    	<c:forEach var="list" items="${list}">
		    		<h5><b>출판이 가장 쉬운 리브리베로</b></h5>
		    		리브리베로는 출판과정을 4단계로 나누어<br/>저자가 직접 출판하는 과정을 쉽게 만들었습니다.<br/>
		    		간단한 출판방식으로 ${list.prodCount}종의 도서가 출판중인<br/>리브리베로의 가장 쉬운 출판서비스를 만나보세요!<br/><br/>
		    	</c:forEach>
	    		<div class="container">
	    			<button id="publishBtn" type="button" class="btn btn-outline-black waves-effect z-depth-0" onclick="publish()">책만들기</button>
	    		</div>
	    	</div>
	    </div>
	    <div class="box" style="background-image: url(resources/images/common/index4.jpg);">
	    	<div class="container text-center" style="height: 100%;display: flex; justify-content: center; align-items: center;">
		    	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 70%">
					<div class="carousel-inner">
				    	<div class="carousel-item active" data-interval="10000">
				      		<!-- Card deck -->
							<div class="card-deck">
							<c:forEach var="prod" items="${book}" end="2">
								<!-- Card -->
								<div class="card mb-4">
							
								    <!--Card image-->
								    <div class="view overlay">
								    	<img class="card-img-top" src="/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap">
							      		<a href="#!">
							      			<div class="mask rgba-white-slight"></div>
							      		</a>
								    </div>
							
								    <!--Card content-->
								    <div class="card-body">
								
								    	<!--Title-->
								      	<h4 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h4>
								
								    </div>
							
							  	</div>
							  	<!-- Card -->
							</c:forEach>
							</div>
							<!-- Card deck -->
				    </div>
				    <div class="carousel-item" data-interval="2000">
			      		<!-- Card deck -->
						<div class="card-deck">
						<c:forEach var="prod" items="${book}" begin="3" end="5">
							<!-- Card -->
							<div class="card mb-4">
						
							    <!--Card image-->
							    <div class="view overlay">
							    	<img class="card-img-top" src="/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap">
						      		<a href="#!">
						      			<div class="mask rgba-white-slight"></div>
						      		</a>
							    </div>
						
							    <!--Card content-->
							    <div class="card-body">
							
							    	<!--Title-->
							      	<h4 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h4>
							
							    </div>
						
						  	</div>
						  	<!-- Card -->
						</c:forEach>
						</div>
						<!-- Card deck -->
				    </div>
				    <div class="carousel-item">
				    	<!-- Card deck -->
						<div class="card-deck">
						<c:forEach var="prod" items="${book}" begin="6" end="8">
							<!-- Card -->
							<div class="card mb-4">
						
							    <!--Card image-->
							    <div class="view overlay">
							    	<img class="card-img-top" src="/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap">
						      		<a href="#!">
						      			<div class="mask rgba-white-slight"></div>
						      		</a>
							    </div>
						
							    <!--Card content-->
							    <div class="card-body">
							
							    	<!--Title-->
							      	<h4 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h4>
							
							    </div>
						
						  	</div>
						  	<!-- Card -->
						</c:forEach>
						</div>
						<!-- Card deck -->
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
			</div>
	    </div>
	</body>
	<script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                	$("nav").attr("class","mb-1 navbar navbar-expand-lg navbar-dark rgba-blue-grey-light fixed-top z-depth-1");
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.8초(800)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 800, complete: function () {
                        }
                    });
                });
            });
        }
        
        function publish() {
        	
        	self.location = "/libero/publish/addPrintOption?prodType=paper"
        	
        }
    </script>
</html>