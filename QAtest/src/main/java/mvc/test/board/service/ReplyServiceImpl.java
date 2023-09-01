package mvc.test.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.test.board.dao.ReplyDAO;
import mvc.test.controller.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO replydao;
	
	//	1. 댓글 목록
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return replydao.list(bno);
	}

	//	2. 댓글 작성
	@Override
	public void write(ReplyVO vo) throws Exception {
		replydao.write(vo);
	}

	//	3. 댓글 수정
	@Override
	public void update(ReplyVO vo) throws Exception {

	}

	//	4. 댓글 삭제
	@Override
	public void delete(int rno) throws Exception {

	}

}
