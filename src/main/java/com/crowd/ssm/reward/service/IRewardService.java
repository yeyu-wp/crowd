package com.crowd.ssm.reward.service;

import com.crowd.ssm.reward.service.bo.Reward;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 回报 Service接口
 */
@Service
public interface IRewardService {
    //添加一个回报
    public void addReward(Reward reward);
    //查询回报
    public List<Reward> findAll(int id);
    //删除一个回报信息
    public void deleteReward(int id);
    //先通过id查询一个回报信息,返回一个对象类型
    public Reward findRewardById(int id);
    //通过id修改一个回报信息
    public void updateRewardById(Reward reward);
}
