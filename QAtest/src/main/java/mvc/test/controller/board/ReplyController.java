package mvc.test.controller.board;

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

import mvc.test.board.service.ReplyService;
import mvc.test.controller.domain.ReplyVO;

@Controller
@RequestMapping("/reply/")
public class ReplyController {

	@Inject
	ReplyService replyservice;

	
	//	1. 댓글 목록(ajax방식)
	@RequestMapping(value="list", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<ReplyVO>> list(@RequestParam int bno) throws Exception {
		System.out.println("ReplyController의 bno=>"+bno);
		List<ReplyVO> replylist = replyservice.list(bno);
		System.out.println("ReplyController의 list=>"+replylist);

		return new ResponseEntity<List<ReplyVO>>(replylist, HttpStatus.OK);
	}
	
	//	2. 댓글 입력
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(ReplyVO vo, RedirectAttributes redirectAttrs) throws Exception {
	    replyservice.write(vo);
	    
	    redirectAttrs.addAttribute("bno", vo.getBno()); 
	    return "redirect:/Board/QABoardview?bno=" + vo.getBno();
	}
}
