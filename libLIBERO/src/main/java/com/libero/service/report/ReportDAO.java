package com.libero.service.report;

import java.util.List;

import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;
import com.libero.common.Search;
import com.libero.service.domain.Comment;

public interface ReportDAO {
	
	
	public List<Report> getPostReportList(Search search) throws Exception;	
	public int getPostReportTotalCount(Search search) throws Exception;
	
	public List<Report> getUserReportList(Search search, User user, String menu) throws Exception;	
	public int getUserReportTotalCount(Search search, User user, String menu) throws Exception;
	
	public void addReport(Report report) throws Exception;


	
	
	
}
