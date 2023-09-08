package mvc.test.board.service;

import java.util.List;

import mvc.test.controller.domain.QAReplyVO;

public interface QAReplyService {
	
	//	1. 댓글 목록
	public List<QAReplyVO> list(int bno) throws Exception;
	
	//	2. 댓글 입력
	public void write(QAReplyVO vo) throws Exception;
	
	//	3. 댓글 수정
	public void update(QAReplyVO vo) throws Exception;
	
	//	4. 댓글 삭제
	public void delete(int rno) throws Exception;
}
