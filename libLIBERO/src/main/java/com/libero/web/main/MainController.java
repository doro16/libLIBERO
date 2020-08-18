package com.libero.web.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.libero.service.domain.Statistics;
import com.libero.service.product.ProductService;
import com.libero.service.statistics.StatisticsService;
import com.libero.web.user.SNSloginController;


@Controller
public class MainController {
	
	//Field
	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;
	@Autowired
	private ProductService productService;
	
	//Constructor
	public MainController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/")
	public ModelAndView main(HttpSession session) throws Exception {
	    System.out.println("MainContorller Start");
	    
	    List<Statistics> list = statisticsService.getMainStatistics();
	    Map<String, Object> book = productService.getBookList();
	    for (int i = 0; i < book.size(); i++) {
	    	System.out.println(book.get("list"));
		}

	    String kakao_login = "";
	    String kakao_logout = "";
	    
	    if(session.getAttribute("user") == null) {
	    	kakao_login = SNSloginController.getAuthorizationUrl(session);
	    }else {
	    	if(session.getAttribute("kakao") != null &&  session.getAttribute("kakao").equals("true")) {
	    	kakao_logout = SNSloginController.getLogoutUrl(session);
	    	}
	    }	  
	    
	    session.setAttribute("kakao_login", kakao_login);
	    session.setAttribute("kakao_logout", kakao_logout);
	    
	    ModelAndView modelAndView = new ModelAndView();    
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("book", book.get("list"));
		modelAndView.setViewName("forward:/home.jsp");
	   
		return modelAndView;

	}
	
	@RequestMapping("/intro")
	public ModelAndView intro() throws Exception {
	    System.out.println("MainContorller Start");
	    
	    
	    ModelAndView modelAndView = new ModelAndView();    
		modelAndView.setViewName("forward:/intro.jsp");
	   
		return modelAndView;

	}

}
