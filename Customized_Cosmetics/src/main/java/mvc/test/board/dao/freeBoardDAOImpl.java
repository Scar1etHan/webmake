package mvc.test.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.freeBoardVO;

// DAO에 특화된 어노테이션. @Component 어노테이션을 써도 상관 없지만, DAO 클래스에 @Repository 어노테이션을 사용함으로써
// @Component 어노테이션이 가진 특성과 함께 DAO의 메소드에서 발생할 수 있는 unchecked exception들을 스프링의 
// DataAccessException으로 처리할 수 있는 장점 또한 갖는다.
@Repository // 현재 클래스를 dao bean으로 등록
public class freeBoardDAOImpl implements freeBoardDAO {
	
// name으로 DI를 가능케 한다. 자바에서 지원하는 어노테이션이면 프레임워크에 종속적이지 않아 상사용해도 좋다.
//	타입을 연결
	@Inject
	SqlSession sqlSession;
	
	// 1. 게시글작성
	@Override
	public void insert(freeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("board.insert", vo);
	}
	// 2. 게시글 상세보기
	@Override
	public freeBoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.view", bno);
	}
	// 3. 게시글 수정
	@Override
	public void update(freeBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("board.update", vo);
	}
	// 4. 게시글 삭제
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("board.delete", bno);
	}
	// 05. 게시글 전체 목록
	@Override
	public List<freeBoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
	    // 검색옵션, 키워드 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    // BETWEEN #{start}, #{end}에 입력될 값을 맵에 
	    map.put("start", start);
	    map.put("end", end);
	    return sqlSession.selectList("board.listAll", map);
	}
	 
	// 6. 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("board.increaseViewcnt", bno);
	}
	// 07. 게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword) throws Exception{
		// 검색 옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countArticle",map);
	}
}
