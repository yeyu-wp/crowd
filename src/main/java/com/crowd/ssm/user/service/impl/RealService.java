package com.crowd.ssm.user.service.impl;

import com.crowd.ssm.user.dao.IRealDao;
import com.crowd.ssm.user.dao.IUserDao;
import com.crowd.ssm.user.service.IRealService;
import com.crowd.ssm.user.service.bo.Real;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RealService implements IRealService {

    @Autowired
    private IRealDao realDao;
    @Override
    public List<Real> findAllReal() {
        return realDao.findAllReal();
    }

    @Override
    public void delReal(Integer prId) {
        realDao.delReal(prId);
    }
}
