package com.crowd.ssm.user.service;

import com.crowd.ssm.user.service.bo.Real;

import java.util.List;

public interface IRealService {

    public List<Real> findAllReal();

    public void delReal(Integer prId);
}
