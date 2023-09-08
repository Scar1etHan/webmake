package mvc.test.controller.domain;

import java.util.Date;

public class GoodsVO {
/*
 create table tbl_goods (
    gdsNum       number          not null,
    gdsName      varchar2(50)    not null,
    cateCode     varchar2(30)    not null,             상품 카테고리 코드로, 상품의 카테고리를 구분하는 코드입니다.
    gdsPrice     number          not null,
    gdsStock     number          null,                  상품 재고 수량으로, 상품의 재고 수량을 나타냅니다.
    gdsDes       varchar(500)    null,                   상품 설명으로, 상품의 상세 설명을 보여줍니다.
    gdsImg       varchar(200)    null,
    gdsDate      date            default sysdate,
    primary key(gdsNum)  
);
 */
	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private Date gdsDate;
	
	private String gdsThumbImg;
	
	
	public String getGdsThumbImg() {
		return gdsThumbImg;
	}
	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	public String getGdsDes() {
		return gdsDes;
	}
	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public Date getGdsDate() {
		return gdsDate;
	}
	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}
	
	
}
