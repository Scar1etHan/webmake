package mvc.test.board.service;

import java.util.List;

import mvc.test.controller.domain.ReplyVO;

public interface ReplyService {
	
	//	1. 댓글 목록
	public List<ReplyVO> list(int bno) throws Exception;
	
	//	2. 댓글 입력
	public void write(ReplyVO vo) throws Exception;
	
	//	3. 댓글 수정
	public void update(ReplyVO vo) throws Exception;
	
	//	4. 댓글 삭제
	public void delete(int rno) throws Exception;
}
