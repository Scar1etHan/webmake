package mvc.test.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.ReviewBoardVO;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "mvc.test.mappers.ReviewBoard";
	
	// 리뷰게시물 목록
	@Override
	public List<ReviewBoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	// 게시물 작성
	@Override
	public void write(ReviewBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".write", vo);
	}
	
	//게시물 조회
	@Override
	public ReviewBoardVO view(int bno) throws Exception {
		
		return sql.selectOne(namespace + ".view", bno);
	}
	
	//게시물 조회수
	@Override
	public void viewCnt(int bno) throws Exception {
		 
		sql.selectOne(namespace + ".viewCnt", bno);
	}
	
	// 게시물 수정
	@Override
	public void modify(ReviewBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".modify", vo);
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	 return sql.selectOne(namespace + ".count"); 
	}
	
	//게시물 목록 + 페이징
	@Override
	public List<ReviewBoardVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}
	
	//게시물 목록 + 페이징 + 검색
	@Override
	public List<ReviewBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}
	
	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		
		
		return sql.selectOne(namespace + ".searchCount", data);
	}

	public static void main(String[] args) {
	}
		
		

}