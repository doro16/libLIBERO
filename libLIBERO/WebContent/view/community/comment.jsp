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
    			var menu = $("input[name='menu']").val(); 
    			
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
			var menu = $("input[name='menu']").val(); 
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
								var totalCount = "<h6 style='margin-bottom:-24px'>댓글&nbsp;"+JSONData.totalCount+"</h6>";
								for(i=0; i < JSONData.list.length; i++){
									var date = new Date(Number(JSONData.list[i].regDate));
									 
									displayValue += "<h6>"
										+"<input type='hidden' class='commentNo' name='commentNo' value=" + JSONData.list[i].commentNo + ">"
										
										+ "<img src='../resources/images/user/fileUpload/"+JSONData.list[i].user.profile+"'  alt='프로필사진' style='height: 55px; width: 55px; float: left; margin-right: 10px; margin-bottom: 10px;'>"
										+"<p style='font-size: 14px; color:DodgerBlue; font-weight: 600; float: left;'>" +JSONData.list[i].user.nickname + "&nbsp;&nbsp;&nbsp;</p>"
										+"<p style='font-size: 11px; color:gray; font-weight: 400;'>" + date.getFullYear()+".0"+parseInt(date.getMonth()+1)+"."+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</span>"
										+"<p id= 'none"+ JSONData.list[i].commentNo+"' style='font-size: 15px; padding: 14px 0px; font-weight: 400;'>"
										+ JSONData.list[i].commentContent
										+"</p><br>"
										
										+"<div id='update"+ JSONData.list[i].commentNo+"' style='display: none;' class='updateComment'>" 
										+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"	
										+"<textarea class='form-control col-11 col-md-11 mr-1' rows='3' maxlength='500' style='float:left'>"
										+ JSONData.list[i].commentContent
										+"</textarea>"
										+"<button class='btn btn-outline-brown btn-sm' style='margin-left:670px;' onclick='history.go'>취소</button>"
										+"<button class='btn btn-brown btn-sm'  id='updateComment'>등록</button>"
										
										+"</div>"
										+"<c:if test='${sessionScope.user.userId == post.user.userId}'>"
										+"<div class='commentUpdateDelete'>"
											+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"			
											+"<p style='float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;'>수정 </p>"
											+"<p style='font-size:13px; color:gray; font-weight: 500;'>삭제</p><br>"
										+"</div></c:if>";		
								}
					if(menu!='q'){				
						$( "#hh" ).html(displayValue);
						$( "#totalCount" ).html(totalCount);
					} else if(menu=='q'){
						$( "#commentContent" ).html(JSONData.list[0].commentContent);	
					}
					}	
			    	});
			
		}
		$(document).on("click", ".commentUpdateDelete p:nth-child(2)", function(){
			commentNo = parseInt($(this).parent().find(".commentNo").val());
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
		
		$(document).on("click", ".updateComment button", function(){
			var commentNo = $(this).parent().find(".commentNo").val();
			var commentContent = $(this).parent().find("textarea").val();
			
			$("#update"+commentNo+"").hide(); 
			$("#none"+commentNo+"").show(); 
			//alert(commentNo+commentContent);	
			
			$.ajax(
			    	{  		 	
			        url : "/libero/community/json/updateComment",
			        method : "POST" ,
					dataType : "json" ,
					
					data : JSON.stringify({
    					"commentNo" : commentNo,
    					"commentContent" : commentContent
    				}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						fncGetCommentList();
					
					}	
					
			});
    	});
		
		$(document).on("click", ".commentUpdateDelete p:nth-child(3)", function(){
			commentNo = parseInt($(this).parent().find(".commentNo").val());
			
			$.ajax(
			    	{
			        url : "/libero/community/json/deleteComment/"+commentNo,
			        method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						fncGetCommentList();	
					}	
    		});
		
		});

	
	</script>
</head>


<body>

	<span id="totalCount"></span>
		<div class="border-bottom mt-2 mb-4 py-4"></div>
		<div class="container">
			<form name="addCommentForm" id="addCommentForm">
			<input type="hidden" id="postNo" name="postNo" value="${post.postNo}" />
				
				<div class="form-row d-fle">
					<c:if test="${param.menu=='q'}"> 
					<textarea class="form-control col-12 col-md-12 mr-1" id="commentContent" name="commentContent" rows="5" style="background-color: #d7ccc8;" 
					>답변아직</textarea>
					</c:if>
					
					<c:if test="${param.menu==null}"> 
					<textarea class="form-control col-12 col-md-12 mr-1"
						id="commentContent" name="commentContent" rows="3" maxlength="500">
					</textarea>
					</c:if> 	
					<button class="btn btn-brown btn-sm" style="margin-left:742px;" id="addComment">등록</button>
					

				</div>
				</form>
			</div>
			
			
		
	
</body>

</html>