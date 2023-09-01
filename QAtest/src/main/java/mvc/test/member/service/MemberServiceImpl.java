package mvc.test.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.member.dao.MemberDAOImpl;
import mvc.test.member.dto.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAOImpl memberdao;
	
	
	//	1. 회원 목록
	@Override
	public List<MemberVO> memberList() throws Exception{
		return memberdao.memberList();
	}

	//	2. 회원 등록
	@Override
	public void insertMember(MemberVO vo) throws Exception{
		memberdao.insertMember(vo);
	}
	
	//	3. 회원 정보 보기
	@Override
	public MemberVO viewMember(String user_id) throws Exception{
		return memberdao.viewMember(user_id);
	}
	
	//	4. 회원 정보 수정
	@Override
	public void updateMember(MemberVO vo) throws Exception{
		memberdao.updateMember(vo);
	}
	
	//	5. 회원 삭제
	@Override
	public void deleteMember(String user_id) throws Exception{
		memberdao.deleteMember(user_id);
	}

	//	6. 회원 아이디 중복체크
	@Override
	public int checkUserId(String user_id) throws Exception {
		return memberdao.checkUserId(user_id);
	}
	
	//	7. 회원 아이디 찾기
	@Override
	public String findUserId(String user_name, String user_email) throws Exception {
		return memberdao.findUserId(user_name, user_email);
	}
	
	//	8. 회원 비밀번호 찾기
	@Override
	public String findUserPw(String user_name, String user_email, String user_id) throws Exception {
		return memberdao.findUserPw(user_name, user_id, user_email);
	}
	
	//	9. 회원 로그인
	@Override
	public MemberVO  checkLogin(MemberVO vo) throws Exception {
		return memberdao.checkLogin(vo);
	}
}
