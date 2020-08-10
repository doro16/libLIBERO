package com.libero.service.community;

import java.util.List;

import com.libero.service.domain.Post;
import com.libero.service.domain.User;
import com.libero.common.Search;
import com.libero.service.domain.Comment;

public interface CommunityDAO {
	
	public void addPost(Post post) throws Exception;
	
	public Post getPost(int postNo) throws Exception;
	
	public List<Post> getPostList(Search search, Post post) throws Exception;
	public int getPostTotalCount(Search search, Post post) throws Exception;
	
	public List<Post> getMyPostList(Search search, User user, String menu)throws Exception;
	public int getMyPostListTotalCount(Search search, User user, String menu)throws Exception;
	
	
	public void updatePost(Post post) throws Exception;
	
	public void deletePost(int postNo) throws Exception;
	
	
	
		
	
	public void addComment(Comment comment) throws Exception;
	
	public Comment getComment(int commentNo) throws Exception;
	
	public List<Comment> getCommentList(int postNo) throws Exception;
	public int getCommentTotalCount(int postNo) throws Exception;
	
	public List<Comment> getMyCommentList(Search search, String userId)throws Exception;
	public int getMyCommentListTotalCount(Search search, String userId)throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	

	
}
