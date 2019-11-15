package com.crowd.ssm.user.dao;

import com.crowd.ssm.user.service.bo.Person;
import com.crowd.ssm.user.service.bo.User;

import java.util.List;

public interface IUserDao {
	//判断登录
	User selectUserNameByName(String userName);
	//用户注册
	void addUser(User user);
	/**
	 * 查询所有用户信息
	 * @return
	 */
	List<User> findAllUser();

	/**
	 * 管理员添加用户
	 * @param user
	 */

	 void saveUser(User user);

	/**
	 * 删除用户
	 * @param userId
	 */
	 void delUser(Integer userId);
	/**
	 * 查询所有用户通过id
	 * @return
	 */
	 User findUserById(User user);

	/**
	 * 修改用户
	 * @param user
	 */
	 void updUserById(User user);

	 //通过用户名模糊查询

	List<User> selectUserByName(String userName);

	User selectUserById(int userId);


	//批量删除用户
	void deleteByBath(List<User> users);


	void addUserInfo(Person person);

	void updateUserAccttypeById(int userId);

	List<User> selectUserNameById(int userId);

}
