package com.crowd.ssm.user.service;

import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.service.bo.Person;
import com.crowd.ssm.user.service.bo.User;

import java.util.List;

public interface IUserService {
	User login(String userName);

	void register(User user);

	/**
	 *
	 * @param userId
	 * @return
	 */
	List<Good> showCrowd(int userId);

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

	User getUserAccttypeByUserId(int userId);


	//批量删除用户
	void deleteByBath(List<User> users);



	void addUserInfo(Person person);

	void updateUserAccttypeById(int userId);

    List<User> selectUserNameById(int userId);

	void upUserAndGoodStatus(int userId, int goodId);
}
