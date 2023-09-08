package mvc.test.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.board.dao.QABoardDAO;
import mvc.test.controller.domain.QABoardVO;

@Service
public class QABoardServiceImpl implements QABoardService{
	
	@Inject
	private QABoardDAO dao;
	
	//	1. 문의 게시판 목록 보기
	@Override
	public List<QABoardVO> list() throws Exception {
		return dao.list();
	}
	
	//	2. 문의 게시글 작성
	@Override
	public void QAwrite(QABoardVO vo) throws Exception {
		dao.QAwrite(vo);
	}
	
	//	3. 문의 게시글 조회
	@Override
	public QABoardVO QAread(int bno) throws Exception {
		return dao.QAread(bno);
	}
	
	//	4. 문의 게시글 수정
	@Override
	public void QAupdate(QABoardVO vo) throws Exception {
		dao.QAupdate(vo);
	}
	
	//	5. 문의 게시글 삭제
	@Override
	public void QAdelete(int bno) throws Exception {
		dao.QAdelete(bno);
	}
	
	//	6. 문의 게시글 조회수
	@Override
	public void QAviewCnt(int bno) throws Exception {
		dao.QAviewCnt(bno);
	}
}
