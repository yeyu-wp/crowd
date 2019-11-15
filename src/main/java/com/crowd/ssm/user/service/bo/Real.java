package com.crowd.ssm.user.service.bo;

public class Real {

    private Integer prId;
    private String prName;
    private Integer prVersion;
    private String jName;
    private String userName;

    public Integer getPrId() {
        return prId;
    }

    public void setPrId(Integer prId) {
        this.prId = prId;
    }

    public String getPrName() {
        return prName;
    }

    public void setPrName(String prName) {
        this.prName = prName;
    }

    public Integer getPrVersion() {
        return prVersion;
    }

    public void setPrVersion(Integer prVersion) {
        this.prVersion = prVersion;
    }

    public String getjName() {
        return jName;
    }

    public void setjName(String jName) {
        this.jName = jName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "Real{" +
                "prId=" + prId +
                ", prName='" + prName + '\'' +
                ", prVersion=" + prVersion +
                ", jName='" + jName + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }
}
