package mvc.test.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.controller.domain.BuyVO;
import mvc.test.controller.domain.CartListVO;
import mvc.test.controller.domain.CartVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.ReplyListVO;
import mvc.test.controller.domain.ReplyVO;
import mvc.test.product.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Inject
	private ShopDAO dao;
	
	//카테고리별 상품리스트
	@Override
	 public List<GoodsViewVO> list() throws Exception{
		return dao.list();		
	}
	
	// 상품 조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.goodsView(gdsNum);
	}
	
	// 상품 소감(댓글) 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		dao.registReply(reply);
	}
	
	// 상품 소감(댓글) 리스트
	@Override
	public List<ReplyListVO> replyList(int gdsNUm) throws Exception {
		return dao.replyList(gdsNUm);
	}
	
	//상품 소감(댓글) 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception {
		dao.deleteReply(reply);
	}
	
	// 아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception {
		return dao.idCheck(repNum);
	}
	
	// 상품 소감(댓글) 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception {
		dao.modifyReply(reply);	
	}
	
	// 상품 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	//카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
	
		return dao.cartList(userId);
	}
	
	// 카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		
		dao.deleteCart(cart);
	}
	//즉시 구입
	@Override
	public void buy(BuyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.buy(vo);
	}
}
