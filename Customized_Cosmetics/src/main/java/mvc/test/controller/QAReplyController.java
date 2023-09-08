package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.test.board.service.QAReplyService;
import mvc.test.controller.domain.QAReplyVO;

@Controller
@RequestMapping("/reply/")
public class QAReplyController {

	@Inject
	QAReplyService replyservice;

	//	1. 댓글 목록 (ModelAndView 방식) 이거는 프론트 못고치겠어서 ajax로 바꿈
//	@RequestMapping(value="list", method = RequestMethod.GET)
//	public ModelAndView list(@RequestParam int bno, ModelAndView mav) throws Exception {
//		System.out.println("ReplyController의 bno=>"+bno);
//		List<ReplyVO> replylist = replyservice.list(bno);
//		System.out.println("ReplyController의 list=>"+replylist);
//		mav.setViewName("Board/QABoardview"); //Board/QABoardview
//		mav.addObject("replylist",replylist);
//		return mav;
//	}
	
	//	1. 댓글 목록(ajax방식)
	@RequestMapping(value="list", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<QAReplyVO>> list(@RequestParam int bno) throws Exception {
		System.out.println("ReplyController의 bno=>"+bno);
		List<QAReplyVO> replylist = replyservice.list(bno);
		System.out.println("ReplyController의 list=>"+replylist);

		return new ResponseEntity<List<QAReplyVO>>(replylist, HttpStatus.OK);
	}
	
	//	2. 댓글 입력
	/*
	 * @RequestMapping(value = "/write", method = RequestMethod.POST) public String
	 * write(ReplyVO vo) throws Exception { replyservice.write(vo);
	 * 
	 * return "redirect:/Board/QABoard"; }
	 */
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(QAReplyVO vo, RedirectAttributes redirectAttrs) throws Exception {
	    replyservice.write(vo);
	    redirectAttrs.addAttribute("bno", vo.getBno()); 
	    return "redirect:/Board/QABoardview?bno=" + vo.getBno();
	}
}
