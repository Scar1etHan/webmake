package mvc.test.board.dao;

import java.util.List;

import mvc.test.controller.domain.ReviewBoardVO;

public interface ReviewBoardDAO {
	
	//게시물 목록
	public List<ReviewBoardVO> list() throws Exception;
	
	//게시물 작성
	public void write(ReviewBoardVO vo) throws Exception;
	
	//게시물 조회
	public ReviewBoardVO view(int bno) throws Exception;
	
	//게시물 조회수
	public void viewCnt(int bno) throws Exception;
	
	//게시물 수정
	public void modify(ReviewBoardVO vo) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 게시물 총 갯수
	public int count() throws Exception;
	
	//게시물 목록 + 페이징
	public List<ReviewBoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	//게시물 목록 + 페이징 + 검색
	public List<ReviewBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	//게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;

}
