package mvc.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mvc.test.board.service.freeBoardService;
import mvc.test.controller.domain.freeBoardPager;
import mvc.test.controller.domain.freeBoardVO;	

@Controller
@RequestMapping("/Board/")
public class FreeBoardController {
	// 의존관계 주입 -> BoardServiceImpl 생성
	// IoC의존관계 역전
	@Inject
	freeBoardService boardService;
	
	// 01. 게시글 목록
		@RequestMapping("FreeBoard")
		// @RequestParam(defaultValue="") ==> 기본값 할당
		public ModelAndView list(@ModelAttribute freeBoardVO vo,
								 @RequestParam(defaultValue="title") String searchOption,
								 @RequestParam(defaultValue="") String keyword,
								 @RequestParam(defaultValue="1")int curPage)throws Exception{
			// 레코드의 갯수
			int count = boardService.countArticle(searchOption, keyword);
			
			// 페이지 나누기 관련 처리
			freeBoardPager boardPager = new freeBoardPager(count, curPage);
			int start = boardPager.getPageBegin();
			int end = boardPager.getPageEnd();
			
			List<freeBoardVO> list = boardService.listAll(start, end, searchOption, keyword);
			// 데이터를 맵에 저장
			// ModelAndView - 모델과 뷰
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list); // list
			map.put("count", count); // 레코드의 갯수
			map.put("searchOption", searchOption); // 검색옵션
			map.put("keyword", keyword); // 검색키워드
			map.put("boardPager", boardPager);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
			mav.setViewName("Board/FreeBoard"); // 뷰를 list.jsp로 설정
			
			return mav; // list.jsp로 List가 전달된다.
			
		}
	
	// 02_01. 게시글 작성화면
	// @RequestMapping("board/FreeBoardWrite)
	// value="",method="전송방식"
	@RequestMapping(value="FreeBoardWrite", method=RequestMethod.GET)
	public String write() {
		return "Board/FreeBoardWrite"; // FreeBoardWrite.jsp로 이동
	}
	
	// 02_02. 게시글 작성 처리
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(@ModelAttribute freeBoardVO vo)throws Exception{
		boardService.insert(vo);
		return "redirect:FreeBoard";
	}
	
	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value="FreeBoardView", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session)throws Exception{
		// 조회수 증가 처리
		boardService.increaseViewcnt(bno, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("Board/FreeBoardView");
		// 뷰에 전달할 데이터
		mav.addObject("dto", boardService.view(bno));
		return mav;
	}
	
	// 04. 게시글 수정
	@GetMapping(value="FreeBoardUpdate")
	public ModelAndView getUpdate(@RequestParam int bno, HttpSession session)throws Exception{
		// 조회수 증가 처리
		boardService.increaseViewcnt(bno, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("Board/FreeBoardUpdate");
		// 뷰에 전달할 데이터
		mav.addObject("dto", boardService.view(bno));
		return mav;
	}

	@PostMapping(value="update")
	public String postUpdate(freeBoardVO vo)throws Exception{
		boardService.update(vo);
		return "redirect:FreeBoard";
	}
	
	// 05. 게시글 삭제
	@RequestMapping("delete") 
	public String delete(@RequestParam int bno)throws Exception{ 
		boardService.delete(bno);
		return "redirect:FreeBoard"; 
	  
	}
	
	
	 
}