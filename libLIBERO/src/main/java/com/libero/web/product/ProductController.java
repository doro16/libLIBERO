package com.libero.web.product;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.libero.common.Page;
import com.libero.common.Search;
import com.libero.service.cart.CartService;
import com.libero.service.domain.Product;
import com.libero.service.domain.Review;
import com.libero.service.domain.User;
import com.libero.service.product.ProductService;
import com.libero.service.wish.WishService;

@Controller
@RequestMapping("/product/*")
public class ProductController{
	
	//Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("wishServiceImpl")
	private WishService wishService;
	
	@Autowired
	@Qualifier("cartServiceImpl")
	private CartService cartService;
	
	//Constructor
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pdPageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pdPageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['path']}")
	String path;
	
	//method 서점메인화면 출력
	@RequestMapping(value="getBookList", method = RequestMethod.GET)
	public ModelAndView getBookList() throws Exception {
		
			System.out.println("/product/getBookList : GET");
			
			Search search = new Search();
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			//BusinessLogic
			int totalCount = productService.getBookTotalCount();
			
			Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
			int maxPage = (totalCount - 11)/pageSize + 2; //처음페이지 10개 출력, 이후 5개 출력에 따른 최대페이지 수
			//resultPage.setPageSize(maxPage); 이거 아닌거같은데
			
			ModelAndView modelAndView = new ModelAndView();

			
			List<Product> list=productService.getBookList(search);
			
			search.setCurrentPage(2); //5개 더보기 할때 오프셋 10부터 시작하기 위함. 첫페이지가 10개 출력했음으로인해
			modelAndView.addObject("search", search);
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("totalCount", totalCount);
			modelAndView.addObject("maxPage", maxPage);

			modelAndView.addObject("book", list);
			modelAndView.setViewName("forward:/view/product/getBookList.jsp");
			
			return modelAndView;
	}
	 ///* 카테고리별 서점화면 출력
	 @RequestMapping(value="getBookListByCategory/{bookCategory}", method = RequestMethod.GET)
	 public ModelAndView getBookListByCategory(@PathVariable String bookCategory) throws Exception {
		 		
		 System.out.println("카테고리 : "+bookCategory);
		 
			Search search = new Search();
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
		 		
		 String category = null;
			if(bookCategory.equals("edu")) {
		 		category = "교육";
		 	}else if(bookCategory.equals("novel")) {
		 		category = "소설";
		 	}else if(bookCategory.equals("non")) {
		 		category = "비문학";	
		 	}else if(bookCategory.equals("poetry")) {
		 		category = "시";
		 	}else if(bookCategory.equals("essay")) {
		 		category = "수필";
		 	}
		 	
		 	System.out.println("카테고리 :: "+category);
		 	//BusinessLogic
		 	System.out.println("/product/getBookListByCategory : GET, pathVariable : "+category);
		 	
		 	int totalCount = productService.getBookTotalCount(category);
			
			Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
			int maxPage = (totalCount - 11)/pageSize + 2; //처음페이지 10개 출력, 이후 5개 출력에 따른 최대페이지 수
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			modelAndView.addObject("totalCount", totalCount);
			modelAndView.addObject("maxPage", maxPage);
		 	
		 	List<Product> list=productService.getBookListByCategory(category, search);
		 	System.out.println("컨트롤러 가져온것 :: "+list);
		 	
		 	//List<Product> product = (List<Product>) map.get("list");
		 	//product[0].get()
		 	//System.out.println(product.get(index).getBookCateogry);
		 	search.setCurrentPage(2); //5개 더보기 할때 오프셋 10부터 시작하기 위함. 첫페이지가 10개 출력했음으로인해
		 	modelAndView.addObject("book", list);
		 	modelAndView.addObject("path", path);
		 	modelAndView.setViewName("forward:/view/product/getBookListByCategory.jsp");
		 	
		 	return modelAndView;
		 	
	 }
	//검색결과
	 @RequestMapping(value="getBookListBySearch", method = RequestMethod.GET)
	 public ModelAndView getBookListBySearch(@RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword) throws Exception {
		 		
		 Search search = new Search();
			if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			search.setSearchCondition(searchCondition);
			search.setSearchKeyword(searchKeyword);
		
			int totalCount = productService.getBookTotalCountBySearch(search);
			
			Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			modelAndView.addObject("totalCount", totalCount);
		 	
		 	List<Product> list=productService.getBookListBySearch(search);
		 	System.out.println("컨트롤러 가져온것 :: "+list);
		 	

		 	modelAndView.addObject("book", list);
		
		 	modelAndView.setViewName("forward:/view/product/getBookListBySearch.jsp");
		 	
		 	return modelAndView;
		 	
	 }
	 
	//method 서비스상품화면 출력
		@RequestMapping(value="getProductList/{prodType}", method = RequestMethod.GET)
		public ModelAndView getProductList(@PathVariable String prodType, Search search) throws Exception {
			
				ModelAndView modelAndView = new ModelAndView();
			
				System.out.println("/product/getProductList : GET"+search.getCurrentPage());
				
				if(search.getCurrentPage() == 0) {
									search.setCurrentPage(1);
				}
				search.setPageSize(pageSize);
				
				//BusinessLogic
				List<Product> product = productService.getProductList(prodType, search);
				
				int totalCount = productService.getProductTotalCount(prodType);
				Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
				int maxPage = (totalCount - 11)/pageSize + 2; //처음페이지 10개 출력, 이후 5개 출력에 따른 최대페이지 수
				resultPage.setPageSize(maxPage);
				
				modelAndView.addObject("product", product);
				modelAndView.addObject("resultPage", resultPage);
				modelAndView.addObject("search", search);
				modelAndView.addObject("totalCount", totalCount);
				
				modelAndView.setViewName("forward:/view/product/getProductList.jsp");
				
				return modelAndView;
		}
		
		//작가 서비스 검색결과
		 @RequestMapping(value="getProductListBySearch", method = RequestMethod.GET)
		 public ModelAndView getProductListBySearch(@RequestParam("prodType") String prodType, @RequestParam("searchCondition") String searchCondition, @RequestParam("searchKeyword") String searchKeyword) throws Exception {
			 System.out.println("Controller : getProductListBySearch");
			 System.out.println("prodType은 "+prodType );
			 Search search = new Search();
				if(search.getCurrentPage() == 0) {
					search.setCurrentPage(1);
				}
				search.setPageSize(pageSize);
				search.setSearchCondition(searchCondition);
				search.setSearchKeyword(searchKeyword);
			
				int totalCount = productService.getProductTotalCountBySearch(search, prodType);
				
				Page resultPage = new Page(search.getCurrentPage(), totalCount, pageUnit, pageSize);
				
				ModelAndView modelAndView = new ModelAndView();
				modelAndView.addObject("resultPage", resultPage);
				modelAndView.addObject("search", search);
				modelAndView.addObject("totalCount", totalCount);
				//modelAndView.addObject("prodType", prodType);
			 	
			 	List<Product> list=productService.getProductListBySearch(search, prodType);
			 	System.out.println("컨트롤러 가져온것 :: "+list);
			 	
			 	modelAndView.addObject("product", list);
			
			 	modelAndView.setViewName("forward:/view/product/getProductListBySearch.jsp");
			 	
			 	return modelAndView;
			 	
		 }
		
				//method 서비스상품화면 출력
				@RequestMapping(value="getProduct/{prodNo}", method = RequestMethod.GET)
				public ModelAndView getProduct(HttpSession session, @PathVariable int prodNo) throws Exception {
					System.out.println("/product/getProduct : GET");	
					
					String userId ="";
						//prodNo에 해당하는 도서정보 model에
						Product product=productService.getProduct(prodNo);
						
						ModelAndView modelAndView = new ModelAndView();
						
						modelAndView.addObject("product", product);
						
						
					if(session.getAttribute("user") != null) {
						User user = (User)session.getAttribute("user");
						
						userId = user.getUserId();
						
						HashMap <String, Object> hashMap = new HashMap<String, Object>();
						
						hashMap.put("prodNo", prodNo);
						hashMap.put("userId", userId);
						
						if(wishService.checkWish(hashMap) == true) {					
							modelAndView.addObject("wish", 0);
						}else {
							modelAndView.addObject("wish", 1);
						}
						
						if(productService.getCartState(hashMap) == null) {	//수린			
							modelAndView.addObject("cart", 0);
						}else {
							modelAndView.addObject("cart", 1);
						}

					}else{
						   modelAndView.addObject("wish", 0);
						   modelAndView.addObject("cart", 0);
					}
					
						
						//상품타입에 따른 출력페이지
						System.out.println("상품타입은?"+product.getProdType());
						if((product.getProdType()).equals("paper")  ||  (product.getProdType()).equals("ebook")) {
							modelAndView.setViewName("forward:/view/product/getBook.jsp");
						}else {
							modelAndView.setViewName("forward:/view/product/getProduct.jsp");
						}
						
						
						//리뷰 데이터
						
						HashMap reviewMap = new HashMap();
						reviewMap.put("currentPage", 1);
						reviewMap.put("pageSize", 3);
						reviewMap.put("prodNo", prodNo);
						
						List<Review> review = productService.getReview(reviewMap);
						int reviewCount = productService.getReviewCount(prodNo);
						List<String> reviewCut = new ArrayList<String>();
						
						for(int i = 0 ; i<review.size() ; i++) {
							//String reviewContentCut = (review.get(i).getReviewContent()).substring(0, 15);
							//System.out.println(reviewContentCut);
							//reviewCut.add(reviewContentCut);
							//reviewCut.add(i, reviewContentCut);
						}
						
						modelAndView.addObject("review", review);
						modelAndView.addObject("reviewCount", reviewCount);
						//modelAndView.addObject("reviewCut", reviewCut);
				
						
						return modelAndView;
				}
				
				//method 위시리스트 출력
				@RequestMapping(value="getWishList", method = RequestMethod.GET)
				public ModelAndView getWishList(HttpSession session) throws Exception {
					
						System.out.println("/product/getWishList : GET");
						
						User user = (User)session.getAttribute("user");
						String userId = user.getUserId();
						
						HashMap <String, Object> hashMap = new HashMap<String, Object>();
						hashMap.put("userId", userId);
						
						//BusinessLogic
						List<Product> wishList =wishService.getWishList(userId);
						ModelAndView modelAndView = new ModelAndView();
						modelAndView.addObject("wishList", wishList);
						modelAndView.addObject("userId", userId);
						
						modelAndView.setViewName("forward:/view/product/getWishList.jsp");
						
						return modelAndView;
				}
				
				//장바구니 리스트
				@RequestMapping(value="getCartList", method = RequestMethod.GET)
				public ModelAndView getCartList(HttpSession session) throws Exception {
					
						System.out.println("/product/getCartList : GET");
						
						User user = (User)session.getAttribute("user");
						String userId = user.getUserId();
						
						//HashMap <String, Object> hashMap = new HashMap<String, Object>();
						//hashMap.put("userId", userId);
						
						//BusinessLogic
						List<Product> cartList =cartService.getCartList(userId);
						System.out.println(cartList);
						System.out.println(cartList.size());
						List<Integer> buyNoList = new ArrayList<Integer>();
						System.out.println(buyNoList);
						
						
						for(int i=0 ; i<cartList.size() ; i++) {
							Product product = cartList.get(i);
							int buyNo = product.getBuyNo();
							buyNoList.add(buyNo);
							System.out.println(buyNoList);	
						}
					
							
						ModelAndView modelAndView = new ModelAndView();
						modelAndView.addObject("cartList", cartList);
						modelAndView.addObject("userId", userId);
						modelAndView.addObject("buyNoList", buyNoList);
						
						modelAndView.setViewName("forward:/view/product/getCartList.jsp");
						
						return modelAndView;
				}
				
			/*	
				@RequestMapping(value="getReviewList/{prodNo}", method = RequestMethod.GET)
				public ModelAndView getReviewList(@PathVariable int prodNo) throws Exception {
					
				}
			*/	
				
				//"/libero/product/CartTest"
				
				//장바구니 리스트
				@RequestMapping(value="cartTest", method = {RequestMethod.POST, RequestMethod.GET})
				public void getCartTest(@RequestParam("actualPrice") int actualPrice, @RequestParam("buyNoList") List buyNoList ) throws Exception {
					
						System.out.println("/product/getCartTest : POST");
						System.out.println("실제가격 :" + actualPrice);
						System.out.println("카트리스트 :" + buyNoList );
						System.out.println("buyNo"+buyNoList.indexOf(1));
						System.out.println("buyNo"+buyNoList.get(1));
						
						

						
				
				}
	
}//end class
