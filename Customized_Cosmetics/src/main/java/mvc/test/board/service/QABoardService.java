package mvc.test.board.service;

import java.util.List;

import mvc.test.controller.domain.QABoardVO;

public interface QABoardService {
	
	//	1. 문의 게시판 목록 보기
	public List<QABoardVO> list() throws Exception;
	
	//	2. 문의 게시글 작성
	public void QAwrite(QABoardVO vo) throws Exception;
	
	//	3. 문의 게시글 조회
	public QABoardVO QAread(int bno) throws Exception;
	
	//	4. 문의 게시글 수정
	public void QAupdate(QABoardVO vo) throws Exception;
	
	//	5. 문의 게시글 삭제
	public void QAdelete(int bno) throws Exception;
	
	//	6. 문의 게시글 조회수
	public void QAviewCnt(int bno) throws Exception;
}
