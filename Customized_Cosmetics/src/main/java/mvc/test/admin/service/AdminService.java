package mvc.test.admin.service;

import java.util.List;

import mvc.test.controller.domain.AdminVO;
import mvc.test.controller.domain.CategoryVO;
import mvc.test.controller.domain.GoodsVO;
import mvc.test.controller.domain.GoodsViewVO;
import mvc.test.controller.domain.UserVO;

public interface AdminService {
	
	// 로그인
	public AdminVO login(AdminVO adminVO) throws Exception;

	// 회원 리스트
	public List<UserVO> userList(UserVO userVO) throws Exception;
	
	// 회원 삭제
	public void memberBan(String userId) throws Exception;
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsVO> goodslist() throws Exception;
	
	//상품조회 + 카테고리
	public GoodsViewVO regProductView(int gdsNum) throws Exception;
	
	//상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;
		
}
