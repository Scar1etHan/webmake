package mvc.test.controller.domain;

import java.util.Date;

public class OrderListVO {
	
	private int order_number;			// 주문 번호(기본키)
	private int p_number;				// 상품 번호(외래키)
	private String userId;				// 주문자(외래키)
	private Date order_date;			// 주문 날짜
	private String order_deliver;		// 배송 상태
	private String order_total;			// 주문 총액
	private String order_payment;		// 결제 수단
	
	
	public String getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
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

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_deliver() {
		return order_deliver;
	}
	public void setOrder_deliver(String order_deliver) {
		this.order_deliver = order_deliver;
	}
	public String getOrder_total() {
		return order_total;
	}
	public void setOrder_total(String order_total) {
		this.order_total = order_total;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [order_number=" + order_number + ", p_number=" + p_number + ", userId=" + userId
				+ ", order_date=" + order_date + ", order_deliver=" + order_deliver + ", order_total=" + order_total
				+ ", order_payment=" + order_payment + "]";
	}
	
}
