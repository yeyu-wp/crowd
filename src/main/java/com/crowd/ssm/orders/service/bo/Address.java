package com.crowd.ssm.orders.service.bo;

import com.crowd.ssm.user.service.bo.User;

public class Address {
    private int userId;
    private String addressPerson;
    private String addressTel;
    private String Address;




    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddressPerson() {
        return addressPerson;
    }

    public void setAddressPerson(String addressPerson) {
        this.addressPerson = addressPerson;
    }

    public String getAddressTel() {
        return addressTel;
    }

    public void setAddressTel(String addressTel) {
        this.addressTel = addressTel;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    @Override
    public String toString() {
        return "Address{" +
                "userId=" + userId +
                ", addressPerson='" + addressPerson + '\'' +
                ", addressTel='" + addressTel + '\'' +
                ", Address='" + Address + '\'' +

                '}';
    }
}
