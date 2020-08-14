<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.libero.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
<meta charset="utf-8">

<script type="text/javascript">
		

		$(function() { 
			
			$("#addComment").on("click", function(){
				var postNo = parseInt($("input[name='postNo']").val());	
    			var menu = $("input[name='postType']").val(); 
    			if(menu!='q'){				
    				var commentContent = $('#commentContent').val();
				} else if(menu=='q'){
					var commentContent = $('#commentContent2').val();
				}
    			
    			
				$.ajax(
				    	{  		 	
				        url : "/libero/community/json/addComment",
				        method : "POST" ,
						dataType : "json" ,
						
						data : JSON.stringify({
	    					"postNo" : postNo,
	    					"commentContent" : commentContent,
	    					"menu" : menu
	    				}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {						 
							//alert(JSONData.commentContent);
							if(menu!='q'){		
							var date = new Date(Number(JSONData.regDate));
							var displayValue ="<div class='wow"+ JSONData.commentNo+"'>"
								
								+"<img src='../resources/images/user/fileUpload/"+JSONData.user.profile+"'  alt='프로필사진' style='height: 55px; width: 55px; float: left; margin:-4px 10px 10px 0;'>"
								+"<p style='font-size: 14px; color:DodgerBlue; font-weight: 600; float:left;'>" +JSONData.user.nickname + "&nbsp;&nbsp;&nbsp;</p>"
								+"<p style='font-size: 11px; color:gray; font-weight: 400;'>" + date.getFullYear()+".0"+parseInt(date.getMonth()+1)+"."+date.getDate()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+"</span>"
								+"<p id= 'none"+ JSONData.commentNo+"' style='font-size: 15px; padding: 14px 0px; font-weight: 400;'>"+JSONData.commentContent
								+"</p><br>"
								+"<div id='update"+ JSONData.commentNo+"' style='display: none;' class='updateComment'>" 
								+"<input type='hidden' class='commentNo' value=" + JSONData.commentNo + ">"	
								+"<textarea class='form-control col-11 col-md-11 mr-1' rows='3' maxlength='500' style='float:left'>"
								+ JSONData.commentContent
								+"</textarea>"
								+"<button class='btn btn-outline-brown btn-sm' style='margin-left:670px;' onclick='history.go'>취소</button>"
								+"<button class='btn btn-brown btn-sm'  id='updateComment'>등록</button>"
								+"</div>"
								+"<div class='commentUpdateDelete'>"
									+"<input type='hidden' class='commentNo' value=" + JSONData.commentNo + ">"			
									+"<p style='float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;'>수정 </p>"
									+"<p style='font-size:13px; color:gray; font-weight: 500;'>삭제</p><br>"
								+"</div></div>";	
								
								
							$('#commentContent').val("");
							$(".container").after(displayValue);
							} else if(menu=='q'){
								$("#commentContent2" ).html(JSONData.commentContent);
								$("#addComment").remove();
							}
						}	
				    	});
			})	
		});
		
		
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
						
						var displayValue =JSONData.commentContent;
						$("#update"+commentNo+"").show(); 
						
						$("#none"+commentNo+"").hide(); 
						
			   
					}	
    		});
		
		});
		
		$(document).on("click", ".updateComment button", function(){
			var commentNo = $(this).parent().find(".commentNo").val();
			var commentContent = $(this).parent().find("textarea").val();
			
			
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
						$("#update"+commentNo+"").hide(); 
						var displayValue = "<p style='font-size: 15px; padding: 14px 0px; font-weight: 400;'>"
						+JSONData.commentContent+"</p>"
						+"<div class='commentUpdateDelete'>"
						+"<input type='hidden' class='commentNo' value=" + JSONData.commentNo + ">"			
						+"<p style='float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;'>수정 </p>"
						+"<p style='font-size:13px; color:gray; font-weight: 500;'>삭제</p><br>"
						+"</div>";	
						$("#none"+commentNo+"").after(displayValue); 
						
						
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
						$(".wow"+commentNo+"").remove();
					}	
    		});
		
		});

	
	</script>
