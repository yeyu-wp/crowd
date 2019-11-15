package com.crowd.ssm.orders.service;

import com.crowd.ssm.orders.service.bo.Address;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service接口
 */

public interface IAddressService {
    List<Address> selectAddressByUserId(int id);
    void addAddress(Address address);
}
