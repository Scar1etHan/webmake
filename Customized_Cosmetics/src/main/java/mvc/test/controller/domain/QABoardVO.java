package mvc.test.controller.domain;

import java.util.Date;

public class QABoardVO {
	
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	
	/* 오라클 문의 테이블 생성문
	 * create table qaboard ( bno number not null primary key ,title varchar2(200)
	 * not null ,content varchar2(4000) ,writer varchar2(50) not null ,regDate date
	 * default sysdate ,viewCnt number default 0 );
	 */
	
	/* 오라클 문의 테이블 생성문
	 * create table qaboard ( bno number not null primary key ,title varchar2(200)
	 * not null ,content varchar2(4000) ,writer varchar2(50) not null ,regDate date
	 * default sysdate ,viewCnt number default 0 );
	 */
	
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	
	
}
