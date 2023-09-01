package mvc.test.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.test.board.service.QABoardService;
import mvc.test.controller.domain.QABoardVO;
import mvc.test.member.dto.MemberVO;

@Controller
@RequestMapping(value="/Board/*")
public class QABoardController {
	
	//	 get은 단순 조회(데이터가 변하지않음)  post는 creat,update,delete할때 사용 (데이터가 변하는것)
	@Inject
	private QABoardService service;
	
	//	1. 문의 게시판 목록보기
	@RequestMapping(value="/QABoard", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		 List<QABoardVO> list = service.list();
		 
		 for(QABoardVO vo : list) {
			 int replyCount = service.QAreplycnt(vo.getBno());
			 vo.setReplycnt(replyCount);
		 }
		 
		 
		 model.addAttribute("list", list); //${list}
		 
	}
	
	//	2. 문의 게시글 작성
	@RequestMapping(value="/QABoardwrite", method=RequestMethod.GET)
	public void getQAWrite() throws Exception {
		
	}
	
	@RequestMapping(value="/QABoardwrite", method=RequestMethod.POST)
	public String postQAWrite(QABoardVO vo, HttpSession session) throws Exception{
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			vo.setUser_id(loginUser.getUser_id());
		}
		
		service.QAwrite(vo);
		return "redirect:/Board/QABoard";
	}
	
	//	3. 문의 게시글 조회
	@RequestMapping(value="/QABoardview", method = RequestMethod.GET)
	public void QAread(@RequestParam("bno") int bno, Model model) throws Exception{
		
		// 문의 게시글 조회수 증가
		service.QAviewCnt(bno);
		
		QABoardVO vo = service.QAread(bno);
		model.addAttribute("QAread",vo);
	}
	
	//	4. 문의 게시글 수정
	@RequestMapping(value="/QABoardrewrite", method = RequestMethod.GET)
	public void getQAupdate(@RequestParam("bno") int bno, Model model) throws Exception{
		QABoardVO vo = service.QAread(bno);
		model.addAttribute("QAupdate", vo);
	}
	
	@RequestMapping(value="/QABoardrewrite", method = RequestMethod.POST)
	public String postQAupdate(QABoardVO vo) throws Exception{
		service.QAupdate(vo);
		return "redirect:/Board/QABoard";
	}
	
	
	//	5. 문의 게시글 삭제
	@RequestMapping(value="QABoarddelete", method = RequestMethod.POST)
	public String QAdelete(@RequestParam("bno") int bno) throws Exception{
		service.QAdelete(bno);
		return "redirect:/Board/QABoard";
	}
	
	
}
