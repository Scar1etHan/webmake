package mvc.test.controller.domain;

import java.util.Date;

public class UserVO {
	private String userId; // 아이디
	private String userPw; // 비밀번호
	private String userName; // 이름
	private String userAge; // 나이
	private String userSex; // 성별
	private String userCell; // 성별
	private String userEmail; // 이메일
	private String userAddr1; // 주소
	private String userAddr2; // 주소
	private String userAddr3; // 주소
	private Date userRegDate; // 가입날짜
	
	
	public Date getUserRegDate() {
		return userRegDate;
	}
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}
	public String getUserCell() {
		return userCell;
	}
	public void setUserCell(String userCell) {
		this.userCell = userCell;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	public String getUserAddr3() {
		return userAddr3;
	}
	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}
	
	
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userAge=" + userAge
				+ ", userSex=" + userSex + ", userCell=" + userCell + ", userEmail=" + userEmail + ", userAddr1="
				+ userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3 + ", userRegDate=" + userRegDate
				+ "]";
	}
}

