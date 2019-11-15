package com.crowd.ssm.orders.service.impl;

import com.crowd.ssm.orders.dao.IOrdersDao;
import com.crowd.ssm.orders.service.IOrderService;
import com.crowd.ssm.orders.service.bo.Order;

import com.crowd.ssm.orders.view.OrderController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service实现类
 */
@Service
public class OrderService implements IOrderService {
    private final  static Logger logger= LogManager.getLogger(IOrderService.class);
    @Autowired
    private IOrdersDao ordersDao;
    @Override
    public void addOrder(Order order) {

        ordersDao.addOrder(order);

    }
}
