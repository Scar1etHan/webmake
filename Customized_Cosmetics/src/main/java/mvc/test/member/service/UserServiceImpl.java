package mvc.test.member.service;

import java.util.List;

import javax.inject.Inject;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import mvc.mail.MailUtils;
import mvc.mail.TempKey;

import mvc.test.controller.domain.UserVO;
import mvc.test.member.dao.LoginDTO;
import mvc.test.member.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	private final UserDAO userDAO;
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	public UserServiceImpl(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	// 회원 아이디 중복체크
	@Override
	public int checkUserId(String userId) throws Exception {
		return userDAO.checkUserId(userId);
	}
		
	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		userDAO.register(userVO);
	 }
	
	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception{
		return userDAO.login(loginDTO);
	}
	
	// 아이디 찾기
	@Override
	public List<UserVO> findId(String userName,String userEmail)throws Exception{
		return userDAO.findId(userName,userEmail);
	}
	
	@Override
	public int findIdCheck(String userName,String userEmail)throws Exception{
		return userDAO.findIdCheck(userName,userEmail);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPwCheck(UserVO userVO)throws Exception{
		return userDAO.findPwCheck(userVO);
	}
    
    @Override
	public void findPw(String userEmail,String userId)throws Exception{
		String memberKey = new TempKey().getKey(6,false);
		String userPw = BCrypt.hashpw(memberKey,BCrypt.gensalt());
		userDAO.findPw(userEmail,userId,userPw);
		MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[Costomized Cosmetics 커뮤니티 임시 비밀번호 입니다.]"); //메일제목
			sendMail.setText(
				"<h1>임시비밀번호 발급</h1>" +
				"<br/>"+userId+"님 "+
				"<br/>비밀번호 찾기를 통한 임시 비밀번호입니다."+
				"<br/>임시비밀번호 :<h2>"+memberKey+"</h2>"+
				"<br/>로그인 후 비밀번호 변경을 해주세요."+
				"<a href='http://localhost:8080/Member/loginView"+
				">로그인 페이지</a>");
			sendMail.setFrom("CostomizedCosmetics@gmail.com", "C.C");
			sendMail.setTo(userEmail);
			sendMail.send();
	}
    	
    // 비밀번호 수정
    @Override
    public String pwCheck(String userId)throws Exception{
    	return userDAO.pwCheck(userId);
    }
    
    @Override
    public void pwUpdate(String userId, String hashedPw)throws Exception{
    	userDAO.pwUpdate(userId, hashedPw);
    }
    
    // 회원 목록
 	@Override
 	public List<UserVO> userList() throws Exception{
 		return userDAO.userList();
 	}
 	
    // 회원 정보 보기
	@Override
	public UserVO viewMember(String userId) throws Exception{
		return userDAO.viewMember(userId);
	}
	
	// 회원 정보 수정
	@Override
	public void updateMember(UserVO vo) throws Exception{
		userDAO.updateMember(vo);
	}
	
	// 회원 삭제
	@Override
	public void deleteMember(String userId) throws Exception{
		userDAO.deleteMember(userId);
	}

	
	
}
