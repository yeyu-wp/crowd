package com.crowd.ssm.orders.dao;

import com.crowd.ssm.orders.service.bo.Order;

import java.util.List;

/**
 * 订单 Dao接口
 */
public interface IOrdersDao {
    public void addOrder(Order order);
}
