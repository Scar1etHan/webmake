package mvc.test.controller.domain;

import java.util.Date;

public class QABoardVO {
	
	private int bno;			// 게시물 번호 (기본키)
	private String title;		// 게시물 제목
	private String content;		// 게시물 내용
	private String user_id;		// 게시물 작성자
	private Date regDate;		// 게시물 작성 날짜
	private int viewCnt;		// 게시물 조회수
	private int replycnt;		// 게시물 댓글 수
	
	
	
	public int getReplycnt() {
		return replycnt;
	}
	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	
	@Override
	public String toString() {
		return "QABoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", user_id=" + user_id
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", replycnt=" + replycnt + "]";
	}
}
