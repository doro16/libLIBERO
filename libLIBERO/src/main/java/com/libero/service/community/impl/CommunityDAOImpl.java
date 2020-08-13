package com.libero.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.community.CommunityDAO;
import com.libero.service.domain.Comment;
import com.libero.service.domain.Post;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;

@Repository("communityDAOImpl")
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public CommunityDAOImpl() {
		System.out.println(this.getClass());
	}


	public Post getPost(int postNo) throws Exception {
		
		sqlSession.update("CommunityMapper.updateViewCount", postNo);
		return sqlSession.selectOne("CommunityMapper.getPost", postNo);
		
	}
	
	public List<Post> getPostList(Search search, Post post) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("post", post);
		return sqlSession.selectList("CommunityMapper.getPostList", map);
	}
	
	public List<Post> getMyPostList(Search search, User user, String menu){
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("user", user);
		map.put("menu", menu);
		
		
		return sqlSession.selectList("CommunityMapper.getMyPostList",map);
	}

	public void addPost(Post post) throws Exception {
		sqlSession.insert("CommunityMapper.addPost", post);

	}

	public void updatePost(Post post) throws Exception {
		sqlSession.update("CommunityMapper.updatePost", post);

	}

	public void deletePost(int postNo) throws Exception {
		sqlSession.delete("CommunityMapper.deleteComment2", postNo);
		sqlSession.delete("CommunityMapper.deletePost", postNo);
		
	}
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getPostTotalCount(Search search, Post post) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
				
		map.put("search", search);
		map.put("post", post);
		return sqlSession.selectOne("CommunityMapper.getPostTotalCount", map);
	}
	
	public int getMyPostListTotalCount(Search search, User user, String menu)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("user", user);
		map.put("menu", menu);
		
		return sqlSession.selectOne("CommunityMapper.getMyPostListTotalCount", map);
	}
	
	public Comment getComment(int commentNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getComment", commentNo);
	}
	
	public List<Comment> getCommentList(HashMap<String, Object> commentMap) throws Exception{
		
		int currentPage = (int)commentMap.get("currentPage");
		
		int pageSize = (int)commentMap.get("pageSize");
		
		int offset = (currentPage-1)*(pageSize);
			commentMap.put("offset", offset);
		
		return sqlSession.selectList("CommunityMapper.getCommentList", commentMap);
	}
	
	public List<Comment> getMyCommentList(Search search, String userId){
		
		System.out.println(search);
		System.out.println("내가  쓴 댓글"+userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		
		return sqlSession.selectList("CommunityMapper.getMyCommentList",map);
	}
	
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommunityMapper.addComment", comment);
		sqlSession.update("CommunityMapper.updateCommentCount", comment.getPostNo());
	}
	
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.updateComment", comment);
	}
	
	public void deleteComment(Comment comment) throws Exception {
		sqlSession.update("CommunityMapper.deleteCommentCount", comment.getPostNo());
		sqlSession.delete("CommunityMapper.deleteComment", comment.getCommentNo());
	}
	
	public int getCommentTotalCount(int postNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommentTotalCount", postNo);
	}
	
	public int getMyCommentListTotalCount(Search search, String userId)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("userId", userId);
		
		return sqlSession.selectOne("CommunityMapper.getMyCommentListTotalCount",map);
	}
	
	public void updateQnaCode(int postNo) throws Exception{
		sqlSession.update("CommunityMapper.updateQnaCode", postNo);	
	}
	
	public int getFinalCommentNo() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("CommunityMapper.getFinalCommentNo");
	}
	
}
