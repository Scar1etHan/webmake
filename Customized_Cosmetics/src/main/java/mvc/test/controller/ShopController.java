package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mvc.test.controller.domain.BuyVO;
import mvc.test.controller.domain.CartListVO;
import mvc.test.controller.domain.CartVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.ReplyListVO;
import mvc.test.controller.domain.ReplyVO;
import mvc.test.controller.domain.UserVO;
import mvc.test.product.service.ShopService;

@Controller
@RequestMapping("/Shop/*")
public class ShopController {

	 private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	 
	 @Inject
	 ShopService service;
	    
	// 상품 리스트
	   @RequestMapping(value="/ShopList", method=RequestMethod.GET)
	   public void getList(Model model) throws Exception {
	    logger.info("get list");
	    List<GoodsViewVO> list = service.list();
	  
	    model.addAttribute("list", list);
	}
		
	// 상품 조회
	   @RequestMapping(value = "/ItemShow", method = RequestMethod.GET)
	   public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		   logger.info("get view");
		   
		   GoodsViewVO view = service.goodsView(gdsNum);
		   model.addAttribute("view", view);
		   
			/* 
			 소감 조회 
			  List<ReplyListVO> reply = service.replyList(gdsNum);
			  model.addAttribute("reply",reply);
			 */
	   }
	    
		/*  상품 조회 - 소감(댓글) 작성
		 * @RequestMapping(value = "/ItemShow", method = RequestMethod.POST) public
		 * String registReply(ReplyVO reply, HttpSession session) throws Exception {
		 * logger.info("regist reply");
		 * 
		 * UserVO member = (UserVO)session.getAttribute("member");
		 * reply.setUserId(member.getUserId());
		 * 
		 * service.registReply(reply);
		 * 
		 * return "redirect:/Shop/ItemShow?n=" + reply.getGdsNum(); }
		 */
	   
	  // 상품 소감(댓글) 작성 POST
	   @ResponseBody
	   @RequestMapping(value = "/ItemShow/registReply", method = RequestMethod.POST)
	   public void registReply(ReplyVO reply, HttpSession session) throws Exception {
			 String userId = (String)session.getAttribute("userId");
			 
			 reply.setUserId(userId);
			 
		    service.registReply(reply); 
	   }
	   
	 // 상품 소감(댓글) 목록
	   @ResponseBody
	   @RequestMapping(value = "/ItemShow/replyList", method = RequestMethod.GET)
	   public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception{
		   logger.info("get reply List");
		   
		   List<ReplyListVO> reply = service.replyList(gdsNum);
		   
		   return reply; 
	   }  
	   
	   // 상품 소감(댓글) 삭제 POST
	   @ResponseBody
	   @RequestMapping(value = "/ItemShow/deleteReply", method = RequestMethod.POST)
	   	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception { 
		   logger.info("post delete reply");
		   
		   int result = 0;
		   
		   String userId = (String)session.getAttribute("userId");
			  
		   if(userId.equals(userId)) {
			   
			   reply.setUserId(userId);
			   service.deleteReply(reply);
			   
			   result = 1;
		   }
		   
		   return result; 
		  }
	   
	   //상품 소감(댓글) 수정
	   @ResponseBody
	   @RequestMapping(value = "/ItemShow/modifyReply", method = RequestMethod.POST)
	   public int modifyReply(ReplyVO reply, HttpSession session) throws Exception {
		   logger.info("modify reply");
		   
		   int result = 0;
		  
		   String userId = (String)session.getAttribute("userId");
		  
		   if(userId.equals(userId)) {
				
			   reply.setUserId(userId);
			   service.modifyReply(reply);
			   result = 1;
		   }
		   
			return result;	   		
			
	   }
	   
	 //즉시 구입
		@RequestMapping(value="/payment", method=RequestMethod.POST)
		@ResponseBody
	    public String postBuy(@RequestBody BuyVO vo) throws Exception {
			service.buy(vo);
			System.out.println(vo.getOrder_Total());
			return "redirect:/Shop/Shop";
			
			
	    }
	   
	   // 카트 담기
	   @ResponseBody
	   @RequestMapping(value = "/ItemShow/addCart", method = RequestMethod.POST)
	   public int addCart(CartVO cart, HttpSession session) throws Exception {
		   
		   int result = 0;
		   
		   String userId = (String)session.getAttribute("userId");
		   
		   if(userId != null) {
			   cart.setUserId(userId);
			   service.addCart(cart);
			   result = 1;
		   }
		   System.out.println(result);
		   return result;
	   }
	   
	   // 카트 목록
		/*
		 * @RequestMapping(value = "/ShopList/cartList", method = RequestMethod.GET)
		 * public void getCartList(HttpSession session, Model model) throws Exception {
		 * logger.info("get cart list");
		 * 
		 * UserVO member = (UserVO)session.getAttribute("member"); String userId =
		 * member.getUserId();
		 * 
		 * 
		 * List<CartListVO> cartList = service.cartList(userId);
		 * System.out.println("카트:"+cartList); model.addAttribute("cartList", cartList);
		 * }
		 */
	   // 카트 목록
	   @RequestMapping(value = "/ShopList/cartList", method = RequestMethod.GET)
	   public String getCartList(HttpSession session, Model model) throws Exception {
	      
		   logger.info("get cart list");
	       
		   String userId = (String)session.getAttribute("userId");
	       if(userId == null){
	           return "redirect:/Member/login"; 													
	           // 로그인 안되있으면 로그인으로 보낸다.
	       }
	      
	       List<CartListVO> cartList = service.cartList(userId);
	       System.out.println("카트:"+cartList);
	       model.addAttribute("cartList", cartList); 

	      return "Shop/cartList"; 
	   }

	// 카트 삭제
	   @ResponseBody
	   @RequestMapping(value = "/cartList/deleteCart", method = RequestMethod.POST)
	   public int deleteCart(HttpSession session,
	        @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
	    logger.info("delete cart");
	    
	    String userId = (String)session.getAttribute("userId");
	    
	    int result = 0;
	    int cartNum = 0;
	    
	    
	    if(userId != null) {
	     cart.setUserId(userId);
	    
	     for(String i : chArr) {   
	      cartNum = Integer.parseInt(i);
	      cart.setCartNum(cartNum);
	      service.deleteCart(cart);
	    
	     }   
	     result = 1;
	    }  
	    return result;
	   }
	
}
