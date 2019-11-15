package com.crowd.ssm.user.service.impl;

import com.crowd.ssm.good.dao.IGoodDao;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.dao.IUserDao;
import com.crowd.ssm.user.service.IUserService;
import com.crowd.ssm.user.service.bo.Person;
import com.crowd.ssm.user.service.bo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements IUserService {
	@Override
	public List<User> selectUserNameById(int userId) {
		return userDao.selectUserNameById(userId);
	}

	@Autowired
	private IUserDao userDao;
	@Autowired
	private IGoodDao goodDao;

	@Override
	public void register(User user) {
		userDao.addUser(user);
	}

	@Override
	public User login(String userName) {
		User user = userDao.selectUserNameByName(userName);
		System.out.println(user);
		return user;
	}

	@Override
	public void addUserInfo(Person person) {
		userDao.addUserInfo(person);
	}

	@Override
	public void updateUserAccttypeById(int userId) {
		userDao.updateUserAccttypeById(userId);
	}

	@Override
	public void upUserAndGoodStatus(int userId, int goodId) {
		goodDao.upUserAndGoodStatus(userId,goodId);
	}

	@Override
	public List<Good> showCrowd(int userId) {
		List<Good> goods = goodDao.selectGoodById(userId);
		System.out.println(goods);
		return goods;
	}

	@Override
	public List<User> findAllUser() {
		return userDao.findAllUser();
	}

	@Override
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public void delUser(Integer userId) {
		userDao.delUser(userId);
	}

	@Override
	public User findUserById(User user) {
		return userDao.findUserById(user);
	}

	@Override
	public void updUserById(User user) {
		userDao.updUserById(user);
	}

	@Override
	public List<User> selectUserByName(String userName) {
		return userDao.selectUserByName(userName);
	}

	@Override
	public User getUserAccttypeByUserId(int userId) {
		return userDao.selectUserById(userId);
	}

	@Override
	public void deleteByBath(List<User> users) {
		userDao.deleteByBath(users);
	}
}
