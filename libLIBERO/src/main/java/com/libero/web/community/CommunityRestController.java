package com.libero.web.community;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.libero.service.community.CommunityService;
import com.libero.service.domain.Comment;
import com.libero.service.domain.User;
import com.libero.service.user.UserService;



@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;	
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	public CommunityRestController() {
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
/*
	@RequestMapping(value="/json/getComment/{commentNo}", method=RequestMethod.GET)
	public Comment getComment( @PathVariable("commentNo") int commentNo) throws Exception {
		
		System.out.println("^^^^^^^^"+ "/community/json/getComment : GET");
		
		Comment comment = communityService.getComment(commentNo);
		//User user = comment.getUser();
		//comment.setUser(user);
		return comment;
		// Controller는 View Page 리턴 
		// RestController는 객체(VO,DTO) 반환하기만 하면, 객체데이터는 application/json 형식의 HTTP ResponseBody에 직접 작성됨
	}
	*/
	
	@RequestMapping(value="/json/addComment", method=RequestMethod.POST)
	public Comment addComment(@RequestBody Map<String, Object> map2,  HttpSession session, Comment comment) throws Exception{
		System.out.println("^^^^^^^^"+ "/community/json/addComment : POST");
		User user = ((User)session.getAttribute("user"));
		comment.setPostNo((int) map2.get("postNo"));
		comment.setCommentContent((String) map2.get("commentContent"));
		comment.setUser(user);
		
		communityService.addComment(comment);
		
		int commentNo = communityService.getFinalCommentNo();
		
		Comment firstComment = new Comment();
		firstComment = communityService.getComment(commentNo);
		System.out.println("comment찍어보자"+firstComment);
		char menu = comment.getPostType();
		System.out.println("menu찍어보자"+menu);
		//System.out.println("야 임마"+firstComment);
		if(menu == 'q') {
			communityService.updateQnaCode(comment.getPostNo());
		}
		
		return firstComment;
			
	}
	
	@RequestMapping(value="/json/updateComment/{commentNo}", method=RequestMethod.GET)
	public Comment updateComment(@PathVariable("commentNo") int commentNo) throws Exception{
		System.out.println("^^^^^^^^"+ "/community/json/updateComment 할 거 가져오자");
		Comment comment = communityService.getComment(commentNo);
		
		return comment;
	}
	
	@RequestMapping(value="/json/updateComment", method=RequestMethod.POST)
	public Comment updateComment(@RequestBody Map<String, String> map2, HttpSession session, Comment comment) throws Exception{
		System.out.println("updateComment입니다");
		User user = ((User)session.getAttribute("user"));

		comment.setCommentNo(Integer.valueOf(map2.get("commentNo")));
		System.out.println(map2);
		System.out.println("넘겨");
		
		
		comment.setCommentContent(map2.get("commentContent"));
		comment.setUser(user);
		communityService.updateComment(comment);
		return comment;
	}
	
	
	@RequestMapping(value="/json/deleteComment/{commentNo}", method=RequestMethod.GET)
	public int deleteComment(@PathVariable("commentNo") int commentNo) throws Exception{
		System.out.println("deleteComment입니다");
		Comment comment = communityService.getComment(commentNo);
		communityService.deleteComment(comment);
		return 2;
	}
	
	@RequestMapping(value="/json/addPost", method=RequestMethod.POST)
	public Map addPost(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		System.out.println("/community/json/addPost : POST");
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		String fileRoot = path+"community/fileUpload/"; //파일 경로
		
		File targetFile = new File(fileRoot + savedFileName);
		
		Map map = new HashMap();
		
		try {
			multipartFile.transferTo(targetFile);	//파일 저장
			map.put("url", "/libero/resources/images/community/fileUpload/"+savedFileName);
			map.put("responseCode", "success");
			System.out.println("Map : "+map);
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		
		Thread.sleep(5000);
		return map;
	}
	
	
	@RequestMapping(value="json/updatePost", method=RequestMethod.POST)
	public Map updatePost(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		System.out.println("/community/json/updatePost : POST");
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		String fileRoot = path+"community/fileUpload/"; //파일 경로
		
		File targetFile = new File(fileRoot + savedFileName);
		
		Map map = new HashMap();
		
		try {
			multipartFile.transferTo(targetFile);	//파일 저장
			map.put("url", "/libero/resources/images/community/fileUpload/"+savedFileName);
			map.put("responseCode", "success");
			System.out.println("Map : "+map);
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		
		Thread.sleep(5000);
		return map;
	}
	
	
}
