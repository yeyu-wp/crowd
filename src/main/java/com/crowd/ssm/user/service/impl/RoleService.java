package com.crowd.ssm.user.service.impl;

import com.crowd.ssm.user.dao.IRoleDao;
import com.crowd.ssm.user.service.IRoleService;
import com.crowd.ssm.user.service.bo.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> findAllRole() {

        return roleDao.findAllRole();
    }

    @Override
    public void delRole(Integer roleId) {
        roleDao.delRole(roleId);
    }

    @Override
    public List<Role> findUserRole(int userId) {
        return roleDao.findUserRole(userId);
    }

//    @Override
//    public List<Role> findUserNoRole(List<Role> roles) {
//       return roleDao.findUserNoRole(roles);
//    }

    @Override
    public void addUserRole(Role role) {
        roleDao.addUserRole(role);
    }

    @Override
    public List<Role> findUserNoRole() {
        return roleDao.findUserNoRole();
    }

    @Override
    public void saveRole(Role role) {
       roleDao.saveRole(role);
    }
}
