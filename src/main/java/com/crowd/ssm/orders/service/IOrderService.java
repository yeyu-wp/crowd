package com.crowd.ssm.orders.service;

import com.crowd.ssm.orders.service.bo.Address;
import com.crowd.ssm.orders.service.bo.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service接口
 */

public interface IOrderService {
    void addOrder(Order order);
}
