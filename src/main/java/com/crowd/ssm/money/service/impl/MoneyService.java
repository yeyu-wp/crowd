package com.crowd.ssm.money.service.impl;

import com.crowd.ssm.money.dao.IMoneyDao;
import com.crowd.ssm.money.service.IMoneyService;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.money.view.MoneyController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MoneyService implements IMoneyService {
    private final  static Logger logger= LogManager.getLogger(MoneyController.class);

    @Autowired
    private IMoneyDao moneyDao;
  /*  @Override
    public List<Money> getMoneyType() {
        return moneyDao.getMoneyType();
    }*/

    @Override
    public Money getMoneyById(int id) {
        return moneyDao.getMoneyById(id);
    }

    @Override
    public List<Money> getMoneyByGoodId(int goodId) {
        logger.info("========方法调用到了这里");
        List<Money> monies=moneyDao.getMoneyByGoodId(goodId);
        logger.info("==================="+monies);
        return moneyDao.getMoneyByGoodId(goodId);

    }
}
