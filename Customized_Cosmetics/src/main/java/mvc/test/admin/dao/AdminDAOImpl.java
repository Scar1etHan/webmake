package mvc.test.admin.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.AdminVO;
import mvc.test.controller.domain.CategoryVO;
import mvc.test.controller.domain.GoodsVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.UserVO;



@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sql;
	
	// 매퍼
	private static String namespace = "mvc.test.mappers.adminMapper";
	
	// 로그인
	@Override
	public AdminVO login(AdminVO adminVO) throws Exception{
		return sql.selectOne(namespace+".adminLogin",adminVO);
	}
	
	// 회원목록
	@Override
	public List<UserVO> userList(UserVO userVO) throws Exception {
	    return sql.selectList(namespace + ".userList",userVO);
	}
	
	// 회원 정보 삭제
	@Override
	public void memberBan(String userId) throws Exception{
		sql.delete(namespace+".memberBan", userId);
	}
	
	
	//카테고리
		@Override
		public List<CategoryVO> category() throws Exception {
			// TODO Auto-generated method stub
			return sql.selectList(namespace + ".category") ;
		}
		
		//상품등록
		@Override
		public void register(GoodsVO vo) throws Exception{
			sql.insert(namespace + ".register", vo);
		}
		
		//상품목록
		@Override
		public List<GoodsVO> goodslist()	throws Exception{
			return sql.selectList(namespace + ".goodslist");
			}
		
		//상품 조회 + 카테고리 조인
		@Override
		public GoodsViewVO regProductView(int gdsNum) throws Exception {
			return sql.selectOne(namespace + ".goodsView", gdsNum);
		}

		// 상품 수정
		@Override
			public void goodsModify(GoodsVO vo) throws Exception {
			sql.update(namespace + ".goodsModify", vo);
		}
		
		// 상품 삭제
		@Override
		   public void goodsDelete(int gdsNum) throws Exception {
		   sql.delete(namespace + ".goodsDelete", gdsNum);
			
		}

}
