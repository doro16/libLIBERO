package com.libero.service.report.impl;

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
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;
import com.libero.service.report.ReportDAO;
import com.libero.service.report.ReportService;

@Service("reportServiceImpl")
public class ReportServiceImpl implements ReportService{
	
	///Field	
	@Autowired
	@Qualifier("reportDAOImpl")
	private ReportDAO reportDAO;
	
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}
	
	///Constructor
	public ReportServiceImpl() {
		System.out.println(this.getClass());
	}

	
	public void addReport(Report report) throws Exception {
		reportDAO.addReport(report);
	}

	
	public Map<String, Object> getPostReportList(Search search) throws Exception {
		List<Report> list = reportDAO.getPostReportList(search);
		int totalCount = reportDAO.getPostReportTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		
		return map;		
	}
	

	public Map<String, Object> getUserReportList(Search search , User user, String menu)throws Exception{
		
		List<Report> list = reportDAO.getUserReportList(search, user, menu);
		int totalCount = reportDAO.getUserReportTotalCount(search, user, menu);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		
		return map;		
	}
	

}