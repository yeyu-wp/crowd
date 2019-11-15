package com.crowd.ssm.user.service.bo;

import java.util.Date;

public class Adverte {

    private Integer advId;
    private String advDesc;
    private Date advTime;

    public Integer getAdvId() {
        return advId;
    }

    public void setAdvId(Integer advId) {
        this.advId = advId;
    }

    public String getAdvDesc() {
        return advDesc;
    }

    public void setAdvDesc(String advDesc) {
        this.advDesc = advDesc;
    }

    public Date getAdvTime() {
        return advTime;
    }

    public void setAdvTime(Date advTime) {
        this.advTime = advTime;
    }

    @Override
    public String toString() {
        return "Adverte{" +
                "advId=" + advId +
                ", advDesc='" + advDesc + '\'' +
                ", advTime=" + advTime +
                '}';
    }
}
