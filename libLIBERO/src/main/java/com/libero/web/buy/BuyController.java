package com.libero.web.buy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.portlet.ModelAndView;

import com.libero.service.buy.BuyService;
import com.libero.service.domain.Buy;
import com.libero.service.domain.Cash;
import com.libero.service.domain.Pay;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;
import com.libero.service.domain.User;
import com.libero.service.product.ProductService;
import com.libero.service.user.UserService;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	// Field
	@Autowired
	@Qualifier("buyServiceImpl")
	private BuyService buyService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService prodService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	// Constructor
	public BuyController() {
		System.out.println(" ---------------------------------------");
		System.out.println("[ " + this.getClass() + " ]");
		System.out.println(" ---------------------------------------");
	}

	@RequestMapping(value = "getUserBuy", method = RequestMethod.GET)
	public String getUserBuy(@RequestParam("payNo") String payNo, HttpSession session, Model model) throws Exception {
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getUserBuy : GET");
		System.out.println(" ---------------------------------------");
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		// session 에서 userId를 받아오도록 수정
		// payNo는 리스트에서 조회할때 가져오는 걸로.

		Map<String, Object> map = buyService.getUserBuy(userId, payNo);
		//System.out.println("=========================\n\n\n"+map.get("payList")+"\n\n\n====================");
		
		

		System.out.println("=========================\n\n\n"+map.get("userProduct")+"\n\n\n====================");
		model.addAttribute("getProduct", map.get("userProduct"));
		//model.addAttribute("getPay", map.get("payList"));
		//model.addAttribute("getProductBuy",review);
		return "forward:/view/buy/getUserBuy.jsp";
	}

	// getCartList 로 대신 할 거.
	@RequestMapping(value = "beforePay", method = RequestMethod.GET)
	public String beforePay() throws Exception {
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/beforePay : GET");
		System.out.println(" ---------------------------------------");

		return "redirect:/view/buy/beforePay.jsp";//
	}

	@RequestMapping(value = "beforePay", method = RequestMethod.POST)
	public String beforePay(@RequestParam("buyNoList") String buyNoString, @RequestParam("actualPrice") int actualPrice,
			Model model) throws Exception {
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/beforePay : POST");
		System.out.println(" ---------------------------------------");
		/////////////

		///////////// 장바구니에서 받아온 buyNo 파싱, 배열에 넣기.
		System.out.println(buyNoString);
		buyNoString = buyNoString.replace("[", "");
		buyNoString = buyNoString.replace("]", "");
		buyNoString = buyNoString.replace(" ", "");
		List<Integer> prodNoArray = new ArrayList<Integer>();
		List<Product> product = new ArrayList<Product>();
		List<Integer> buyNoArray = new ArrayList<Integer>();
		String[] buyArr = buyNoString.split(",");

		///////////// buyNo -> prodNo 으로 바꾸기
		System.out.println("\n\n--\n" + buyArr + "\n--\n\n");

		for (int i = 0; i < buyArr.length; i++) {
			int buyNo = Integer.parseInt(buyArr[i]);
			buyNoArray.add(buyNo);
			prodNoArray.add(buyService.getBuyArray(buyNo));
			int prodNo = prodNoArray.get(i);
			Product prod = prodService.getProduct(prodNo);
			prod.setBuyAmount(buyService.getBuyAmount(buyNo));
			product.add(prod);
		}

		System.out.println("\n\n--\n" + prodNoArray + "\n--\n\n");
		System.out.println("\n\n--\n" + product + "\n--\n\n");

		///////////////////////////////// product 가져오는 part 끝

		///////////////////////////////// map에 넣는 부분
//		map.put("productList",product);
//		map2.put("user",user);
		model.addAttribute("productList", product);
		model.addAttribute("actualPrice", actualPrice);
		model.addAttribute("buyNoArray", buyNoArray);
		// model.addAttribute("user",map2.get("user"));

		return "forward:/view/buy/addPay.jsp";//
	}

	@RequestMapping(value = "addPay", method = RequestMethod.GET)
	public String addPay() throws Exception {
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/addPay : GET");
		System.out.println(" ---------------------------------------");

		
		
		 

		return "redirect:/buy/addBuyCheck.jsp";
	}

	@RequestMapping(value = "getUserBuyList", method = RequestMethod.GET)
	public String getUserBuyList(Model model, HttpSession session) throws Exception {
		// userId session으로 받아오기.
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getUserBuyList : GET");
		System.out.println(" ---------------------------------------");
		// 화면 연결후 밑 코드로 변경, param 삭제
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		Map<String, Object> map = buyService.getUserBuyList(userId);
		model.addAttribute("buyList", map.get("list"));
//		model.addAttribute("prodNo",map.get("prodNo"));
		return "forward:/view/buy/getUserBuyList.jsp";
	}

	// 인쇄소 메인
	@RequestMapping(value = "getFactoryBuyList", method = RequestMethod.GET)
	public String getFactoryBuyList(Model model) throws Exception {
		// factoryId session 으로 받아오기
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getFactoryBuyList : GET");
		System.out.println(" ---------------------------------------");

		Map<String, Object> map = buyService.getFactoryBuyList();

		model.addAttribute("factorylist", map.get("factorylist"));

		return "forward:/view/buy/getFactoryBuyList.jsp";
	}

	@RequestMapping(value = "getFactoryBuy", method = RequestMethod.GET)
	public String getFactoryBuy(@Param("payNo") String payNo, Model model) throws Exception {
		System.out.println(" ---------------------------------------");
		System.out.println("/buy/getFactoryBuy : GET");
		System.out.println(" ---------------------------------------");

		Map<String, Object> map = buyService.getFactoryBuy(payNo);

		model.addAttribute("payNo", payNo);

		model.addAttribute("product", map.get("product"));
		return "forward:/view/buy/getFactoryBuy.jsp";
	}

}// end of the BuyController
