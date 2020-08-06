<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<meta charset="utf-8">

<script type="text/javascript">
		$(function() { 
			 fncGetCommentList();		 
		});	

		$(function() { 
			$("#addComment").on("click", function(){
				var postNo = parseInt($("input[name='postNo']").val());
    			var commentContent = $('#commentContent').val();
    			//alert(postNo + commentContent);
				$.ajax(
				    	{  		 	
				        url : "/libero/community/json/addComment",
				        method : "POST" ,
						dataType : "json" ,
						
						data : JSON.stringify({
	    					"postNo" : postNo,
	    					"commentContent" : commentContent
	    				}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

						}	
				    	});
			})	
		});
		
		function fncGetCommentList(){
			
			var postNo = parseInt($("input[name='postNo']").val()); 
			
			//alert(postNo);
			$.ajax(
			    	{
			    		 	
			        url : "/libero/community/json/getCommentList/"+postNo,
			        method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
								
								var displayValue = "";
								for(i=0; i < JSONData.list.length; i++){
									var date = new Date(Number(JSONData.list[i].regDate));
									 
									displayValue += "<h6>"
										+"<input type='hidden' class='commentNo' name='commentNo' value=" + JSONData.list[i].commentNo + ">"
										
										+"<br>"
										
										+ "<img src='../resources/images/community/"+JSONData.list[i].user.profile+"'  alt='프로필사진' style='height: 55px; width: 55px; float: left; margin-right: 10px; margin-bottom: 10px;'>"
										+"<p style='font-size: 14px; color:DodgerBlue; font-weight: 600; float: left;'>" +JSONData.list[i].user.nickname + "&nbsp;&nbsp;&nbsp;</p>"
										+"<p style='font-size: 11px; color:gray; font-weight: 400;'>" + date.getFullYear()+".0"+parseInt(date.getMonth()+1)+"."+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</span>"
										+"<p id= 'none"+ JSONData.list[i].commentNo+"' style='font-size: 15px; padding: 14px 0px; font-weight: 400;'>"
										+ JSONData.list[i].commentContent
										+"</p><br>"
										+"<div id='update"+ JSONData.list[i].commentNo+"' style='display: none;'>" 
										+"<textarea class='form-control col-9 col-md-10 mr-1' name='commentContent' rows='3' maxlength='500' style='float:left'>"
										+ JSONData.list[i].commentContent
										+"</textarea><button class='col-2 col-md-1 btn btn-outline-info' id='updateComment'>등록</button>"
										+"</div>"
										
										+"<div class='commentUpdateDelete'>"
											+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"			
											+"<p style='float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;'>수정 </p>"
											+"<p style='font-size:13px; color:gray; font-weight: 500;'>삭제</p><br>"
										+"</div>";	
								}
								
					$( "#hh" ).html(displayValue);
					}	
			    	});
			
			
			
		
		}
		$(document).on("click", ".commentUpdateDelete p:nth-child(2)", function(){
			commentNo = $(this).parent().find(".commentNo").val();
			$(this).parent().find("p").hide();
			$.ajax(
			    	{
			        url : "/libero/community/json/updateComment/"+commentNo,
			        method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
								
						$("#update"+commentNo+"").show(); 
						$("#none"+commentNo+"").hide(); 
						 
						   
					}	
    	});
		
	});
		
		

	
	</script>
</head>


<body>
	<form name="addCommentForm" id="addCommentForm">
		<input type="hidden" id="postNo" name="postNo" value="${post.postNo}" />
		<div class="container">
			<div class="border-bottom mt-2 mb-4 py-4">
				<div class="form-row d-flex justify-content-center">
					<textarea class="form-control col-9 col-md-10 mr-1"
						id="commentContent" name="commentContent" rows="3" maxlength="500"></textarea>
					<button class="col-2 col-md-1 btn btn-outline-info" id="addComment">등록</button>


				</div>

			</div>
		</div>
	</form>

</body>

</html>