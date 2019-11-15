package com.crowd.ssm.money.service.bo;

import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.service.bo.User;

import java.util.List;

public class Money {
    private int id;
    private String type;//回报类型（'1'实物回报 '2'虚拟物品回报）
    private double money;//支付金额
    private String descs;//回报内容
    private String img;//说明图片
    private  int num;//回报数量
    private  int limits;//单笔限购（'1'限购 '2'不限购）
    private double cost;//运费
    private String bill;//发票
    private int rewardTime;//回报时间
    private User users;
    private int goodId;

    public int getGoodId() {
        return goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }

    private Good goods;
    public User getUsers() {
        return users;
    }
    public void setUsers(User users) {
        this.users = users;
    }

    public Good getGoods() {
        return goods;
    }

    public void setGoods(Good goods) {
        this.goods = goods;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getLimits() {
        return limits;
    }

    public void setLimits(int limits) {
        this.limits = limits;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getBill() {
        return bill;
    }

    public void setBill(String bill) {
        this.bill = bill;
    }


    public int getRewardTime() {
        return rewardTime;
    }

    public void setRewardTime(int rewardTime) {
        this.rewardTime = rewardTime;
    }

    @Override
    public String toString() {
        return "Money{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", money=" + money +
                ", descs='" + descs + '\'' +
                ", img='" + img + '\'' +
                ", num=" + num +
                ", limits=" + limits +
                ", cost=" + cost +
                ", bill='" + bill + '\'' +
                ", rewardTime=" + rewardTime +
                ", users=" + users +
                ", goodId=" + goodId +
                ", goods=" + goods +
                '}';
    }

}
