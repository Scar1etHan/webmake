package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.test.board.service.QABoardService;
import mvc.test.controller.domain.QABoardVO;

@Controller
@RequestMapping(value="/Board/*")
public class QABoardController {
	
	@Inject
	private QABoardService service;
	
	//	1. 문의 게시판 목록보기
	@RequestMapping(value="/QABoard", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		 List<QABoardVO> list = service.list();
		 
		 model.addAttribute("list", list);//${list}
		 
	}
	
	//	2. 문의 게시글 작성
	@RequestMapping(value="/QABoardwrite", method=RequestMethod.GET)
	public void getQAWrite() throws Exception {
		
	}
	
	@RequestMapping(value="/QABoardwrite", method=RequestMethod.POST)
	public String postQAWrite(QABoardVO vo) throws Exception{
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
	/*
	 * @RequestMapping(value="QABoarddelete", method = RequestMethod.GET) public
	 * void QAdelete(@RequestParam("bno") int bno, Model model) throws Exception{
	 * model.addAttribute("QAdelete", bno); }
	 */
	
	@RequestMapping(value="QABoarddelete", method = RequestMethod.GET)
	public String QAdelete(@RequestParam("bno") int bno) throws Exception{
		service.QAdelete(bno);
		return "redirect:/Board/QABoard";
	}
}
