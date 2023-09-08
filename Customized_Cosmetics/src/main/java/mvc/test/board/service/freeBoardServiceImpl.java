package mvc.test.board.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import mvc.test.board.dao.freeBoardDAO;
import mvc.test.controller.domain.freeBoardVO;
@Service
public class freeBoardServiceImpl implements freeBoardService {
	@Inject
	freeBoardDAO boardDao;
	
	// 01. 게시글 글쓰기
	@Override
	public void insert(freeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		String title = vo.getTitle();
		String content = vo.getContent();
		String writer = vo.getWriter();
		// * 태그문자 처리 (<--> &lt; >--> &gt;)
		// replace(A, B) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		// *공백 문자 처리
		title = title.replace("  ", "&nbsp;&nbsp;");
		writer = writer.replace("  ", "&nbsp;&nbsp;");
		// *줄바꿈 문자 처리
		content = content.replace("\n", "<br>");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setWriter(writer);
		boardDao.insert(vo);
	}
	// 02. 게시글 상세보기
	@Override
	public freeBoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.view(bno);
	}
	// 03. 게시글 수정
	@Override
	public void update(freeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		boardDao.update(vo);
	}
	// 04. 게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		boardDao.delete(bno);
	}
	// 05. 게시글 전체 목록
	
	  @Override 
	  public List<freeBoardVO>listAll(int start, int end, String searchOption, String keyword) throws Exception { 
		  // TODO Auto-generated method stub 
		  return boardDao.listAll(start, end, searchOption, keyword);
	  
	  }
	 
	// 06. 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문 실행X
		if(session.getAttribute("update_time_" + bno) != null) {
								// 세션에서 읽어오기
			update_time = (Long) session.getAttribute("update_time_"+bno);
		}
		// 시스템의 현재 시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		// 시스템 현재 시간 - 열람시간 > 일정시간 ( 조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 1*1000) {
			boardDao.increaseViewcnt(bno);
			// 세션에 시간을 저장 : "update_time_"*bno는 다른변수와 중복되지 않음
			session.setAttribute("update_time_"+bno, current_time);
		}
	}
	// 07. 게시글 레코드 갯수 boardDao.count메서드
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception{
		return boardDao.countArticle(searchOption, keyword);
	}
}
