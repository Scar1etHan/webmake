package mvc.test.controller.domain;

import java.util.Date;

public class BuyVO {
	private int Order_Number; 
	private int P_Number;
	private String User_Id;
	private Date Order_Date;
	private int Order_Total;
	private String status;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getOrder_Number() {
		return Order_Number;
	}
	public void setOrder_Number(int order_Number) {
		Order_Number = order_Number;
	}
	public int getP_Number() {
		return P_Number;
	}
	public void setP_Number(int p_Number) {
		P_Number = p_Number;
	}
	public String getUser_Id() {
		return User_Id;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public Date getOrder_Date() {
		return Order_Date;
	}
	public void setOrder_Date(Date order_Date) {
		Order_Date = order_Date;
	}
	public int getOrder_Total() {
		return Order_Total;
	}
	public void setOrder_Total(int order_Total) {
		Order_Total = order_Total;
	}
}
