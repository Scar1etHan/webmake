package mvc.test.controller.domain;

import java.util.Date;


/*
create table tbl_FreeBoard(
	bno number not null,              
	title varchar2(200) not null,    
	content varchar2(4000),          
	writer varchar2(50) not null,    
	regdate date default sysdate,     
	viewcnt number default 0,      
	primary key(bno)  
);

CREATE SEQUENCE Free_Board_SEQ START WITH  1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
*/

public class freeBoardVO {
	private int bno; // 게시글 번호
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String writer; // 작성자
	private Date regdate; // 게시글 작성일자 util.date
	private int viewcnt; // 조회수
	
	// Getter/Setter
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
	// toString()
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ",title=" + title + ",content=" + content + ", writer=" + writer + 
				", regdate=" + regdate + ", viewcnt" + viewcnt + "]";
	}
}
