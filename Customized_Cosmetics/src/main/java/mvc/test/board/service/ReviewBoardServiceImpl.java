package mvc.test.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.board.dao.ReviewBoardDAO;
import mvc.test.controller.domain.ReviewBoardVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	@Inject
	private ReviewBoardDAO dao;
	
	//게시물 목록
	@Override
	public List<ReviewBoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	//게시물 작성
	@Override
	public void write(ReviewBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.write(vo);
	}

	//게시물 조회
	@Override
	public ReviewBoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(bno);
	}
	
	//게시물 조회
	@Override
	public void viewCnt(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.viewCnt(bno);
	}
	
	
	//게시물 작성
	@Override
	public void modify(ReviewBoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.modify(vo);
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
		
	}
	
	// 게시물 총 갯수
	@Override
	public int count() throws Exception {
	 return dao.count();
	}
	
	//게시물 목록 + 페이징
	@Override
	public List<ReviewBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}
	
	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<ReviewBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) throws Exception {
	 return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	// 게시물 총 갯수
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	 return dao.searchCount(searchType, keyword);
	}
	
}