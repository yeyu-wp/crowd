package com.crowd.ssm.user.dao;

import com.crowd.ssm.user.service.bo.Adverte;
import com.crowd.ssm.user.service.bo.Real;

import java.util.List;

public interface IAdverteDao {

    public List<Adverte> findAll();

}
