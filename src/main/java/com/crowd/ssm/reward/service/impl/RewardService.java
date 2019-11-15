package com.crowd.ssm.reward.service.impl;

import com.crowd.ssm.reward.dao.IRewardDao;
import com.crowd.ssm.reward.service.IRewardService;
import com.crowd.ssm.reward.service.bo.Reward;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service实现类
 */
@Service
public class RewardService implements IRewardService {

    private static final Logger logger= LogManager.getLogger(RewardService.class);

    @Autowired
    private IRewardDao rewardDao;

    //添加一个回报
    @Override
    public void addReward(Reward reward) {
        rewardDao.addReward(reward);
    }

    //查询回报
    @Override
    public List<Reward> findAll(int id) {
        return rewardDao.findAll(id);
    }

    //删除一个回报信息
    @Override
    public void deleteReward(int id) {
        rewardDao.deleteReward(id);
    }

    //先通过id查询一个回报信息,返回一个对象类型
    @Override
    public Reward findRewardById(int id) {
        return rewardDao.findRewardById(id);
    }

    //通过id修改一个回报信息
    @Override
    public void updateRewardById(Reward reward) {
        rewardDao.updateRewardById(reward);
    }

}
