package com.crowd.ssm.reward.service.bo;

import com.crowd.ssm.good.service.bo.Good;

/**
 * 回报设置（实体）
 */
public class Reward {
    private int id;
    private String types;    //回报类型（'1'实物回报 '2'虚拟物品回报）
    private float money;   //支付金额
    private String descs;    //回报内容
    private int goodId;     //说明图片
    private int num;        //回报数量
    private int limits;  //单笔限购
    private int limitnumber;    //限购数量
    private Double cost;    //运费
    private String bill;    //发票
    private int rewardTime;    //回报时间

    private Good good;  //注入项目

    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return types;
    }

    public void setType(String type) {
        this.types = type;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public int getGoodId() {
        return goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
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

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
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

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public int getLimitnumber() {
        return limitnumber;
    }

    public void setLimitnumber(int limitnumber) {
        this.limitnumber = limitnumber;
    }

    @Override
    public String toString() {
        return "Reward{" +
                "id=" + id +
                ", types='" + types + '\'' +
                ", money=" + money +
                ", descs='" + descs + '\'' +
                ", goodId=" + goodId +
                ", num=" + num +
                ", limits=" + limits +
                ", limitnumber=" + limitnumber +
                ", cost=" + cost +
                ", bill='" + bill + '\'' +
                ", rewardTime=" + rewardTime +
                ", good=" + good +
                '}';
    }
}
