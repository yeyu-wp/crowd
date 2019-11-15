package com.crowd.ssm.money.service;

import com.crowd.ssm.money.service.bo.Money;

import java.util.List;

public interface IMoneyService {
  /*  List<Money> getMoneyType();*/
    Money getMoneyById(int id);
    List<Money> getMoneyByGoodId(int goodId);
}
