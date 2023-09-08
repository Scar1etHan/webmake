package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.test.controller.domain.OrderDetailVO;
import mvc.test.controller.domain.OrderListVO;
import mvc.test.controller.domain.UserVO;
import mvc.test.member.dao.LoginDTO;
import mvc.test.member.service.UserService;
import mvc.test.product.service.OrderService;

@Controller
@RequestMapping("/Shop/*")
public class OrderController {

	private Logger log = Logger.getLogger(getClass());	// 오류 체크용

	private final UserService userService;
	@Inject
	OrderService orderService;
	
	@Inject
	public OrderController(UserService userService) {
		this.userService = userService;
	}

	// 0. 관리자가 보는 전체 주문 목록
	@RequestMapping(value="/Orderlist", method = RequestMethod.GET)
	public void totalList(Model model) throws Exception{
		List<OrderListVO> totallist = orderService.list();
		System.out.println("주문 목록 : "+totallist);
		model.addAttribute("totallist",totallist);
	}
	
	//	1. 주문 목록
	@RequestMapping(value="/Orderboard", method = RequestMethod.GET)
	public void list(LoginDTO loginDTO,Model model, HttpSession session) throws Exception{
		
		UserVO userVO = userService.login(loginDTO);
		String userId= userVO.getUserId();
		System.out.println("list메서드의 user_id값 출력=>"+userId);
		List<OrderListVO> list = orderService.orderList(userId);
		System.out.println("주문 목록 : "+list);
		model.addAttribute("list", list);
	}
	
	//	2. 주문 상세 목록
	@RequestMapping(value="/Order", method = RequestMethod.GET)
	public void orderdetail(@RequestParam("order_number") int order_number, Model model) throws Exception{
		
		List<OrderDetailVO> orderdetail = orderService.getOrderDetail(order_number);
		
		model.addAttribute("orderdetail", orderdetail);
	}
	
	//	3. 주문 변경 (배송상태) 버튼에서 바로 처리해서 따로 get으로 불러올 필요없음
	@RequestMapping(value="/OrderModify", method = RequestMethod.POST)
	public String postorderupdate(OrderListVO vo) throws Exception{
		
		orderService.updateOrder(vo);
		return "redirect:/Shop/Orderlist";
	}
}