package com.libero.web.report;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.community.CommunityService;
import com.libero.service.domain.Post;
import com.libero.service.domain.Product;
import com.libero.service.domain.Report;
import com.libero.service.domain.User;
import com.libero.service.product.ProductService;
import com.libero.service.report.ReportService;
import com.libero.service.user.UserService;

@RestController
@RequestMapping("/report/*")
public class ReportRestController {
	
	@Autowired
	@Qualifier("reportServiceImpl")
	private ReportService reportService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;	
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public ReportRestController() {
		System.out.println(this.getClass());
	}
		
	@Value("#{commonProperties['path3']}")
	String path;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="/json/addReport", method=RequestMethod.POST)
	public void addReport(@RequestBody Map<String, Object> map2, Report report, HttpSession session) throws Exception{
		System.out.println("^^^^^^^^"+ "/report/json/addReport : POST");
		User user = ((User)session.getAttribute("user"));
		String prodPost = ((String)map2.get("prodPost"));
		System.out.println("prodPost봅시다야야2" + prodPost);
		if(prodPost.equals("post")) {
			int postNo = ((int)map2.get("postNo"));
			Post post = communityService.getPost(postNo);
			report.setPost(post);	
			report.setProdPost("post");
		} else if (prodPost.equals("prod")) {
			int prodNo = ((int)map2.get("prodNo"));
			Product product = productService.getProduct(prodNo);
			report.setProduct(product);
			report.setProdPost("prod");
		}	
		report.setReportType((int)map2.get("index"));
		report.setUser(user);
		
	
		reportService.addReport(report);
		
		
	}
	
}
