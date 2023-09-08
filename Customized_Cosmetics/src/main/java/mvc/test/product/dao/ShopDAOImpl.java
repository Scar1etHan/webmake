
  package mvc.test.product.dao;
  
  import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import
  org.springframework.stereotype.Repository;

import mvc.test.controller.domain.BuyVO;
import mvc.test.controller.domain.CartListVO;
import mvc.test.controller.domain.CartVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.ReplyListVO;
import mvc.test.controller.domain.ReplyVO;
  
  @Repository 
  public class ShopDAOImpl implements ShopDAO {
  
  @Inject private SqlSession sql;
  
  private static String namespace = "mvc.test.mappers.shopMapper";
  private static String namespace2 = "mvc.test.mappers.buy";
  
  //카테고리별 상품 리스트 
  @Override 
  public List<GoodsViewVO> list() throws Exception{
	  return sql.selectList(namespace + ".list");
  	}
 
  // 상품조회
  @Override 
  public GoodsViewVO goodsView(int gdsNum) throws Exception{
	 return sql.selectOne("mvc.test.mappers.shopMapper" + ".goodsView", gdsNum);  
  	}
  
  // 상품 소감(댓글) 작성
  @Override
	public void registReply(ReplyVO reply) throws Exception {
		sql.insert(namespace + ".registReply", reply);
	}
  
  //상품 소감(댓글) 리스트
  @Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception {
		
		return sql.selectList(namespace + ".replyList", gdsNum) ;	
	}
  
  // 상품 소감(댓글) 삭제
  @Override
	public void deleteReply(ReplyVO reply) throws Exception {
		sql.delete(namespace + ".deleteReply", reply);
	}
  
  // 아이디 체크
  @Override
	public String idCheck(int repNum) throws Exception {		
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
  
  // 상품 소감(댓글) 수정
  @Override
	public void modifyReply(ReplyVO reply) throws Exception {
		sql.update(namespace + ".modifyReply", reply);
	}
  
  // 카트 담기
  @Override
	public void addCart(CartVO cart) throws Exception {
	  sql.insert(namespace + ".addCart", cart);
	}
  
  // 카트 리스트
  @Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}
  
  // 카트 삭제
  @Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
		
	}
	//즉시 구입
	@Override
	public void buy(BuyVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace2 + ".buy", vo);
		
	}
  }
 