</head>


<body>

	<span id="totalCount"></span>
		<div class="border-bottom mt-2 mb-4 py-4"></div>
		<div class="container">
		
			
			<input type="hidden" id="postNo" name="postNo" value="${post.postNo}" />

				<div class="form-row d-fle">
					<c:if test="${param.menu!='q'}"> 
					<textarea class="form-control col-12 col-md-12 mr-1"
						id="commentContent" name="commentContent" rows="3" maxlength="500" style="text-align: left;"></textarea>
					<button class="btn btn-brown btn-sm" style="margin-left:742px;" id="addComment">등록</button>
					</c:if> 		

					<c:if test="${user.role!='a' && param.menu=='q' && post.commentCount == 0}"> 
					<textarea class="form-control col-12 col-md-12 mr-1" id="commentContent2" name="commentContent2" rows="10" style="background-color: #d7ccc8;" 
					placeholder="답변이 아직 등록되지 않았습니다." readonly></textarea>
					</c:if>
					
					<c:if test="${user.role=='a' && param.menu=='q' && post.commentCount == 0}">  
					<textarea class="form-control col-12 col-md-12 mr-1" id="commentContent2" name="commentContent2" rows="10" style="background-color: #d7ccc8;" 
					placeholder="관리자님! 답변을 등록해주세요."></textarea>
					<button class="btn btn-brown btn-sm" style="margin-left:742px;" id="addComment">등록</button>
					</c:if>
						
				</div>
		
			
		</div>
		<!-- /////////////// -->
				
		  <c:set var="i" value="0" />
		  <c:forEach var="comment" items="${comment}">
		  <c:set var="i" value="${ i+1 }" />
					<c:if test="${param.menu=='q'}"> 	
						<textarea class="form-control col-12 col-md-12 mr-1" id="commentContent2" name="commentContent2" 
						rows="10" style="background-color: #d7ccc8;" >${comment.commentContent}</textarea>
					</c:if>	  
					<c:if test="${param.menu!='q'}">    
    							<div class="wow${comment.commentNo}">
   								
   								<img src="../resources/images/user/fileUpload/${comment.user.profile}"  alt="프로필사진" style= "height: 55px; width: 55px; float: left; margin:-4px 10px 10px 0;">
   								<p style="font-size: 14px; color:DodgerBlue; font-weight: 600; float: left;">${comment.user.nickname}&nbsp;&nbsp;&nbsp;</p>
   								<p style="font-size: 11px; color:gray; font-weight: 400;">${comment.regDate}</p>
								<p id= "none${comment.commentNo}" style="font-size: 15px; padding: 14px 0px; font-weight: 400;">
								${comment.commentContent}</p><br>
								<div id="update${comment.commentNo}" style="display: none;" class="updateComment"> 
									<input type='hidden' class="commentNo" name="commentNo" value="${comment.commentNo}" style="display: none;">
									<textarea class="form-control col-11 col-md-11 mr-1" rows="3" maxlength="500" style="float:left">${comment.commentContent}</textarea>
									<button class="btn btn-outline-brown btn-sm" style="margin-left:670px;" onclick="history.go()">취소</button>
									<button class="btn btn-brown btn-sm"  id="updateComment">등록</button>
								</div>
								<c:if test="${sessionScope.user.userId == comment.user.userId}">
									<div class="commentUpdateDelete">
									<input type='hidden' class="commentNo" name="commentNo" value="${comment.commentNo}" style="display: none;">	
									<p style="float:left; padding: 0px 10px 0px 65px; font-size: 13px; color:gray; font-weight: 500;">수정 </p>
									<p style="font-size:13px; color:gray; font-weight: 500;">삭제</p><br>
									</div>
								</c:if>		
								</div>
								 
					</c:if>
		</c:forEach>
</body>

</html>