package mvc.test.member.dao;

import java.util.List;

import mvc.test.member.dto.MemberVO;

public interface MemberDAO {
	
	//	1. 회원 목록
	public List<MemberVO> memberList() throws Exception;

	//	2. 회원 등록
	public void insertMember(MemberVO vo) throws Exception;
	
	//	3. 회원 정보 보기
	public MemberVO viewMember(String user_id) throws Exception;
	
	//	4. 회원 정보 수정
	public void updateMember(MemberVO vo) throws Exception;
	
	//	5. 회원 삭제
	public void deleteMember(String user_id) throws Exception;
	
	//	6. 회원 아이디 중복체크
	public int checkUserId(String user_id) throws Exception;
	
	//	7. 회원 아이디 찾기
	public String findUserId(String user_name, String user_email) throws Exception;
	
	//	8. 회원 비밀번호 찾기
	public String findUserPw(String user_name, String user_email, String user_id) throws Exception;
	
	//	9. 회원 로그인
	public MemberVO checkLogin(MemberVO vo) throws Exception;
}
