package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.test.board.service.EventBoardService;
import mvc.test.controller.domain.EventBoardVO;
import mvc.test.controller.domain.EventPage;

@Controller
@RequestMapping("/Board/*")
public class EventBoardController {
	
	@Inject
	EventBoardService service;
	
	//게시물 목록
	@RequestMapping(value="/EventBoard", method=RequestMethod.GET)
	public void getList(Model model) throws Exception {
		
		List<EventBoardVO> list = null;
		list = service.list();
		
		model.addAttribute("list", list);
	}
	
	//게시물 작성
	@RequestMapping(value="/EventBoardwrite", method=RequestMethod.GET)
    public void getWrite() throws Exception {
		
    }
	
	//게시물 작성
	@RequestMapping(value="/EventBoardwrite", method=RequestMethod.POST)
    public String postWrite(EventBoardVO vo) throws Exception {
		service.write(vo);
		
		return "redirect:/Board/EventBoard";
    }
	
	//게시물 조회
	@RequestMapping(value="/EventBoardview", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

		service.viewCnt(bno);
		
		EventBoardVO vo = service.view(bno);
		
		model.addAttribute("view", vo);
		

	}
	
	//게시물 수정
	@RequestMapping(value="/EventBoardmodify", method=RequestMethod.GET)
    public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		EventBoardVO vo = service.view(bno);
		
		model.addAttribute("view", vo);
		
    }
	
	//게시물 수정
	@RequestMapping(value="/EventBoardmodify", method=RequestMethod.POST)
    public String postModify(EventBoardVO vo) throws Exception {
		service.modify(vo);
		
		return "redirect:/Board/EventBoardview?bno=" + vo.getBno();
    }
	
	//게시물 삭제
	@RequestMapping(value="/EventBoarddelete", method=RequestMethod.GET)
    public String postDelete(@RequestParam("bno") int bno) throws Exception {
		service.delete(bno);
		
		return "redirect:/Board/EventBoard";
    }

	//게시물 목록 + 페이징 추가
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num
     ) throws Exception {
		
		EventPage page = new EventPage();
		
		page.setNum(num);
		page.setCount(service.count());  

		List<EventBoardVO> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
	@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
    @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword	
     ) throws Exception {

	 
	 EventPage page = new EventPage();
	 
	 page.setNum(num);
		
    // page.setCount(service.count()); // 페이징을 만들때 게시물의 갯수
	 page.setCount(service.searchCount(searchType, keyword));
	 
	 // 검색 타입과 검색어
	 page.setSearchTypekeyword(searchType, keyword);
	 
	 List<EventBoardVO> list = null; 
	 //list = service.listPage(page.getDisplayPost(), page.getPostNum());
	 list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	 
	 model.addAttribute("list", list);
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	 
	 model.addAttribute("searchType", searchType);
	 model.addAttribute("keyword", keyword);
	 
	}
}
