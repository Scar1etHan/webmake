package mvc.test.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.controller.domain.OrderDetailVO;
import mvc.test.controller.domain.OrderListVO;
import mvc.test.product.dao.OrderDAOImpl;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAOImpl orderdao;
	
	//	0. 관지라가 보는 전체 주문 목록
	@Override
	public List<OrderListVO> list() throws Exception {
		return orderdao.list();
	}
	//	1. 주문 목록
	@Override
	public List<OrderListVO> orderList(String userId) throws Exception {
		return orderdao.orderList(userId);
	}
	
	//	2. 주문 상세 내역
	@Override
	public List<OrderDetailVO> getOrderDetail(int order_number) throws Exception { 
		return orderdao.getOrderDetail(order_number);
	}
	
	//	3. 주문 변경 (배송지)
	@Override
	public void updateOrder(OrderListVO vo) throws Exception {
		orderdao.updateOrder(vo);
	}
}
