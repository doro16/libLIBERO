package com.libero.service.report.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.libero.common.Search;
import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;
import com.libero.service.report.ReportDAO;

@Repository("reportDAOImpl")
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void SqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReportDAOImpl() {
		System.out.println(this.getClass());
	}

	public List<Report> getPostReportList(Search search) throws Exception{
		return sqlSession.selectList("ReportMapper.getPostReportList", search);
	}
	public List<Report> getUserReportList(Search search, User user, String menu) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("user", user);
		map.put("menu", menu);
		return sqlSession.selectList("ReportMapper.getUserReportList", map);
	}
	
	
	public void addReport(Report report) throws Exception{
		
		sqlSession.insert("ReportMapper.addReport", report);
		if(report.getProdPost().equals("post")) {
		sqlSession.update("ReportMapper.updatePostReportCount", report.getPost());
		} else if(report.getProdPost().equals("prod")) {
		sqlSession.update("ReportMapper.updateProdReportCount", report.getProduct());
		}
	}
	
	
	
	
	// DAO에만 있음
	public int getPostReportTotalCount(Search search) throws Exception{
		return sqlSession.selectOne("ReportMapper.getPostReportTotalCount", search);
	}
	
	public int getUserReportTotalCount(Search search, User user, String menu) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
		map.put("user", user);
		map.put("menu", menu);

		return sqlSession.selectOne("ReportMapper.getUserReportTotalCount", map);
	}
	

}
