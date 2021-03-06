<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>libLIBERO</title>
		
		<jsp:include page="/common/cdn.jsp"></jsp:include>
		<script type="text/javascript">
		(function ($){
			  $.fn.counter = function() {
			    const $this = $(this),
			    numberFrom = parseInt($this.attr('data-from')),
			    numberTo = parseInt($this.attr('data-to')),
			    delta = numberTo - numberFrom,
			    deltaPositive = delta > 0 ? 1 : 0,
			    time = parseInt($this.attr('data-time')),
			    changeTime = 10;
			    
			    let currentNumber = numberFrom,
			    value = delta*changeTime/time;
			    var interval1;
			    const changeNumber = () => {
			      currentNumber += value;
			      //checks if currentNumber reached numberTo
			      (deltaPositive && currentNumber >= numberTo) || (!deltaPositive &&currentNumber<= numberTo) ? currentNumber=numberTo : currentNumber;
			      this.text(parseInt(currentNumber));
			      currentNumber == numberTo ? clearInterval(interval1) : currentNumber;  
			    }

			    interval1 = setInterval(changeNumber,changeTime);
			  }
			}(jQuery));

			$(document).ready(function(){

			  $('.count-up').counter();
			  $('.count1').counter();
			  $('.count2').counter();
			  $('.count3').counter();
			  
			  new WOW().init();
			  
			  setTimeout(function () {
			    $('.count5').counter();
			  }, 3000);
			});
		
		</script>
		
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
        		top:40%;
        		left:34%;
        		color: #FFFFFF;
        		font-family: 'Nanum Gothic', sans-serif;

        		z-index:10;
        		text-align: center;
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
        	::-webkit-scrollbar {
				display: none;
			}
			#tdtd{
				font-size : xx-large;
			}
			#tdlibero{
				font-size : large;
			}
			
		</style>
	</head>
	<body>

		<!-- Toolbar Start -->
	
		<!-- Toolbar End -->
		
<!-- 		<div class="box"> -->
		
<!-- <!-- 			 <div style="position: absolute; top: 0; left: 0; height: 100%;  width: 100%; background-color: black; opacity: 0.3; z-index: 1;" > </div> -->
<!-- 		 	 <img  class="image-fluid" src="resources/images/common/intro_header.jpg" style="position: absolute; top:0; left:0; height: 100%; width: 100%;"> -->
			
<!-- <!-- 			 <div class="title"><p style="font-size:70px;">자가출판 플랫폼</p><p style="font-size:50px;">libLIBERO</p> </div> -->
		
<!-- 		</div> -->
	    <div class="box" style="background-image: url(resources/images/common/pen_paper.jpg);display: flex; justify-content: center; align-items: center;">
	    	<table>
	    		<tbody>
	    			<tr>
	    				<td colspan="4"><div class="title2" align="center" style="margin-botton:140px;" ><i>libero </i></div></td>
	    				
	    			</tr>
	    			<tr>
	    				<td id="tdtd">ː자유<br><br></td>
	    			</tr>
	    			<tr>
	    				<td>자유로운 출판을 위한 사이트</td>
	    			</tr>
	    			<tr>
	    				<td id="tdlibero"><br>libLIBERO</td>
	    			</tr>
	    			<tr><td></td></tr>
	    			<tr><td></td></tr>
	    			<tr>
	    				<td>방문을 환영합니다!</td>
	    			</tr>
	    			
	    			<tr style="height: 100px; text-align: center;">
	    				<!--  -->
<!-- 	    				<div class="container my-5"> -->


						  <!--Section: Content-->
						 
						    
						
<!-- 						    <div class="row d-flext-cen" style="color:white; margin-top:310px;"> -->
						  
<%-- 							<c:forEach var="list" items="${list}"> --%>
<!-- 						      <div class="col-md-6 col-lg-3 mb-4 text-center"> -->
<!-- 						        <h4 class="h1 font-weight-normal mb-3"> -->
<!-- 						          <i class="fas fa-file-alt"></i> -->
<%-- 						          <span class="d-inline-block count-up" data-from="0" data-to="${list.prodCount}" data-time="2000">${list.prodCount}</span> --%>
<!-- 						        </h4> -->
<!-- 						        <p class="font-weight-normal text-muted"><br/><br/><h4>등록된 도서</h4><br/><br/>리브리베로에 등록된<br/>도서의 개수입니다.</p> -->
<!-- 						      </div> -->
						
