package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import mvc.test.controller.domain.UserVO;
import mvc.test.member.dao.LoginDTO;
import mvc.test.member.service.UserService;

@Controller
@RequestMapping("/Member/*")

public class UserController {
	
	private final UserService userService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@Inject
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	// 약관동의
	@RequestMapping(value = "/Signcheck", method = RequestMethod.GET)
	public String Signcheck() {
		
		return "Member/Signcheck";
	}
	// 회원가입 페이지
	@RequestMapping(value="Sign", method = RequestMethod.GET)
	public String registerGET() throws Exception{
		return "/Member/Sign";
	}
	
	// 회원가입 처리
	@RequestMapping(value = "Sign", method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes)throws Exception{
		String hashePw = BCrypt.hashpw(userVO.getUserPw(), BCrypt.gensalt());
		userVO.setUserPw(hashePw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg","회원가입이 완료되었습니다");
		
		return "redirect:/Member/login";
	}
	
	// 아이디 중복 확인
		@RequestMapping(value = "Member/checkUserId", method = RequestMethod.POST)
		@ResponseBody
		public String checkUserId(@RequestParam("userId") String userId) {
		    try {
		        int count = userService.checkUserId(userId);

		        if (count == 0) {
		            return "available";
		        } else {
		            return "duplicated";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return "error";
		    }
		}
		
		// 로그인 페이지
		@RequestMapping(value="login", method = RequestMethod.GET)
		public String loginGET(@ModelAttribute("loginDTO")LoginDTO loginDTO) {
			return "/Member/login";
		}
		
		// 로그인 처리
		@RequestMapping(value= "loginPost", method = RequestMethod.POST)
		public ModelAndView loginPOST(LoginDTO loginDTO, HttpSession httpSession) throws Exception{
			UserVO userVO = userService.login(loginDTO);
			ModelAndView mav = new ModelAndView();
			
			if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) { // 비밀번호 암호화
				return mav;
			}else {
			httpSession.setAttribute("userId", userVO.getUserId());
			httpSession.setAttribute("userName", userVO.getUserName());
			//model.addAttribute("user",userVO);
			mav.addObject("user", userVO);
			return mav;
			}
		}
		
		// 로그아웃 처리
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logout(HttpServletRequest request,
							 HttpServletResponse response,
							 HttpSession httpSession) throws Exception{
			
			Object object = httpSession.getAttribute("login");
			if(object != null) {
				UserVO userVO = (UserVO)object;
				httpSession.removeAttribute("login");
				httpSession.invalidate();
				Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
				if(loginCookie != null) {
					loginCookie.setPath("/");
					loginCookie.setMaxAge(0);
					response.addCookie(loginCookie);
					/* userService.keepLogin(userVO.getUserId(), "none", new Date()); */
				}
				
			}
			return "Member/logout";
		}
		
		// 아이디 찾기
		@RequestMapping(value="/FindID", method=RequestMethod.GET)
		public String findIdView() throws Exception{
			return"/Member/FindID";
		}
		
		@RequestMapping(value="/FindIDResult", method=RequestMethod.POST)
		public String findId(UserVO userVO,Model model) throws Exception{
			// logger.info("userEmail->"+userVO.getUserEmail()+" userName-> " + userVO.getUserName() + userService.findIdCheck(userVO.getUserName(),userVO.getUserEmail()));
			
			if(userService.findIdCheck(userVO.getUserName(),userVO.getUserEmail()) != 0) {
				model.addAttribute("user", userService.findId(userVO.getUserName(),userVO.getUserEmail()));
				return "/Member/FindIDResult";
			}else {
				model.addAttribute("msg", "다시 확인해주세요");
				return "/Member/FindID";
			}
		}
		
		// 비밀번호 찾기
		@RequestMapping(value="/FindPassword" , method=RequestMethod.GET)
		public String findPwView() throws Exception{
			return"/Member/FindPassword";
		}
			
		@RequestMapping(value="/FindPassword", method=RequestMethod.POST)
		public String findPw(UserVO userVO,Model model) throws Exception{
			logger.info("userId="+userVO.getUserId());
			
			if(userService.findPwCheck(userVO)==0) {
				logger.info("userPWCheck");
				model.addAttribute("msg", "아이디와 이메일를 확인해주세요");
				return "/Member/FindPassword";
			}else {
		
			userService.findPw(userVO.getUserEmail(),userVO.getUserId());
			model.addAttribute("user", userVO.getUserEmail());
			
			return"/Member/FindPwResult";
			}
		}
		// 비밀번호 수정
		@RequestMapping(value="/updatePw", method=RequestMethod.GET)
		public String pwUpdateView() throws Exception{
			return "/Member/updatePw";
		}

		@RequestMapping(value="/pwCheck", method=RequestMethod.POST)
		@ResponseBody
		public int pwCheck(UserVO userVO) throws Exception {
			logger.info(userVO.getUserPw());
			logger.info(userVO.getUserId());
		    if (userVO == null || userVO.getUserPw() == null || userVO.getUserPw().length() == 0) { 
		        // userPw가 null이거나 빈 문자열인 경우 전송되는 값
		        return -1;
		    }
		    String memberPw = userService.pwCheck(userVO.getUserId());
		    if (memberPw == null || !BCrypt.checkpw(userVO.getUserPw(), memberPw)) { 
			    // userPw 값을 사용하여 비밀번호 검증 시도
			    return 0;
			}
		    
		    // 인증 성공
		    return 1;
		}
		@RequestMapping(value="/pwUpdate" , method=RequestMethod.POST)
		public String pwUpdate(String userId, String userPw1, RedirectAttributes rttr, HttpSession session) throws Exception{
		    String hashedPw = BCrypt.hashpw(userPw1, BCrypt.gensalt());
		    userService.pwUpdate(userId, hashedPw);
		    
		    // 로그아웃 처리
		    session.invalidate();
		    rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
		    
		    return "redirect:/Member/login";
		}
 
		// 회원 목록
		@RequestMapping(value="/MemberList", method = RequestMethod.GET)
		public void memberList(Model model) throws Exception {
			List<UserVO> list = userService.userList();
			logger.info("userList : " + userService.userList());
			model.addAttribute("list",list);
		}
		
		// 회원 정보 보기
		@RequestMapping(value="MemberInfo", method = RequestMethod.GET)
		public void memberView(@RequestParam(value="userId") String userId, Model model) throws Exception{
			
			UserVO vo = userService.viewMember(userId);
			System.out.println("회원정보보기 : "+vo);
			model.addAttribute("viewMember",vo);
		}
		
		
		// 회원 정보 수정
		@RequestMapping(value="MemberModiInfo", method = RequestMethod.GET)
		public void getmemberupdate(@RequestParam(value="userId") String userId, Model model) throws Exception{
			logger.info("userList : " + userService.viewMember(userId));
			UserVO vo = userService.viewMember(userId);
			model.addAttribute("updateMember", vo); //${updateMember}
		}
		 
		
		@RequestMapping(value="MemberModiInfo", method = RequestMethod.POST)
		public String postmemberupdate(UserVO vo) throws Exception{
			//System.out.println("postmemberupdate메서드 호출됨(vo)=>"+vo);
			userService.updateMember(vo);
			return "redirect:/Member/MemberInfo?userId="+vo.getUserId();
		}
		
		// 회원 탈퇴 get
		@RequestMapping(value="/MemberDelete", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "Member/MemberDelete";
		}
		
		// 회원 틸퇴 POST
		@RequestMapping(value="MemberDelete",method = RequestMethod.POST)
		public String deleteMember(String userId,HttpSession session, RedirectAttributes rttr)throws Exception{
			
			userService.deleteMember(userId);
			
			session.invalidate();
			rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
			
			return "redirect:/Member/login";
			
		}
		
		@RequestMapping(value="/pwCheck1",method=RequestMethod.POST)
		@ResponseBody
		public int pwCheck1(UserVO userVO)throws Exception{
			String userPw = userService.pwCheck(userVO.getUserId());
			
			if(userVO == null || !BCrypt.checkpw(userVO.getUserPw(), userPw)) {
				return 0;
			}
			return 1;
		}
		
}
