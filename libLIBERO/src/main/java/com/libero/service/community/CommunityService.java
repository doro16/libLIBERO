package com.libero.service.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.libero.service.domain.Post;
import com.libero.service.domain.User;
import com.libero.common.Search;
import com.libero.service.domain.Comment;

public interface CommunityService {
	
		public void addPost(Post post) throws Exception;
		
		public Post getPost(int postNo) throws Exception;
		
		public Map<String, Object>getPostList(Search search, Post post) throws Exception;

		public Map<String , Object> getMyPostList(Search search, User user, String menu)throws Exception;
		
		public void updatePost(Post post) throws Exception;
		
		public void deletePost(int postNo) throws Exception;
		
		
		public void addComment(Comment comment) throws Exception;
		
		public Comment getComment(int commentNo) throws Exception;
		
		public List<Comment> getCommentList(HashMap<String, Object> commentMap) throws Exception;
		
		public int getFinalCommentNo() throws Exception; 
		
		public int getCommentTotalCount(int postNo) throws Exception;
		
		public Map<String , Object> getMyCommentList(Search search , String userId)throws Exception;
		
		public void updateComment(Comment comment) throws Exception;
		
		public void deleteComment(Comment comment) throws Exception;
		
		public void updateQnaCode(int postNo) throws Exception;

	}
