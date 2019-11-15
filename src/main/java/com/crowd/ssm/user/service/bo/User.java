package com.crowd.ssm.user.service.bo;

public class User {
	public User() {
	}

	public User(int userId) {
		this.userId = userId;
	}

	private int userId;
	private String userName;
	private String password;
	private String userEmail;
	private int userType;
	private String userCompany;
	private int userAccttype;
	public int getUserAccttype() {
		return userAccttype;
	}

	public void setUserAccttype(int userAccttype) {
		this.userAccttype = userAccttype;
	}

	public String getUserCompany() {
		return userCompany;
	}

	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User{" +
			"userId=" + userId +
			", userName='" + userName + '\'' +
			", password='" + password + '\'' +
			", userEmail='" + userEmail + '\'' +
			", userType=" + userType +
			", userCompany='" + userCompany + '\'' +
			'}';
	}
}
