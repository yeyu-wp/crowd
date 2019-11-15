package com.crowd.ssm.good.service.impl;

import com.crowd.ssm.good.dao.IGoodDao;
import com.crowd.ssm.good.service.IGoodService;
import com.crowd.ssm.good.service.bo.ADV;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.service.bo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodService implements IGoodService {
	@Autowired
	private IGoodDao goodDao;

	@Override
	public void doDown(int goodId) {

		goodDao.updateGoodDown(goodId);
		goodDao.updateAdvStatus1(goodId);
	}


	@Override
    public List<ADV> selectAdv(int startIndex,int pageSize) {

        return goodDao.selectAdv(startIndex,pageSize);
    }

	@Override
	public Integer selectADVCount() {
		return goodDao.selectADVCount();
	}

	@Override
	public void addADV(ADV adv) {
		System.out.println("=====传过去的参数是"+adv.getGoodId()+"-------------"+adv.getUserId());
		goodDao.addADV(adv);
	}

	@Override
	public void doUp(int goodId) {

    	goodDao.updateGoodTop(goodId);
    	goodDao.updateAdvStatus(goodId);
	}


	@Override
	public void addGood(Good good) {
		System.out.println("===00==="+good);
		goodDao.addGood(good);
	}

	@Override
	public List<Good> selectAllGood() {

		return goodDao.selectAllGood();
	}

	@Override
	public List<Good> details(int goodId) {
		return goodDao.selectGoodByGoodId(goodId);
	}

	@Override
	public User getUserInfoByGoodId(int goodId) {
		System.out.println("===商品的id==="+goodId);
		User user = goodDao.selectUserByGoodId(goodId);
		System.out.println("===userid=="+user);
		return user;
	}

	@Override
	public void addUserAndGood(Good good) {
		goodDao.addUserAndGood(good);
	}

}
