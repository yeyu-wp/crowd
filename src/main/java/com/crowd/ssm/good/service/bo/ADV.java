package com.crowd.ssm.good.service.bo;

/**
 * Create by Stan on 2019-10-10 16:48
 */
public class ADV {
	private int advId;
	private int userId;
	private int goodId;
	private int advStatus;
	private String userName;
	private String goodName;
	//页面起始页
	private int startIndex;
	//页面显示的数量
	private int pageSize;

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}



	public int getAdvId() {
		return advId;
	}

	public void setAdvId(int advId) {
		this.advId = advId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public int getAdvStatus() {
		return advStatus;
	}

	public void setAdvStatus(int advStatus) {
		this.advStatus = advStatus;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	@Override
	public String toString() {
		return "ADV{" +
			"advId=" + advId +
			", userId=" + userId +
			", goodId=" + goodId +
			", advStatus=" + advStatus +
			", userName='" + userName + '\'' +
			", goodName='" + goodName + '\'' +
			", startIndex=" + startIndex +
			", pageSize=" + pageSize +
			'}';
	}
}
