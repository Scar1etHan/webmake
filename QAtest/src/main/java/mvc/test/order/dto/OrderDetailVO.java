package mvc.test.order.dto;

import java.util.Date;

public class OrderDetailVO {
	
	private int orderdetail_number;		//	상세 주문 번호(기본키)
	private int order_number;			//	주문 번호 (외래키)
	private int p_number;				//	상품 번호 (외래키)
	private int orderdetail_quantity;	//	주문 수량
	
	private String p_name;				//	상품 이름	// 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	private int p_price;				//	상품 가격 // 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	private String p_image;				//	상품 사진 // 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	private Date order_date;			//	주문 날짜 // 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	private String order_payment;		//	결제 수단 // 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	private String order_deliver;		//	배송 상태 // 데이터 조인용으로 VO에만 추가 데이터 베이스에는 안들어감
	
	
	public String getOrder_deliver() {
		return order_deliver;
	}
	public void setOrder_deliver(String order_deliver) {
		this.order_deliver = order_deliver;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getOrderdetail_number() {
		return orderdetail_number;
	}
	public void setOrderdetail_number(int orderdetail_number) {
		this.orderdetail_number = orderdetail_number;
	}
	public int getOrder_number() {
		return order_number;
	}
	public void setOrder_number(int order_number) {
		this.order_number = order_number;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public int getOrderdetail_quantity() {
		return orderdetail_quantity;
	}
	public void setOrderdetail_quantity(int orderdetail_quantity) {
		this.orderdetail_quantity = orderdetail_quantity;
	}
	
	@Override
	public String toString() {
		return "OrderDetailVO [orderdetail_number=" + orderdetail_number + ", order_number=" + order_number
				+ ", p_number=" + p_number + ", orderdetail_quantity=" + orderdetail_quantity + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_image=" + p_image + ", order_date=" + order_date + ", order_payment="
				+ order_payment + ", order_deliver=" + order_deliver + "]";
	}
}
