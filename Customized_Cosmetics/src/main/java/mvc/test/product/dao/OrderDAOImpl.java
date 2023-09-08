package mvc.test.product.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.OrderDetailVO;
import mvc.test.controller.domain.OrderListVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "mvc.test.mappers.order";
	
	//	0. 관리자가 보는 전체 주문 목록
	@Override
	public List<OrderListVO> list() throws Exception {
		return sqlSession.selectList(namespace+".totalorderlist");
	}
	
	//	1. 주문 목록
	@Override
	public List<OrderListVO> orderList(String userId) throws Exception {
		return sqlSession.selectList(namespace+".orderList",userId);
	}
	
	//	2. 주문 상세 내역
	@Override
	public List<OrderDetailVO> getOrderDetail(int order_number) throws Exception {
		return sqlSession.selectList(namespace+".getOrderDetail",order_number);
	}
	
	//	3. 주문 변경 (배송지)
	@Override
	public void updateOrder(OrderListVO vo) throws Exception {
		sqlSession.selectOne(namespace+".updateorder", vo);
	}
}
