package com.crowd.ssm.user.service.impl;

import com.crowd.ssm.user.dao.IAdverteDao;
import com.crowd.ssm.user.service.IAdverteService;
import com.crowd.ssm.user.service.bo.Adverte;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdverteService implements IAdverteService {

    @Autowired
    private IAdverteDao adverteDao;

    @Override
    public List<Adverte> findAll() {
        return adverteDao.findAll();
    }


}
