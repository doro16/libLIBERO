<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
	<title>libLIBERO</title>
<!--  ///////////////////////// CSS ////////////////////////// -->
<style type="text/css">
	nav {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	
	.smart-scroll{
	  position: fixed;
	  top: 0;
	  right: 0;
	  left: 0;
	  z-index: 1030;
	}
	.scrolled-down{
	   transform:translateY(-100%); transition: all 0.3s ease-in-out;
	}
	.scrolled-up{
	   transform:translateY(0); transition: all 0.3s ease-in-out;
	}

</style>
</head>
	<!--Navbar -->
	<nav id="mainToolbar" class="mb-1 navbar navbar-expand-lg navbar-dark brown lighten-1  smart-scroll z-depth-1">
		<a href="/libero/" class="navbar-brand">
	  		<img src="http://127.0.0.1:8080/libero/resources/images/common/logo_white.png" width="65" alt="" loading="lazy" id="logoImg">
	  	</a>
	  	<!-- 모바일 navbar -->
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333" aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
	  	<!-- 모바일 navbar 끝 -->
		<!-- left Button Start -->
	  	<div class="collapse navbar-collapse" id="navbarSupportedContent-333">
	    	<ul class="navbar-nav mr-auto">
	     		<li class="nav-item dropdown">
	        		<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">책만들기</a>
	      			<div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
	          			<a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=paper">종이책 만들기</a>
			          	<a class="dropdown-item" href="/libero/publish/addPrintOption?prodType=ebook">전자책 만들기</a>
			          	<a class="dropdown-item" href="/libero/publish/addProduct?prodType=cover">표지디자인 등록</a>
			          	<a class="dropdown-item" href="/libero/publish/addProduct?prodType=correct">교정교열 등록</a>
	        		</div>
	      		</li>
	      		
	      		<!-- 책만들기 End -->
	      		<li class="nav-item">
		        	<a class="nav-link" href="/libero/product/getProductList/design">서비스상점</a>
		        </li>
	      		<!-- 작가서비스 End -->
	      		<li class="nav-item">
		        	<a class="nav-link" href="/libero/product/getBookList">서점</a>
		        </li>
	      		<!-- 서점 End -->
	      		<li class="nav-item dropdown">
	        		<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	      			<div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
	          			<a class="dropdown-item" href="/libero/community/getPostList?menu=n">공지사항</a>
				        <a class="dropdown-item" href="/libero/community/getPostList?menu=f">자유게시판</a>
				        <div class="dropdown-divider"></div>
				        <c:if test="${sessionScope.user.role!='a'}">
				        <a class="dropdown-item" href="/libero/community/addPost?postType=q">1:1문의</a>
				        </c:if>
				        <c:if test="${sessionScope.user.role=='a'}">
				        <a class="dropdown-item" href="/libero/user/getUserActivityList?menu=q">1:1문의</a>
				        </c:if>
	        		</div>
	      		</li>
	    	</ul>
	    	<!-- left Button End -->
	    	<!-- right Button Start -->
	    	<ul class="navbar-nav ml-auto nav-flex-icons">
	    		<li class="nav-item" id="login">
			    	<!-- <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal">로그인</a> -->
			    	<a class="nav-link" href="/libero/user/login">로그인</a>
		        </li>
		        
		        <!-- 회원 메뉴 Start -->
		        <li class="nav-item userDropdown">
	      			<a class="nav-link waves-effect waves-light" href="/libero/product/getWishList">
	      				<i class="fas fa-heart"></i>
	      			</a>
	      		</li>
	      		<li class="nav-item userDropdown">
	        		<a class="nav-link waves-effect waves-light" href="/libero/product/getCartList">
	          			<i class="fas fa-shopping-cart"></i>
	        		</a>
	      		</li>
	      		<li class="nav-item dropdown userDropdown">
	        		<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        			<c:if test="${empty sessionScope.user.profile}">
	        				<i class="fas fa-user-circle"></i>
	        			</c:if>
	        			<c:if test="${sessionScope.user.profile!=null}">
	          				<img alt="" src="http://127.0.0.1:8080/libero/resources/images/user/fileUpload/${sessionScope.user.profile}" class="rounded-circle" width="25px" height="25px">
	        			</c:if>
	        		</a>
	        		<div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
	        		<c:if test="${sessionScope.user.role =='f' }"><a class="dropdown-item" href="/libero/buy/getFactoryBuyList">마이페이지</a></c:if>
	        		<c:if test="${sessionScope.user.role =='a' }"><a class="dropdown-item" href="/libero/user/getUserList">마이페이지</a></c:if>
			        <c:if test="${sessionScope.user.role =='u' }"><a class="dropdown-item" href="/libero/user/getUser">마이페이지</a></c:if>
				        <div class="dropdown-divider"></div>
				        <c:if test="${! empty kakao_logout}">
				       	 <a href="${kakao_logout}">로그아웃</a>
				        </c:if>
				        <c:if test="${empty kakao_logout}">
				       	 <a class="dropdown-item" href="/libero/user/logout">로그아웃</a>
				       	 </c:if>
	        		</div>
	      		</li>
	    	</ul>
	    	<!-- right Button End -->
	  	</div>
	  	
	</nav>
	<!--/.Navbar -->
	<!-- getBookList subnav here -->
	<div id="bookList" class="sticky-top" style="display: none;">
		<nav class="mb-1 navbar navbar-expand-lg navbar-dark brown darken-1 z-depth-0 smart-scroll" style="padding-top: 65px;min-height: 30px">
		
		    <div class="collapse navbar-collapse navbar1and2" id="navbarSupportedContent2">
		        <ul class="navbar-nav mx-auto">
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getBookListByCategory/poetry">시</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getBookListByCategory/novel">소설</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getBookListByCategory/essay">수필</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getBookListByCategory/non">비문학</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getBookListByCategory/edu">교육</a>
		            </li>
		        </ul>
		    </div>
		</nav>
	</div>
	<!-- getBookList subnav End -->
	<!-- getProductList subnav End -->
	<div id="productList" class="sticky-top" style="display: none;">
		<nav class="mb-1 navbar navbar-expand-lg navbar-dark brown darken-1 z-depth-0 smart-scroll" style="padding-top: 65px;min-height: 30px">
		
		    <div class="collapse navbar-collapse navbar1and2" id="navbarSupportedContent4">
		        <ul class="navbar-nav mx-auto">
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getProductList/design">표지디자인</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getProductList/target">맞춤형 표지디자인</a>
		            </li>
		            <li class="nav-item">
		                <a class="nav-link py-0" href="/libero/product/getProductList/correct">교정·교열</a>
		            </li>
		        </ul>
		    </div>
		</nav>
	</div>
	<!-- Modal -->
<!-- 	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered"> -->
<!-- 	    	<div class="modal-content"> -->
<!-- 	      		<div class="modal-header brown lighten-1"> -->
<!-- 	        		<h5 class="modal-title" id="exampleModalLabel"><b>libLIBERO 로그인</b></h5> -->
<!-- 	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 	          			<span aria-hidden="true">&times;</span> -->
<!-- 	        		</button> -->
<!-- 	      		</div> -->
<!-- 	      		<div class="modal-body"> -->
<!-- 	        		<form name="loginForm"> -->
<!-- 	          			<div class="md-form"> -->
<!-- 	            			<label for="recipient-name" class="col-form-label">아이디</label> -->
<!-- 	            			<input type="text" class="form-control" id="userId" name="userId"> -->
<!-- 	          			</div> -->
<!-- 	          			<div class="md-form"> -->
<!-- 	            			<label for="message-text" class="col-form-label">비밀번호</label> -->
<!-- 	            			<input type="password" class="form-control" id="password" name="password"> -->
<!-- 	          			</div> -->
<!-- 	        		</form> -->
<!-- 	      		</div> -->
<!-- 	      		<div class="modal-footer"> -->
<!-- 	      			<button type="button" class="btn btn-cyan brown lighten-1" id="loginButton">로그인</button> -->
<!-- 	        		<button type="button" class="btn btn-outline-brown lighten-1 waves-effect" data-dismiss="modal">취소</button> -->
<!-- 	      		</div> -->
<!-- 	      		<div class="modal-footer text-center"> -->
<!-- 	        		<a href="#"><button type="button" class="btn btn-info brown lighten-1 btn-block" id="addUser">회원가입</button></a><br/> -->
<%-- 	        		<a href="${kakao_login}"><img src="/libero/resources/images/common/kakao_login_medium_narrow.png"></a> --%>
<!-- 	      		</div> -->
<!-- 	    	</div> -->
<!-- 	  	</div> -->
<!-- 	</div> -->
	<!-- Modal End -->
	</body>
	<script>	
	//===================toolbar class change ================
		$(function() {
			session = "${sessionScope.user.userId}";
			var path = window.location.pathname;
			
			if (path=="/libero/home.jsp" ||path=="/libero/") {
				$("#mainToolbar").attr("class","mb-1 navbar navbar-expand-lg navbar-dark link-color fixed-top z-depth-0");
			}
			
			if (path=="/libero/product/getBookList" || path.includes("/libero/product/getBookListByCategory/")) {
				$("#mainToolbar").attr("class","mb-1 navbar navbar-expand-lg navbar-dark brown lighten-1 smart-scroll z-depth-0");
				$("#bookList").show();
			}
			
			if (path.includes("getProductList")) {
				$("#mainToolbar").attr("class","mb-1 navbar navbar-expand-lg navbar-dark brown lighten-1 smart-scroll z-depth-0");
				$("#productList").show();
			}
			
			// detect scroll top or down
			if ($('.smart-scroll').length > 0) { // check if element exists
			    var last_scroll_top = 0;
			    $(window).on('scroll', function() {
			        scroll_top = $(this).scrollTop();
			        if(scroll_top < last_scroll_top) {
			            $('.smart-scroll').removeClass('scrolled-down').addClass('scrolled-up');
			        }
			        else {
			            $('.smart-scroll').removeClass('scrolled-up').addClass('scrolled-down');
			        }
			        last_scroll_top = scroll_top;
			    });
			}
			
		});
	//============= 회원가입============
		$("#addUser").on("click",function(){
			self.location="/libero/user/addUser"
		//회원가입 온클릭 함수 
		})
	//============= modal 로그인 화면이동 =============
	$('#myModal').on('shown.bs.modal', function () {
		$('#userId').focus()
	})
	//============= modal 로그인 처리 =============
	$(function(){
		var session = "${sessionScope.user.userId}";
		
		if (session!="") {
			$("#login").hide();
			$(".userDropdown").show();
		} else if (session==""){
			$("#login").show();
			$(".userDropdown").hide();
		}
		
		$("#loginButton").on("click", function(){
			
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			//============login ajax=====================
			$.ajax({
				url : "/libero/user/json/login",
				method : "POST" ,
				data : JSON.stringify({"userId": id, "password": pw}) ,
				dataType : "json",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data , status) {
					
					$('#myModal').modal("hide"); // modal 닫기
					$(".userDropdown").show(); // 회원 dropdown show
					$("#login").hide(); // 로그인 버튼 hide
					$(".userDropdown").children().first().prepend(data.nickname); //닉네임 출력
					connect();
					window.location.reload();
					
				}
			});
			//===========login ajax end========================
		});
	});
	
		 //=======================Web Socket Start=========================		
		function connect(){ 
			session = "${sessionScope.user.userId}";			
			ws = new SockJS("<c:url value="/echo"/>");
			
			ws.onopen = function(){
				console.log('연결 생성');
			};
			ws.onmessage = function(e){
				console.log('메세지 받음');
				var data = e.data;
				alert("받은 메세지 : "+ data);
				//addMsg(data);
			};
			ws.onclose = function(){
				console.log('연결 끊김');
			};
			
		}//=======================Web Socket End=========================	
			
	</script>