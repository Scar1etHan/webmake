package mvc.test.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.ReplyVO;

@Repository
public class ReplyDAOImle implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "mvc.test.mappers.reply";
	
	//	1. 댓글 목록
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(namespace+".listReply",bno);
	}

	//	2. 댓글 작성
	@Override
	public void write(ReplyVO vo) throws Exception {
		sqlSession.insert(namespace+".writeReply", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {

	}

	@Override
	public void delete(int rno) throws Exception {

	}

}
