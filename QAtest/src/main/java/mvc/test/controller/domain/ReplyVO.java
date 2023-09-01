package mvc.test.controller.domain;

import java.util.Date;

public class ReplyVO {
	
	private int rno;				// 댓글 번호 (기본키)
	private int bno;				// 해당 게시물 번호 (외래키)
	private String replycontent;	// 댓글 내용
	private String user_id;			// 댓글 작성자
	private Date regDate;			// 댓글 작성일

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replycontent=" + replycontent + ", user_id=" + user_id
				+ ", regDate=" + regDate + "]";
	}
	
}
