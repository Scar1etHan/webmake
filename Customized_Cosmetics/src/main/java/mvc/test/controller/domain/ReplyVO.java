package mvc.test.controller.domain;

import java.util.Date;

public class ReplyVO {
		
		/*
		 상품 후기 댓글 구현
		 
			 create table tbl_reply (
	    gdsNum      number          not null,
	    userId      varchar2(50)    not null,
	    repNum      number          not null,
	    repCon      varchar2(2000)  not null,
	    repDate     date            default sysdate,
	    primary key(gdsNum, repNum) 
	);

		 */
		
	private int gdsNum;
	private String userId;
	private int repNum;
	private String repCon;
	private Date repDate;
	
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRepNum() {
		return repNum;
	}
	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}
	public String getRepCon() {
		return repCon;
	}
	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}
	public Date getRepDate() {
		return repDate;
	}
	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}
	
	
}
