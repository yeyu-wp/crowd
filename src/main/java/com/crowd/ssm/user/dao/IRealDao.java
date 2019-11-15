package com.crowd.ssm.user.dao;

import com.crowd.ssm.user.service.bo.Real;


import java.util.List;

public interface IRealDao {

    public List<Real> findAllReal();

    public void delReal(Integer prId);

}
