package mvc.test.controller.domain;

import java.util.Date;

public class ReviewBoardVO {
	
	/*
		create table tbl_board(
			bno number not null,              
			title varchar2(200) not null,    
			content varchar2(4000),          
			writer varchar2(50) not null,    
			regdate date default sysdate,     
			viewcnt number default 0,      
			primary key(bno)  
		);
		
		CREATE SEQUENCE TMP_SEQ START WITH  1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
	 */
		
	private int bno; 
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	
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
