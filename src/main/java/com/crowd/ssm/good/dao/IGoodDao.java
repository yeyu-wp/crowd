package com.crowd.ssm.good.dao;

import com.crowd.ssm.good.service.bo.ADV;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.user.service.bo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IGoodDao {
	void addGood(Good good);

	List<Good> selectGoodById(int userId);

	void addUserAndGood(Good good);

	List<Good> selectAllGood();

	List<Good> selectGoodByGoodId(int goodId);

	User selectUserByGoodId(int goodId);

	void updateGoodTop(int goodId);


	List<ADV> selectAdv(@Param("startIndex") int startIndex,@Param("pageSize") int pageSize);


	void updateAdvStatus(int goodId);

	void updateGoodDown(int goodId);

	void updateAdvStatus1(int goodId);

	void addADV(ADV adv);

	Integer selectADVCount();

	void upUserAndGoodStatus(@Param("userId")int userId,@Param("goodId") int goodId);
}
