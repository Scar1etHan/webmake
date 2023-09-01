package mvc.test.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.test.controller.domain.QABoardVO;

@Repository
public class QABoardDAOImpl implements QABoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "mvc.test.mappers.board";
	
	
	//	1. 문의 게시판 목록보기	namespace 뒤에 붙는거는 boardMapper에서 쓴 sql id값이랑 일치시킴
	@Override
	public List<QABoardVO> list() throws Exception {
		return sqlSession.selectList(namespace + ".QAlist");
	}
	
	//	2. 문의 게시글 작성
	@Override
	public void QAwrite(QABoardVO vo) throws Exception {
		sqlSession.insert(namespace+".QAwrite", vo);
	}
	
	//	3. 문의 게시글 조회
	@Override
	public QABoardVO QAread(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".QAread", bno);
	}
	
	//	4. 문의 게시글 수정
	@Override
	public void QAupdate(QABoardVO vo) throws Exception {
		sqlSession.update(namespace+".QAupdate", vo);
	}
	
	//	5. 문의 게시글 삭제
	@Override
	public void QAdelete(int bno) throws Exception {
		sqlSession.delete(namespace+".QAdelete", bno);
	}

	//	6. 문의 게시글 조회수
	@Override
	public void QAviewCnt(int bno) throws Exception {
		sqlSession.update(namespace+".QAviewCnt", bno);
	}
	
	//	7. 문의 게시물 댓글 수 표시
	@Override
	public int QAreplycnt(int bno) throws Exception {
		return sqlSession.selectOne(namespace+".QAreplycnt",bno);
	}
}
