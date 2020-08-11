package com.libero.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.libero.common.Search;
import com.libero.service.community.CommunityDAO;
import com.libero.service.community.CommunityService;
import com.libero.service.domain.Comment;
import com.libero.service.domain.Post;
import com.libero.service.domain.User;


@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {
	
	///Field	
	@Autowired 	
	@Qualifier("communityDAOImpl")
	private CommunityDAO communityDAO;
	
	public void setCommunityDAO(CommunityDAO communityDAO) {
		this.communityDAO = communityDAO;
	}
	
	///Constructor
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}


	public Post getPost(int postNo) throws Exception {
		return communityDAO.getPost(postNo);
	}
	
	public Map<String, Object> getPostList(Search search, Post post) throws Exception {
		List<Post> list = communityDAO.getPostList(search, post);
		int totalCount = communityDAO.getPostTotalCount(search, post);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public Map<String,Object> getMyPostList(Search search , User user, String menu)throws Exception{
		
		List<Post> list= communityDAO.getMyPostList(search, user, menu);
		int totalCount= communityDAO.getMyPostListTotalCount(search, user, menu);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount",totalCount);
		return map;
	}

	public void addPost(Post post) throws Exception {
		communityDAO.addPost(post);
	}
	
	public void updatePost(Post post) throws Exception {
		communityDAO.updatePost(post);
	}

	public void deletePost(int postNo) throws Exception {
		communityDAO.deletePost(postNo);
	}
	
	public Comment getComment(int commentNo) throws Exception {
		return communityDAO.getComment(commentNo);
	}
	
	public Map<String, Object> getCommentList(int postNo) throws Exception {
		List<Comment> list = communityDAO.getCommentList(postNo);
		int totalCount = communityDAO.getCommentTotalCount(postNo);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
	
	public Map<String,Object> getMyCommentList(Search search , String userId) throws Exception{
		
		List<Comment> list= communityDAO.getMyCommentList(search, userId);
		int totalCount = communityDAO.getMyCommentListTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount",totalCount);

		return map;
	}
	
	public void addComment(Comment comment) throws Exception {
		communityDAO.addComment(comment);
	}
	
	public void updateComment(Comment comment) throws Exception {
		communityDAO.updateComment(comment);
	}
	
	public void deleteComment(Comment comment) throws Exception {
		communityDAO.deleteComment(comment);
	}
	
	public void updateQnaCode(int postNo) throws Exception{
		communityDAO.updateQnaCode(postNo);
	}
}
