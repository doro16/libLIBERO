package com.libero.web.user;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.libero.common.Page;
import com.libero.common.Search;
import com.libero.service.community.CommunityService;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Comment;
import com.libero.service.domain.Post;
import com.libero.service.domain.Publish;
import com.libero.service.domain.Report;
import com.libero.service.domain.Statistics;
import com.libero.service.domain.User;
import com.libero.service.publish.PublishService;
import com.libero.service.report.ReportService;
import com.libero.service.statistics.StatisticsService;
import com.libero.service.user.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	private PublishService publishService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	@Qualifier("statisticsServiceImpl")
	private StatisticsService statisticsService;

	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['path3']}")
	String path;
	
	@Value("#{userProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{userProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(User user , HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		System.out.println(session.getAttribute("user"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/");
		
		return modelAndView;
	}
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/";
	}

	@RequestMapping(value="addUser",method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception{
		System.out.println(" ---------------------------------------");
		System.out.println("/user/addUser : GET");
		System.out.println(" ---------------------------------------");
		
		ModelAndView mdv = new ModelAndView();
		mdv.setViewName("forward:/view/user/addUser.jsp");
		return mdv;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute User user,
								@RequestParam List<String> hashtagName,
								@RequestParam("file") List<MultipartFile> file
								) throws Exception{
			
			System.out.println(" ---------------------------------------");
			System.out.println("/user/addUser : POST");
			System.out.println(" ---------------------------------------");
			
			//user.setProfile(profile);
			ModelAndView mdv = new ModelAndView();
			for (MultipartFile multipartFile : file) {
				
				System.out.println(multipartFile.getOriginalFilename());
				
				String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
				String extension=originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
				String fileRoot = "C:/Users/user/git/libLIBERO/libLIBERO/WebContent/resources/images/user/fileUpload/"; // 파일 경로
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File f =new File(fileRoot+savedFileName);
				
				multipartFile.transferTo(f);
				System.out.println(" ---------------------------------------");
				System.out.println(f.getName());
				System.out.println(" ---------------------------------------");
			
				user.setProfile(f.getName());
			}
				
				userService.addUser(user);
				System.out.println("\n\n\n ---------------------------------------");
				System.out.println(hashtagName);
				System.out.println(" ---------------------------------------\n\n\n");
				System.out.println("");
				
				
				userService.addHashtag(user.getUserId(),hashtagName);
		//File Upload End
		
		
		mdv.setViewName("redirect:/");
		return mdv;
	}
	
	@RequestMapping(value = "getUserPublishList")
	public ModelAndView getUserPublishList(HttpSession session, @RequestParam("prodType") String prodType, Publish publish,Search search) throws Exception {
		
		System.out.println("/user/getUserPublishList : GET, POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		publish.setProdType(prodType);
		publish.setCreator(((User)session.getAttribute("user")).getUserId());
		
		Map<String , Object> map=publishService.getUserPublishList(publish, search);
		Page resultPage = new Page(search.getCurrentPage(),
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		modelAndView.setViewName("forward:/view/user/getUserPublishList.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "getTempPublishList", method = RequestMethod.GET)
	public ModelAndView getStatistics(HttpSession session, Publish publish, Search search) throws Exception {
		
		System.out.println("/user/getTempPublishList : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		publish.setCreator(((User)session.getAttribute("user")).getUserId());
		publish.setBlindCode("temp");
		
		Map<String , Object> map=publishService.getUserPublishList(publish,search);
		Page resultPage = new Page(search.getCurrentPage(),
				((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		modelAndView.setViewName("forward:/view/user/getTempPublishList.jsp");
		
		return modelAndView;
	}
	

	
	@RequestMapping(value = "removeTempPublish", method = RequestMethod.GET)
	public ModelAndView removeTempPublish(@RequestParam("prodNo")int prodNo) throws Exception {
		
		System.out.println("/user/getTempPublishList : GET");
		
		publishService.removeTempPublish(prodNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/getTempPublishList");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "getUserCash",  method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getUserCash(HttpSession session, String userId) throws Exception {
		
		System.out.println("/user/getUserCash : GET");
		
		User user = ((User) session.getAttribute("user"));
		userId = user.getUserId();
		user = userService.getUser(userId);
		String cashCode = user.getCashCode();
		
		//Cash cash = publishService.getUserCash(userId);
		Cash cash =  userService.getCash(userId);
		
		List<Statistics> day = statisticsService.getCashStatistics(userId);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cashCode", cashCode);
		modelAndView.addObject("cash", cash);
		modelAndView.addObject("day", day);
		modelAndView.setViewName("forward:/view/user/getUserCash.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "getUserList")
	public ModelAndView getAdminCashList(HttpSession session, Search search) throws Exception{
		
		System.out.println("/user/getUserList : GET, POST"+search.getCurrentPage());
		
		String role = ((User)session.getAttribute("user")).getRole();
		
		ModelAndView modelAndView = new ModelAndView();
		
		if (role.contentEquals("a")) {
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			Map<String , Object> map = userService.getUserList(search);
			Page resultPage = new Page(search.getCurrentPage(),
					((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			modelAndView.addObject("totalCount", map.get("totalCount"));
			modelAndView.setViewName("forward:/view/user/getUserList.jsp");
		}else {
			modelAndView.setViewName("redirect:/");
		}
		
		return modelAndView;
	}
	

	@RequestMapping(value = "getUserReportList", method = RequestMethod.GET)
	public ModelAndView getUserReportList( @RequestParam(value="menu", required=false) String menu, @ModelAttribute("search") Search search, HttpSession session) throws Exception {
		System.out.println("/user/getAdminReportList : GET");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		Map<String,Object> map = new HashMap<String,Object>(); 
		
		ModelAndView modelAndView = new ModelAndView();
		
		User user = (User)session.getAttribute("user");
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("menu가 뭔가요"+menu);
		if(menu.equals(new String("prod"))) {
			map = reportService.getUserReportList(search, user, menu);
		} 		
		
		if(menu.equals(new String("post"))) {
			map = reportService.getUserReportList(search, user, menu);
		} 
		
		Page resultPage = new Page(search.getCurrentPage(),
									((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		
		modelAndView.setViewName("/view/user/getUserReportList.jsp");
		
		return modelAndView;
	}
	
	
	
	@RequestMapping(value = "getUserActivityList", method = RequestMethod.GET)
	public ModelAndView getUserActivityList( @RequestParam(value="menu", required=false) String menu, @ModelAttribute("search") Search search, HttpSession session) throws Exception {
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String,Object> map = new HashMap<String,Object>(); 
		
		ModelAndView modelAndView = new ModelAndView();
		
		User user = (User)session.getAttribute("user");
		String userId = ((User)session.getAttribute("user")).getUserId();
		
		System.out.println("menu가 뭔가요"+menu);
		if(menu.equals(new String("p"))) {
			map = communityService.getMyPostList(search, user, menu);
		} 		
		
		if(menu.equals(new String("c"))) {
			map = communityService.getMyCommentList(search, userId);
		} 
		
		if(menu.equals(new String("q"))) {
			map = communityService.getMyPostList(search, user, menu);
		} 
		
		Page resultPage = new Page(search.getCurrentPage(),
									((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		System.out.println(resultPage);
		
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.addObject("totalCount", map.get("totalCount"));
		
		modelAndView.setViewName("/view/user/getUserActivityList.jsp");
		
		return modelAndView;
	}

	
	@RequestMapping(value = "requestCash/{cashWithdraw}", method = RequestMethod.GET)
	public ModelAndView requestCash(HttpServletRequest request, @PathVariable("cashWithdraw") int cashWithdraw)
			throws Exception {
		System.out.println("/user/requestCash : POST");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/getUserCash");

		HttpSession session = request.getSession(true);
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();

		Cash cash = new Cash();
		cash = userService.getCash(userId);

		if (cash.getCashCurrent() < cashWithdraw) {
			mav.addObject("cashMessage", "0");
			return mav;
		}
		cash.setCashCurrent(cash.getCashCurrent() - cashWithdraw);
		cash.setCashWithdraw(cashWithdraw);
		userService.updateCash(cash);

		userService.requestCash(userId, "af");

		return mav;
	}

	@RequestMapping(value = "updateCash/{userId}", method = RequestMethod.GET)
	public ModelAndView updateCash(@PathVariable("userId") String userId) throws Exception {
		System.out.println("/user/updateCash : GET");

		Cash cash = userService.getCash(userId);
		cash.setCashAmount(cash.getCashAmount() + cash.getCashWithdraw());
		cash.setCashWithdraw(0);

		userService.updateCash(cash);
		userService.requestCash(userId, "bf");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/user/getUserList");

		return mav;
	}
	
}
