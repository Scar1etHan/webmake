package mvc.test.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.QAReplyVO;

@Repository
public class QAReplyDAOImle implements QAReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	private static String namespace = "mvc.test.mappers.reply";
	
	//	1. 댓글 목록
	@Override
	public List<QAReplyVO> list(int bno) throws Exception {
		return sqlSession.selectList(namespace+".listReply",bno);
	}

	//	2. 댓글 작성
	@Override
	public void write(QAReplyVO vo) throws Exception {
		sqlSession.insert(namespace+".writeReply", vo);
	}

	@Override
	public void update(QAReplyVO vo) throws Exception {

	}

	@Override
	public void delete(int rno) throws Exception {

	}

}
