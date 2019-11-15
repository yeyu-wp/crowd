package com.crowd.ssm.good.service.bo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Good {
	private int goodId;  //物品ID
	private int userId;   //用户ID
	private String goodName; //物品名称
	private double goodPrice;  //物品价格
	private int goodSale;     //物品销量
	private String goodImgUrl;   //物品图片
	private int goodDate;     //物品日期
	private int goodType;     //物品类型
	private String goodRemarks;   //物品简介
	private String goodDescImg;   //物品描述图片
	private String goodDesc;      //物品描述
	private String goodTel;        //联系电话
	private String goodLocalTel;   //客服电话
	private int goodAndUserStatus;//用户和物品关系
	private int goodTop;//物品是否出现在最前列
	@DateTimeFormat(pattern = "yyyy:MM:dd HH:mm:ss")
	private Date goodStartDate;//物品发起时间
	@DateTimeFormat(pattern = "yyyy年MM月dd日 HH：mm:ss")
	private Date orderCreateDate;//订单创建日期
	private int orderId;//订单id
	private int orderSale;//订单单价
	private int counts;//订单的单笔支付数量

	public Date getOrderCreateDate() {
		return orderCreateDate;
	}

	public void setOrderCreateDate(Date orderCreateDate) {
		this.orderCreateDate = orderCreateDate;
	}

	public int getOrderSale() {
		return orderSale;
	}

	public void setOrderSale(int orderSale) {
		this.orderSale = orderSale;
	}

	public int getCounts() {
		return counts;
	}

	public void setCounts(int counts) {
		this.counts = counts;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getGoodStartDate() {
		return goodStartDate;
	}

	public void setGoodStartDate(Date goodStartDate) {
		this.goodStartDate = goodStartDate;
	}

	public int getGoodTop() {
		return goodTop;
	}

	public void setGoodTop(int goodTop) {
		this.goodTop = goodTop;
	}

	public int getGoodDate() {
		return goodDate;
	}

	public int getGoodAndUserStatus() {
		return goodAndUserStatus;
	}

	public void setGoodAndUserStatus(int goodAndUserStatus) {
		this.goodAndUserStatus = goodAndUserStatus;
	}

	public int getGoodId() {
		return goodId;
	}

	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public double getGoodPrice() {
		return goodPrice;
	}

	public void setGoodPrice(double goodPrice) {
		this.goodPrice = goodPrice;
	}

	public int getGoodSale() {
		return goodSale;
	}

	public void setGoodSale(int goodSale) {
		this.goodSale = goodSale;
	}

	public String getGoodImgUrl() {
		return goodImgUrl;
	}

	public void setGoodImgUrl(String goodImgUrl) {
		this.goodImgUrl = goodImgUrl;
	}


	public int getGoodType() {
		return goodType;
	}

	public void setGoodType(int goodType) {
		this.goodType = goodType;
	}

	public void setGoodDate(int goodDate) {
		this.goodDate = goodDate;
	}

	public String getGoodRemarks() {
		return goodRemarks;
	}

	public void setGoodRemarks(String goodRemarks) {
		this.goodRemarks = goodRemarks;
	}

	public String getGoodDescImg() {
		return goodDescImg;
	}

	public void setGoodDescImg(String goodDescImg) {
		this.goodDescImg = goodDescImg;
	}

	public String getGoodDesc() {
		return goodDesc;
	}

	public void setGoodDesc(String goodDesc) {
		this.goodDesc = goodDesc;
	}

	public String getGoodTel() {
		return goodTel;
	}

	public void setGoodTel(String goodTel) {
		this.goodTel = goodTel;
	}

	public String getGoodLocalTel() {
		return goodLocalTel;
	}

	public void setGoodLocalTel(String goodLocalTel) {
		this.goodLocalTel = goodLocalTel;
	}

	@Override
	public String toString() {
		return "Good{" +
			"goodId=" + goodId +
			", userId=" + userId +
			", goodName='" + goodName + '\'' +
			", goodPrice=" + goodPrice +
			", goodSale=" + goodSale +
			", goodImgUrl='" + goodImgUrl + '\'' +
			", goodDate=" + goodDate +
			", goodType=" + goodType +
			", goodRemarks='" + goodRemarks + '\'' +
			", goodDescImg='" + goodDescImg + '\'' +
			", goodDesc='" + goodDesc + '\'' +
			", goodTel='" + goodTel + '\'' +
			", goodLocalTel='" + goodLocalTel + '\'' +
			", goodAndUserStatus=" + goodAndUserStatus +
			", goodTop=" + goodTop +
			", goodStartDate=" + goodStartDate +
			", orderCreateDate=" + orderCreateDate +
			", orderId=" + orderId +
			", orderSale=" + orderSale +
			", counts=" + counts +
			'}';
	}
}