<!-- 						      <div class="col-md-6 col-lg-3 mb-4 text-center"> -->
<!-- 						        <h4 class="h1 font-weight-normal mb-3"> -->
<!-- 						          <i class="fas fa-book-reader"></i> -->
<%-- 						          <span class="d-inline-block count1" data-from="0" data-to="${list.creatorCount}" data-time="2000">${list.creatorCount}</span> --%>
<!-- 						        </h4> -->
<!-- 						        <p class="font-weight-normal text-muted"><br/><br/><h4>활동중인 작가</h4><br/><br/>리브리베로에는 이미<br/>많은 작가분들이 활동하고 있습니다.</p> -->
<!-- 						      </div> -->
						
<!-- 						      <div class="col-md-6 col-lg-3 mb-4 text-center"> -->
<!-- 						        <h4 class="h1 font-weight-normal mb-3"> -->
<!-- 						          <i class="fas fa-pencil-ruler"></i> -->
<%-- 						          <span class="d-inline-block count2" data-from="0" data-to="${list.salesCount}" data-time="2000">${list.salesCount}</span> --%>
<!-- 						        </h4> -->
<!-- 						        <p class="font-weight-normal text-muted"><br/><br/><h4>도서 판매 부수</h4><br/><br/>이만큼의 <br/>도서가 판매되었습니다.</p> -->
<!-- 						      </div> -->
						      
<!-- 						      <div class="col-md-6 col-lg-3 mb-4 text-center"> -->
<!-- 						        <h4 class="h1 font-weight-normal mb-3"> -->
<!-- 						          <i class="fas fa-book"></i> -->
<%-- 						          <span class="d-inline-block count3" data-from="0" data-to="${list.nowCount}" data-time="2000">${list.nowCount}</span> --%>
<!-- 						        </h4> -->
<!-- 						        <p class="font-weight-normal text-muted"><br/><br/><h4>오늘 출간된 책</h4><br/><br/>오늘 <br/>등록된 도서를 확인하세요.</p> -->
<!-- 						      </div> -->
<%-- 							</c:forEach> --%>
<!-- 						    </div> -->
						
<!-- 						</div> -->
	    			
	    			

	    				
	    			</tr>
	    		</tbody>
	    	</table>
	    </div>
	    <div id="secondBox" class="box" style="background-image: url(resources/images/common/pencil.jpg);display:flex; justify-content: center; align-items: center;">
	    	<div align="right"style="align-items: left">
	    	  
		    	<p align="center" style="font-size: x-large;">책 만들기</p>
		    		
		    		<p align="center"><b>1단계</b></p>
		    		<p align="center">작성한 원고를 pdf 파일이나 docx 파일로 준비해주세요.</p>
		    		<p align="center"><b>2단계</b></p>
		    		<p align="center">직접 만드신 표지디자인이 있다면 jpg 혹은 png 파일로 준비해 주세요.</p>
		    		<p align="center"><b>3단계</b></p>
		    		<p align="center">사이트의 '책만들기' 부분에서 책의 정보와 가격, 준비한 파일들을 등록해 주세요.</p>
		    		<p align="center"><b>4단계</b></p>
		    		<p align="center">소장용, 판매용을 고르시고 책을 등록하시면, 책의 초안이 배달됩니다!</p>
		    		
	    		
	    		
	    		
	    	</div>
	    </div>
	    <div class="box" style="background-image: url(resources/images/common/index4.jpg);">
	    	<div class="container text-center" style="height: 100%;display: flex; justify-content: center; align-items: center;">
		    	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 70%;">
					<div class="carousel-inner">
				    	<div class="carousel-item active" data-interval="10000" style="size: 100%">
				      		<!-- Card deck -->
							<div class="card-deck" >
							
							
							<div class="container" align ="right">
			    		리브리베로는 출판과정을 4단계로 나누어<br/>저자가 직접 출판하는 과정을 쉽게 만들었습니다.<br/>
			    		간단한 출판방식으로 <br/>리브리베로의 가장 쉬운 출판서비스를 만나보세요!<br/><br/>
			    		<a href="/libero"><button class="btn btn-outline-black waves-effect z-depth-0">메인으로</button></a>
		    	</div>
		    	
