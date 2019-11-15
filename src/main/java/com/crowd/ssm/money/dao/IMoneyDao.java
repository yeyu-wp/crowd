package com.crowd.ssm.money.dao;

import com.crowd.ssm.money.service.bo.Money;

import java.util.List;

public interface IMoneyDao {
   /*  //获取
     List<Money> getMoneyType();*/
     //通过id获取钱数
     Money getMoneyById(int id);

     List<Money> getMoneyByGoodId(int goodId);
}
