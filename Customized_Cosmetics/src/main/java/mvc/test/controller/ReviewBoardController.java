package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.test.board.service.ReviewBoardService;
import mvc.test.controller.domain.ReviewBoardVO;
import mvc.test.controller.domain.ReviewPage;

@Controller
@RequestMapping("/Board/*")
public class ReviewBoardController {
	
	@Inject
	ReviewBoardService service;
	
	//게시물 작성
	@RequestMapping(value="/ReviewBoardwrite", method=RequestMethod.POST)
    public String postWrite(ReviewBoardVO vo) throws Exception {
		service.write(vo);
		
		return "redirect:/Board/ReviewBoard?num=1";
    }
	
	//게시물 조회
	@RequestMapping(value="/ReviewBoardview", method=RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

		
		service.viewCnt(bno);
		
		ReviewBoardVO vo = service.view(bno);
		
		model.addAttribute("view", vo);
		
		
		
	}
	
	//게시물 수정
	@RequestMapping(value="/ReviewBoardmodify", method=RequestMethod.GET)
    public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		ReviewBoardVO vo = service.view(bno);
		
		model.addAttribute("view", vo);
		
    }
	
	//게시물 수정
	@RequestMapping(value="/ReviewBoardmodify", method=RequestMethod.POST)
    public String postModify(ReviewBoardVO vo) throws Exception {
		service.modify(vo);
		
		return "redirect:/Board/ReviewBoardview?bno=" + vo.getBno();
    }
	
	//게시물 삭제
	@RequestMapping(value="/ReviewBoarddelete", method=RequestMethod.GET)
    public String postDelete(@RequestParam(value="bno",required=true) int bno) throws Exception {
		service.delete(bno);
		
		return "redirect:/Board/ReviewBoard?num=1";
    }
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping(value="/ReviewBoard", method=RequestMethod.GET)
	public void getListPage(Model model, @RequestParam(value="num") int num) throws Exception {
		
		ReviewPage page = new ReviewPage();
		
		page.setNum(num);
		page.setCount(service.count());
		
		List<ReviewBoardVO> list = null;
		list = service.listPage(page.getDisplayPost(), page.getPostNum());
		
		model.addAttribute("list", list);
		
		
		/*
		model.addAttribute("pageNum", page.getPageNum());
		
		model.addAttribute("startPageNum", page.getStartPageNum());
		model.addAttribute("endPageNum", page.getEndPageNum());
		
		model.addAttribute("prev", page.getPrev());
		model.addAttribute("next", page.getNext());
		*/
		
		model.addAttribute("page", page);
		
		/*
		// 게시물 총 갯수
		int count = service.count();
		
		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;
		
		// 하단 페이징 번호 ([ 게시물 총 갯수 / 한 페이지에 출력할 갯수 ]의 올림)
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		// 출력할 게시물 페이지
		int displayPost = num;
		System.out.println("num = " + num);
		
		//표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double)displayPost / (double)postNum) * postNum);
		System.out.println("endPageNum =" + endPageNum);
		
		//표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (postNum - 1);
		
		//마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * postNum  >= count ? false : true;
		
		List<BoardVO> list = null;
		list = service.listPage(displayPost, postNum);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		
		//시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		
		//이전 및 다음
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		*/
	}
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value="/ReviewBoard", params="searchType" ,method=RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam(value="num") int num,
									@RequestParam(value="searchType", required = false, defaultValue = "tltie") String searchType,
									@RequestParam(value="keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		ReviewPage page = new ReviewPage();
		
		page.setNum(num);
		//page.setCount(service.count());
		page.setCount(service.searchCount(searchType, keyword));
		
		//검색 타입과 검색어
		page.setSearchTypeword(searchType, keyword);
		
		List<ReviewBoardVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		
	}
	
}