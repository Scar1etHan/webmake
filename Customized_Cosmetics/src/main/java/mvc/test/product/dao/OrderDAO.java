package mvc.test.product.dao;

import java.util.List;

import mvc.test.controller.domain.OrderDetailVO;
import mvc.test.controller.domain.OrderListVO;

public interface OrderDAO {
	
	//	0. 관리자가 보는 전체 주문 목록
	public List<OrderListVO> list() throws Exception;
	
	//	1. 주문 목록
	public List<OrderListVO> orderList(String userId) throws Exception;
	
	//	2. 주문 상세 내역
	public List<OrderDetailVO> getOrderDetail(int order_number) throws Exception;
	
	//	3. 주문 변경 (배송지)
	public void updateOrder(OrderListVO vo) throws Exception;
}
