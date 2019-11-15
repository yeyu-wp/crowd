package com.crowd.ssm.reward.dao;

import com.crowd.ssm.reward.service.bo.Reward;

import java.util.List;

/**
 * 回报 Dao接口
 */
public interface IRewardDao {
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
