package mvc.test.controller.domain;

import java.util.Date;

public class QAReplyVO {
	
	private int rno;	// 댓글 번호
	private int bno;	// 해당 게시물 번호
	private String replycontent;
	private String replyer;
	private Date regDate;
	
	/* 오라클 댓글 테이블 생성문
	 * create table qareply ( rno number not null primary key, bno number not null
	 * references qaboard(bno), -- qaboard 테이블의 bno를 참조 replycontent varchar2(500)
	 * not null, replyer varchar2(30) not null, regDate date default sysdate );
	 */
	
	/* 오라클 댓글 테이블 더미 데이터 생성문
	 * insert into qareply(rno,bno,replycontent,replyer) values((select
	 * nvl(max(rno)+1,1) from qareply), 테스트 게시물번호, '테스트 댓글내용', '테스트 댓글작성자')
	 */
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replycontent=" + replycontent + ", replyer=" + replyer
				+ ", regDate=" + regDate + "]";
	}
	
}
