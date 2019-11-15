package com.crowd.ssm.orders.service.bo;

import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.service.bo.User;

import java.util.Date;

public class Order {
    private int orderId;
    private int orderSale;
    private String orderAddress;
    private Date orderCreatdate;
    private String orderRemark;
    private int goodId;
    private int userId;
    private int counts;
    private float orderPrice;

    public int getOrderSale() {
        return orderSale;
    }

    public void setOrderSale(int orderSale) {
        this.orderSale = orderSale;
    }

    public float getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(float orderPrice) {
        this.orderPrice = orderPrice;
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




    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public Date getOrderCreatdate() {
        return orderCreatdate;
    }

    public void setOrderCreatdate(Date orderCreatdate) {
        this.orderCreatdate = orderCreatdate;
    }

    public String getOrderRemark() {
        return orderRemark;
    }

    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark;
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


    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", orderSale=" + orderSale +
                ", orderAddress='" + orderAddress + '\'' +
                ", orderCreatdate=" + orderCreatdate +
                ", orderRemark='" + orderRemark + '\'' +
                ", goodId=" + goodId +
                ", userId=" + userId +
                ", counts=" + counts +
                ", orderPrice=" + orderPrice +
                '}';
    }
}
