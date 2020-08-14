package com.libero.web.buy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;
import com.libero.service.user.UserService;

@RestController
@RequestMapping("/buy/*")
public class BuyRestController {

	//field
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	public BuyRestController() {
		
		System.out.println(" ---------------------------------------");
		System.out.println("[ "+this.getClass()+" ]");
		System.out.println(" ---------------------------------------");
	}
	

	
	@RequestMapping(value = "json/afterPay", method = RequestMethod.POST)
	public String afterPay(@RequestBody Pay pay) throws Exception {
		System.out.println("------------------------");
		System.out.println("\n\n\n [RESTController :  afterPay]\n\n\n");
		System.out.println("------------------------");
		
		System.out.println("\n\n\n==========");
		System.out.println(pay.getBuyNoArray());
		pay = buyService.addBuy(pay);
		
		for(String stringBuyNo : pay.getBuyNoArray()) {
			int numericBuyNo = Integer.parseInt(stringBuyNo);
			buyService.updateBuyStatus(numericBuyNo,pay.getPayNo());
		}
		
		System.out.println("==========\n\n\n");
		
		 List<Product>listAuthor = buyService.listProdAuthor(pay.getPayNo());
		  
		  for(int i=0; i<listAuthor.size(); i++) {
			  Cash cash = new Cash();
			 // System.out.println(userService.getCash(listAuthor.get(i).getCreator()));
			  cash = userService.getCash(listAuthor.get(i).getCreator());
		  
		  if(cash == null) {
			  cash = new Cash();
			  
			  cash.setUserId(listAuthor.get(i).getCreator());
			  cash.setCashCurrent((int)(listAuthor.get(i).getRetailPrice()*0.7-listAuthor.get(i).getPrintPrice()));
			  cash.setBuyNo(listAuthor.get(i).getBuyNo());
			  buyService.addCash(cash);
		  }else{
			  cash.setCashCurrent((int)(cash.getCashCurrent()+listAuthor.get(i).getRetailPrice()*0.7-listAuthor.get(i).getPrintPrice()));
			  cash.setBuyNo(listAuthor.get(i).getBuyNo());
			  buyService.addCash(cash);
		  	}
		  }
	
		
		return	 "redirect:/";
		
		
	}	
	
	
	@RequestMapping(value="json/updateDeliveryStatus/{payNo}/{deliveryStatus}",method=RequestMethod.GET)
	public Map updateDeliveryStatus(@PathVariable("payNo") String payNo, 
										@PathVariable("deliveryStatus") int deliveryStatus) throws Exception{
		System.out.println("------------------------");
		System.out.println(" [RESTController :  updateDeliveryStatus]");
		System.out.println("------------------------");
		int result = 0;
		
		if(deliveryStatus == 1) {
			result = buyService.updateDeliveryStatus(payNo,2);	
		}else if(deliveryStatus ==2) {
			result = buyService.updateDeliveryStatus(payNo, 3);
		}else if(deliveryStatus ==3) {
			result = buyService.updateDeliveryStatus(payNo, 4);
		}else if(deliveryStatus ==4) {
			result = buyService.updateDeliveryStatus(payNo, 5);
		}
		
		Map map = new HashMap();
		map.put("result", result);
		return map;
	}
	
	
	
	
}
