package com.crowd.ssm.orders.service.impl;

import com.crowd.ssm.orders.dao.IAddressDao;
import com.crowd.ssm.orders.service.IAddressService;
import com.crowd.ssm.orders.service.IOrderService;
import com.crowd.ssm.orders.service.bo.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service实现类
 */
@Service
public class AddressService implements IAddressService {

@Autowired
private IAddressDao addressDao;
    @Override
    public List<Address> selectAddressByUserId(int id) {
        return addressDao.selectAddressByUserId(id);
    }

    @Override
    public void addAddress(Address address) {
        addressDao.addAddress(address);
    }
}
