package com.crowd.ssm.user.service.bo;

public class Person {
	private int userId;
	private String personName;
	private String personIdCard;
	private int personTel;
	private String personIdCardImg;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPersonIdCard() {
		return personIdCard;
	}

	public void setPersonIdCard(String personIdCard) {
		this.personIdCard = personIdCard;
	}

	public int getPersonTel() {
		return personTel;
	}

	public void setPersonTel(int personTel) {
		this.personTel = personTel;
	}

	public String getPersonIdCardImg() {
		return personIdCardImg;
	}

	public void setPersonIdCardImg(String personIdCardImg) {
		this.personIdCardImg = personIdCardImg;
	}

	@Override
	public String toString() {
		return "Person{" +
			"userId=" + userId +
			", personName='" + personName + '\'' +
			", personIdCard=" + personIdCard +
			", personTel=" + personTel +
			", personIdCardImg='" + personIdCardImg + '\'' +
			'}';
	}
}
