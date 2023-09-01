package mvc.test.order.dto;

import java.util.Date;

public class ProductVO {

	private int p_number; 		// 상품 번호 (기본키)
	private String p_name;		// 상품 이름
	private String p_kind;  	// 상품 종류 (스킨, 로션 뭐 이런거)
	private int p_price;		// 상품 가격
	private String p_info; 		// 상품 설명
	private String p_image;		// 상품 사진
	private Date p_date; 		// 상품 등록 일자
	private String p_cat; 		// 바우만 진단결과 16타입 분류
	
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public String getP_kind() {
		return p_kind;
	}
	public void setP_kind(String p_kind) {
		this.p_kind = p_kind;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public String getP_cat() {
		return p_cat;
	}
	public void setP_cat(String p_cat) {
		this.p_cat = p_cat;
	}

}
