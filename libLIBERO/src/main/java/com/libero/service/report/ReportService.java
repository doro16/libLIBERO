package com.libero.service.report;

import java.util.Map;

import com.libero.common.Search;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;

public interface ReportService {
	
	
	public Map<String, Object> getPostReportList(Search search) throws Exception;
	
	public Map<String , Object> getUserReportList(Search search, User user, String menu)throws Exception;
	
	public void addReport(Report report) throws Exception;
	
	

	}