<%-- 							<c:forEach var="prod" items="${book}" end="2"> --%>
<!-- 								Card -->
<!-- 								<div class="card mb-4"> -->
							
<!-- 								    Card image -->
<!-- 								    <div class="view overlay"> -->
<%-- 								    	<img class="card-img-top" src="/libero/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap" height="250px"> --%>
<!-- 							      		<a href="#!"> -->
<!-- 							      			<div class="mask rgba-white-slight"></div> -->
<!-- 							      		</a> -->
<!-- 								    </div> -->
							
<!-- 								    Card content -->
<!-- 								    <div class="card-body"> -->
								
<!-- 								    	Title -->
<%-- 								      	<h6 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h6> --%>
								
<!-- 								    </div> -->
							
<!-- 							  	</div> -->
<!-- 							  	Card -->
<%-- 							</c:forEach> --%>
							</div>
							<!-- Card deck -->
				    </div>
<!-- 				    <div class="carousel-item" data-interval="2000"> -->
<!-- 			      		Card deck -->
<!-- 						<div class="card-deck"> -->
<%-- 						<c:forEach var="prod" items="${book}" begin="3" end="5"> --%>
<!-- 							Card -->
<!-- 							<div class="card mb-4"> -->
						
<!-- 							    Card image -->
<!-- 							    <div class="view overlay"> -->
<%-- 							    	<img class="card-img-top" src="/libero/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap" height="250px"> --%>
<!-- 						      		<a href="#!"> -->
<!-- 						      			<div class="mask rgba-white-slight"></div> -->
<!-- 						      		</a> -->
<!-- 							    </div> -->
						
<!-- 							    Card content -->
<!-- 							    <div class="card-body"> -->
							
<!-- 							    	Title -->
<%-- 							      	<h6 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h6> --%>
							
<!-- 							    </div> -->
						
<!-- 						  	</div> -->
<!-- 						  	Card -->
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 						Card deck -->
<!-- 				    </div> -->
<!-- 				    <div class="carousel-item"> -->
<!-- 				    	Card deck -->
<!-- 						<div class="card-deck"> -->
<%-- 						<c:forEach var="prod" items="${book}" begin="6" end="8"> --%>
<!-- 							Card -->
<!-- 							<div class="card mb-4"> -->
						
<!-- 							    Card image -->
<!-- 							    <div class="view overlay"> -->
<%-- 							    	<img class="card-img-top" src="/libero/resources/images/publish/fileUpload/thumbnailFile/${prod.prodThumbnail}" alt="Card image cap" height="250px"> --%>
<!-- 						      		<a href="#!"> -->
<!-- 						      			<div class="mask rgba-white-slight"></div> -->
<!-- 						      		</a> -->
<!-- 							    </div> -->
						
<!-- 							    Card content -->
<!-- 							    <div class="card-body"> -->
							
<!-- 							    	Title -->
<%-- 							      	<h6 class="card-title"><a href="/libero/product/getProduct/${prod.prodNo}">${prod.prodName}</a></h6> --%>
							
<!-- 							    </div> -->
						
<!-- 						  	</div> -->
<!-- 						  	Card -->
<%-- 						</c:forEach> --%>
<!-- 						</div> -->
<!-- 						Card deck -->
<!-- 				    </div> -->
<!-- 				  </div> -->
<!-- 				  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> -->
<!-- 				    <span class="carousel-control-prev-icon" aria-hidden="true"></span> -->
<!-- 				    <span class="sr-only">Previous</span> -->
<!-- 				  </a> -->
<!-- 				  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> -->
<!-- 				    <span class="carousel-control-next-icon" aria-hidden="true"></span> -->
<!-- 				    <span class="sr-only">Next</span> -->
<!-- 				  </a> -->
<!-- 				</div> -->
			</div>
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