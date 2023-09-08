package mvc.test.member.service;

import java.util.List;


import mvc.test.controller.domain.UserVO;
import mvc.test.member.dao.LoginDTO;

public interface UserService {
	
	// 회원 아이디 중복 체크
	public int checkUserId(String userId) throws Exception;
	
	// 회원 가입 처리
	void register(UserVO userVO) throws Exception;
	
	// 로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	// 아이디 찾기
	public List<UserVO> findId(String userName, String userEmail)throws Exception;
	
	public int findIdCheck(String userName, String userEmail)throws Exception;
	
	// 비밀번호 찾기
	public void findPw(String userEmail,String userId)throws Exception;

	public int findPwCheck(UserVO userVO)throws Exception;
	
	// 비밀번호 수정
	public String pwCheck(String userId)throws Exception;
	
	public void pwUpdate(String userId, String hashedPw)throws Exception;
	
	// 회원 목록
	public List<UserVO> userList() throws Exception;
	
	// 회원 정보 보기
	public UserVO viewMember(String userId) throws Exception;
	
	// 회원 정보 수정
	public void updateMember(UserVO vo) throws Exception;
	
	// 회원 삭제
	public void deleteMember(String userId) throws Exception;
	
	
}