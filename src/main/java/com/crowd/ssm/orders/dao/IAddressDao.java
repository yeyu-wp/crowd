package com.crowd.ssm.orders.dao;

import com.crowd.ssm.orders.service.bo.Address;

import java.util.List;

/**
 * 订单 Dao接口
 */
public interface IAddressDao {
    //通过userId去获取用户地址
    List<Address> selectAddressByUserId(int id);
    //添加用户地址
    void addAddress(Address address);
}
