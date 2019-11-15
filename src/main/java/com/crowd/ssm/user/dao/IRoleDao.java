package com.crowd.ssm.user.dao;

import com.crowd.ssm.user.service.bo.Role;


import java.util.List;

public interface IRoleDao {

     List<Role> findAllRole();

     void delRole(Integer roleId);

     void saveRole(Role role);
     //查找用户有的角色
     List<Role> findUserRole(int userId);

//     //查找用户没有的角色
//     List<Role> findUserNoRole(List<Role> roles);
     //查找用户没有的角色
     List<Role> findUserNoRole();

     void delUserRole(int userId,int roleId);

     //角色添加用户
     void addUserRole(Role role);

}
