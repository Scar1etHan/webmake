package mvc.test.member.dto;

import java.util.Date;

public class MemberVO {
	
	private String user_id;				//	회원 아이디 (기본키)
	private String user_pw;				//	회원 비번
	private String user_name;			//	회원 이름
	private int user_age;				//	회원 나이
	private String user_sex;			//	회원 성별
	private String user_phone;			//	회원 전화번호
	private String user_email;			//	회원 메일
	private String user_Addr1;			//	회원 주소1
	private String user_Addr2;			//	회원 주소2
	private String user_Addr3;			//	회원 주소3
	private Date user_regDate;			//	회원 등록 일자
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_age() {
		return user_age;
	}
	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_Addr1() {
		return user_Addr1;
	}
	public void setUser_Addr1(String user_Addr1) {
		this.user_Addr1 = user_Addr1;
	}
	public String getUser_Addr2() {
		return user_Addr2;
	}
	public void setUser_Addr2(String user_Addr2) {
		this.user_Addr2 = user_Addr2;
	}
	public String getUser_Addr3() {
		return user_Addr3;
	}
	public void setUser_Addr3(String user_Addr3) {
		this.user_Addr3 = user_Addr3;
	}
	public Date getUser_regDate() {
		return user_regDate;
	}
	public void setUser_regDate(Date user_regDate) {
		this.user_regDate = user_regDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_age="
				+ user_age + ", user_sex=" + user_sex + ", user_phone=" + user_phone + ", user_email=" + user_email
				+ ", user_Addr1=" + user_Addr1 + ", user_Addr2=" + user_Addr2 + ", user_Addr3=" + user_Addr3
				+ ", user_regDate=" + user_regDate + "]";
	}
}