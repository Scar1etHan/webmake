package mvc.test.member.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.test.member.dto.MemberVO;
import mvc.test.member.service.MemberService;

@Controller
@RequestMapping
public class MemberController {
	
	private Logger log = Logger.getLogger(getClass());	// 오류 체크용 
	
	@Inject
	MemberService memberService;
	
	
	//	1. 회원 목록
	@RequestMapping(value="Member/MemberList", method = RequestMethod.GET)
	public void memberList(Model model) throws Exception {
		List<MemberVO> list = memberService.memberList();
		System.out.println("멤버 리스트 : "+list);
		model.addAttribute("list",list);
	}
	
	//	2. 회원 등록 페이지 이동
	@RequestMapping(value="Member/Sign", method = RequestMethod.GET)
	public void memberWrite() throws Exception{
		
	}
	
	//	2. 회원 등록후 페이지 이동
	@RequestMapping(value="Member/insert", method = RequestMethod.POST)
	public String memberInsert(@ModelAttribute("vo") MemberVO mvo) throws Exception{
		memberService.insertMember(mvo);
		System.out.println("MemberVO 입력데이터 : "+mvo);
		
		
		return "redirect:/";		// /가 메인페이지 경로
	}
	
	//	3. 회원 정보 보기
	@RequestMapping(value="Member/MemberInfo", method = RequestMethod.GET)
	public void memberView(@RequestParam("user_id") String user_id, Model model) throws Exception{
		
		MemberVO vo = memberService.viewMember(user_id);
		System.out.println("회원정보보기 : "+vo);
		model.addAttribute("viewMember",vo);
	}
	
	
	// 4. 회원 정보 수정
	@RequestMapping(value="Member/MemberModiInfo", method = RequestMethod.GET)
	public void getmemberupdate(@RequestParam("user_id") String user_id, Model model) throws Exception{
	 
		MemberVO vo = memberService.viewMember(user_id);
	  model.addAttribute("updateMember", vo); //${updateMember}
	}
	 
	
	@RequestMapping(value="Member/MemberModiInfo", method = RequestMethod.POST)
	public String postmemberupdate(MemberVO vo) throws Exception{
		//System.out.println("postmemberupdate메서드 호출됨(vo)=>"+vo);
		memberService.updateMember(vo);
		return "redirect:/Member/MemberInfo?user_id="+vo.getUser_id();
	}
	
	//	5. 회원 정보 삭제
	@RequestMapping(value="Member/MemberDelete", method = RequestMethod.POST)
	public String postmemberdelete(@RequestParam("user_id") String user_id) throws Exception{
		memberService.deleteMember(user_id);
		return "redirect:/Member/MemberList";
	}
	
	// 6. 아이디 중복 확인
	@RequestMapping(value = "Member/checkUserId", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserId(@RequestParam("user_id") String user_id) {
	    try {
	        int count = memberService.checkUserId(user_id);

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
	
	//	7. 회원 아이디 찾기
	@RequestMapping(value = "Member/findId", method = RequestMethod.POST)
    @ResponseBody
    public String findID(@RequestParam("user_name") String user_name, @RequestParam("user_email") String user_email) throws Exception{
        String user_Id = memberService.findUserId(user_name, user_email);
        return user_Id;
    }
	
	//	8. 회원 비밀번호 찾기
	@RequestMapping(value = "Member/findPw", method = RequestMethod.POST)
	@ResponseBody
	public String findUserPw(@RequestParam("user_name") String user_name, @RequestParam("user_id") String user_id,
			@RequestParam("user_email") String user_email) throws Exception{
		String user_pw = memberService.findUserPw(user_name, user_email, user_id);
		return user_pw;
	}
	
	//	9. 회원 로그인
	@RequestMapping(value = "Member/login", method = RequestMethod.POST)
	public String loginUserSubmit(@ModelAttribute MemberVO member, HttpSession session, Model model, RedirectAttributes redirectAttributes)
			throws Exception{

	    MemberVO loginUser = memberService.checkLogin(member);
	    
	    System.out.println("로그인중인 유저 : "+loginUser);
	    if (loginUser != null) {
	        session.setAttribute("loginUser", loginUser);
	        return "redirect:/";
	    } else {
	        redirectAttributes.addFlashAttribute("msg_login_fail", "아이디 또는 비밀번호가 잘못되었습니다.");
	        return "redirect:/Member/login";
	    }
	}
	
	//	10. 회원 로그아웃
	@RequestMapping(value = "Member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/";
	}
	
}
