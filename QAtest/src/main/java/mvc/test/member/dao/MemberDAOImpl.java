package mvc.test.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.member.dto.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "mvc.test.mappers.member";
	
	//	1. 회원 목록
	@Override
	public List<MemberVO> memberList() throws Exception{
		return sqlSession.selectList(namespace+".memberList"); 
	}
	
	//	2. 회원 등록
	@Override
	public void insertMember(MemberVO vo) throws Exception{
		sqlSession.insert(namespace+".insertmember",vo);
	}

	//	3. 회원 정보 보기
	@Override
	public MemberVO viewMember(String user_id) throws Exception{
		return sqlSession.selectOne(namespace+".viewmember", user_id);
	}

	//	4. 회원 정보 수정
	@Override
	public void updateMember(MemberVO vo) throws Exception{
		sqlSession.update(namespace+".updatemember", vo);
	}
	
	//	5. 회원 정보 삭제
	@Override
	public void deleteMember(String user_id) throws Exception{
		sqlSession.delete(namespace+".deletemember", user_id);
	}
	
	//	6. 회원 아이디 중복체크
	@Override
	public int checkUserId(String user_id) throws Exception {
		return sqlSession.selectOne(namespace+".checkUserId", user_id);
	}
	
	//	7. 회원 아이디 찾기
	@Override
	public String findUserId(String user_name, String user_email) throws Exception {
		Map<String, Object> params = new HashMap<>();
		params.put("user_name",user_name);
		params.put("user_email",user_email);
		
		return sqlSession.selectOne(namespace+".findUserId", params);
	}
	
	//	8. 회원 비밀번호 찾기
	@Override
	public String findUserPw(String user_name, String user_id, String user_email) throws Exception{
		return sqlSession.selectOne(namespace + ".findUserPw", createParamMap(user_name, user_id, user_email));
	}

	private Map<String, String> createParamMap(String user_name, String user_id, String user_email) {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("user_name", user_name);
		paramMap.put("user_id", user_id);
		paramMap.put("user_email", user_email);

		return paramMap;
	}
	
	//	9. 회원 로그인
	@Override
	public MemberVO  checkLogin(MemberVO vo) throws Exception {
		return sqlSession.selectOne(namespace+".checkLogin", vo);
	}
}
