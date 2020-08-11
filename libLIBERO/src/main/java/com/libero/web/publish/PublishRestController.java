package com.libero.web.publish;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.libero.service.domain.Publish;
import com.libero.service.publish.PublishService;

@RestController
@RequestMapping("/publish/*")
public class PublishRestController {
	
	//Filed
	@Autowired
	@Qualifier("publishServiceImpl")
	private PublishService publishService;
	
	//Constructor
	public PublishRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['path']}")
	String path;
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Map addProduct(@RequestParam("file") MultipartFile multipartFile) throws Exception {

		System.out.println("/publish/json/addProduct : POST");
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		String fileRoot = path+"publish/fileUpload/"; //파일 경로
		
		File targetFile = new File(fileRoot + savedFileName);
		
		Map map = new HashMap();
		
		try {
			multipartFile.transferTo(targetFile);	//파일 저장
			map.put("url", "/libero/resources/images/publish/fileUpload/"+savedFileName);
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
	
	@RequestMapping(value = "json/updateBlindCode/{prodNo}/{blindCode}", method = RequestMethod.GET)
	public Map updateBlindCode(@PathVariable("prodNo") int prodNo, @PathVariable("blindCode") String blindCode, Publish publish) throws Exception {
		
		System.out.println("/publish/json/updateBlindCode : GET");
		publish.setProdNo(prodNo);
		publish.setBlindCode(blindCode);
		
		publishService.updateBlindCode(publish);
		
		Map map = new HashMap();
		map.put("blindCode",blindCode);
		return map;
	}

}
