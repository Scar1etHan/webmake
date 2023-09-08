package mvc.test.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final String NAMESPACE="mvc.test.mappers.UserMapper";
	private final SqlSession sqlSession;
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Inject
	public UserDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert(NAMESPACE+".register", userVO);
	}
	
	// 회원 아이디 중복체크
	@Override
	public int checkUserId(String userId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".checkUserId", userId);
	}

	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+ ".login",loginDTO);
	}
	
	// 아이디 찾기
	@Override
	public List<UserVO> findId(String userName, String userEmail) throws Exception{
	    HashMap<String, String> params = new HashMap<>();
	    params.put("userName", userName);
	    params.put("userEmail", userEmail);
	    return sqlSession.selectList(NAMESPACE + ".findId", params);
	}

	@Override
	public int findIdCheck(String userName, String userEmail) throws Exception{
	    HashMap<String, String> params = new HashMap<>();
	    params.put("userName", userName);
	    params.put("userEmail", userEmail);
	    return sqlSession.selectOne(NAMESPACE + ".findIdCheck", params);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPwCheck(UserVO userVO)throws Exception{
	return sqlSession.selectOne(NAMESPACE + ".findPwCheck", userVO);	
	}


	@Override
	public int findPw(String userEmail,String userId,String userPw)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userEmail", userEmail);
		map.put("userId", userId);
		map.put("userPw", userPw);
		return sqlSession.update(NAMESPACE + ".findPw", map);

	}

	// 비밀번호 수정
	@Override
	public String pwCheck(String userId)throws Exception{
		return sqlSession.selectOne(NAMESPACE + ".pwCheck", userId);
	}
	
	@Override
	public void pwUpdate(String userId, String hashedPw) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("userPw", hashedPw);
		sqlSession.update(NAMESPACE + ".pwUpdate", map);
		
	}
	// 회원 목록
	@Override
	public List<UserVO> userList() throws Exception {
	    List<UserVO> userList = sqlSession.selectList(NAMESPACE + ".userList");
	    logger.info("userList in DAOImpl: " + userList);
	    return userList;
	}
	
	// 회원 정보 보기
	@Override
	public UserVO viewMember(String userId) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".viewmember", userId);
	}

	// 회원 정보 수정
	@Override
	public void updateMember(UserVO vo) throws Exception{
		sqlSession.update(NAMESPACE+".updatemember", vo);
	}
	
	// 회원 정보 삭제
	@Override
	public void deleteMember(String userId) throws Exception{
		sqlSession.delete(NAMESPACE+".deleteMember", userId);
	}
	
}
