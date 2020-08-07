package com.libero.web.community;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.libero.common.Page;
import com.libero.common.Search;
import com.libero.service.community.CommunityService;
import com.libero.service.domain.Post;
import com.libero.service.domain.Publish;
import com.libero.service.domain.User;
import com.libero.service.user.UserService;


@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public CommunityController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['path']}")
	String path;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping(value="getPost", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getPost(@RequestParam("postNo") int postNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/getPost : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		
		Post post = communityService.getPost(postNo);
		//post.setRegDate(post.getRegDate().replace("-", "")); 
		
		modelAndView.setViewName("/view/community/getPost.jsp");
		modelAndView.addObject("post", post);
		//System.out.println("toString^^^" + post.toString());
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPostList")
	public ModelAndView getPostList(@RequestParam(value="menu", required=false) String menu, Search search, Post post) throws Exception{
		
		System.out.println("^^^^^^^"+ "/community/getPostList");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(menu.equals(new String("n"))) {
			post.setPostType("n");
		} 
		if(menu.equals(new String("f"))) {
			post.setPostType("f");
		} 
		Map<String, Object> map = communityService.getPostList(search, post);
		
		Page resultPage = new Page(search.getCurrentPage(),
									((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		
		if(menu.equals(new String("n"))) {
			modelAndView.setViewName("/view/community/getPostList.jsp");
		}
		if(menu.equals(new String("f"))) {
			modelAndView.setViewName("/view/community/getFreePostList.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.GET)
	public ModelAndView addPost(@RequestParam(value="postType", required=false) String postType) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/view/community/addPost.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPost", method=RequestMethod.POST)
	public ModelAndView addPost(HttpSession session, Post post) throws Exception {
		System.out.println("^^^^^^^"+ "/community/addPost");
		
		User user = ((User)session.getAttribute("user"));
		post.setUser(user);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addPost(post);
		modelAndView.addObject("post", post);
		modelAndView.setViewName("/view/community/getPost.jsp");
		
		return modelAndView;
	}					 
	
	@RequestMapping(value="updatePost", method=RequestMethod.GET)
	public ModelAndView updatePost(@RequestParam("postNo") int postNo) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Post post = communityService.getPost(postNo);
		modelAndView.addObject("post", post);
		modelAndView.setViewName("/view/community/updatePost.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="updatePost", method=RequestMethod.POST)
	public ModelAndView updatePost(@ModelAttribute("post") Post post) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		communityService.updatePost(post);
		//int postNo = post.getPostNo();
		modelAndView.setViewName("/view/community/getPost.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="deletePost", method=RequestMethod.GET)
	public ModelAndView deletePost(@RequestParam("postNo") int postNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		//Post post = communityService.getPost(postNo);
		//communityService.deletePost(postNo);
		modelAndView.setViewName("/view/community/getPostList");
		
		return modelAndView;
	}
	
	
	
}
