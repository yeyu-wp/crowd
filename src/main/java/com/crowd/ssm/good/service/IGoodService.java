package com.crowd.ssm.good.service;

import com.crowd.ssm.good.service.bo.ADV;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.user.service.bo.User;

import java.util.List;
import java.util.Map;

public interface IGoodService {
	void addGood(Good good);

	void addUserAndGood(Good good);

	List<Good> selectAllGood();

	List<Good> details(int goodId);

	User getUserInfoByGoodId(int goodId);
//置顶项目
	void doUp(int goodId);


	List<ADV> selectAdv(int startIndex,int pageSize);

	void addADV(ADV adv);


	void doDown(int goodId);


	Integer selectADVCount();


}
