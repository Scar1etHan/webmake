package mvc.test.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.admin.dao.AdminDAO;
import mvc.test.controller.domain.AdminVO;
import mvc.test.controller.domain.CategoryVO;
import mvc.test.controller.domain.GoodsVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.UserVO;
import mvc.test.member.dao.UserDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	// 로그인
	public AdminVO login(AdminVO adminVO)throws Exception{
		return dao.login(adminVO);
	}
	
	// 회원목록
	@Override
 	public List<UserVO> userList(UserVO userVO) throws Exception{
 		return dao.userList(userVO);
 	}
	
	// 회원 삭제
	@Override
	public void memberBan(String userId) throws Exception{
		dao.memberBan(userId);
	}
	
	//카테고리
		@Override
		public List<CategoryVO> category() throws Exception {
			return dao.category();
		}

		// 상품등록
		@Override
		public void register(GoodsVO vo) throws Exception {
			dao.register(vo);
		}	
		
		// 상품목록
		@Override
		public List<GoodsVO> goodslist() throws Exception {
			System.out.println("서비스");
			return dao.goodslist();
		}
		
		//상품조회 + 카테고리 조인
		@Override
		public GoodsViewVO regProductView(int gdsNum) throws Exception {
			// TODO Auto-generated method stub
			return dao.regProductView(gdsNum);
		}
		
		// 상품 수정
		@Override
		public void goodsModify(GoodsVO vo) throws Exception {
			dao.goodsModify(vo);
		}
		
		//상품 수정 삭제
		@Override
		public void goodsDelete(int gdsNum) throws Exception {
			dao.goodsDelete(gdsNum);
		}
}
