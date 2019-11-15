package com.crowd.ssm.reward.view;

import com.crowd.ssm.reward.service.IRewardService;
import com.crowd.ssm.reward.service.bo.Reward;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * 回报 Controller
 */
@Controller
@RequestMapping("/user/reward")
public class RewardController {
    private static final Logger logger= LogManager.getLogger(RewardController.class);

    @Autowired
    private IRewardService rewardService;

    //添加一个回报（回报设置）@RequestParam("goodid")int goodid,@RequestParam("goodPrice") double goodPrice,
    @RequestMapping("/addReward")
    public String addReward(Reward reward, @RequestParam("goodPrice") double goodPrice, HttpServletResponse response,Model model) throws IOException {
        logger.info("从页面拿到的添加的回报数据----"+reward);
        rewardService.addReward(reward);
        float money = reward.getMoney();
        int num = reward.getNum();
        logger.info("支付金额为："+money);
        logger.info("限购金额为："+num);
        //添加了一个回报后，用目标金额-支付金额×单笔限购
        Double goodPrices=goodPrice-(money*num);
        logger.info("运算后的钱数："+goodPrices);
        //如果目标金额小于等于0，则显示不能添加回报设置了
        if (goodPrice>0){
            //将运算后的钱数传到前台
            model.addAttribute("qian",goodPrices);
        }else {
            response.getWriter().write("不能再添加回报项啦!");
        }
        int goodid = reward.getGoodId();
        return "forward:/user/reward/findAll?goodid="+goodid+"&goodPrice="+goodPrices;
        /*return "start-step-4";*/
    }

    //根据当前用户的id查询已添加的回报设置
    @RequestMapping(value="/findAll")
    public String findAll(@RequestParam ("goodId")int goodId,@RequestParam("goodPrice")double goodPrice, Reward reward, Model model){
        logger.info("--进来查询所有回报方法-----当前项目id为"+goodId);
        logger.info("--进来查询所有回报方法-----当前项目目标金额为"+goodPrice);
        //将goodPrice传到前台
        model.addAttribute("goodPrice",goodPrice);
        //将传进来的goodid传到前台
        model.addAttribute("goodid",goodId);
        logger.info("当前项目id为+++"+goodId);
        ////根据当前用户的id查询已添加的回报设置
        List<Reward> allReward = rewardService.findAll(goodId);
        model.addAttribute("allReward",allReward);
        logger.info("--查到所有回报为-----"+allReward);
        return "start-step-2";
    }

    //删除一个回报信息
    @RequestMapping("/deleteReward")
    public String deleteReward(@RequestParam("id")int id,@RequestParam("goodid")int goodid,@RequestParam("goodPrice")double goodPrice,Reward reward,Model model){
        //通过id查询回报信息，然后返回对象，查询对应的支付金额和回报数量
        Reward rewardById = rewardService.findRewardById(id);
        //通过对象拿到支付金额和回报数量
        float money = rewardById.getMoney();
        int num = rewardById.getNum();
        logger.info("删除时，拿到的支付金额="+money+"，回报数量="+num);
        //拿到支付金额和回报数量后，相乘获得当前总金额
        float zong = money*num;
        logger.info("money*num="+zong);
        //然后用zong 加上goodPrice，就返回了删除前的最大金额
        double aimMoney = zong+goodPrice;
        logger.info("aimMoney="+aimMoney);
        //将aimMoney传给前台,前台接收到以后传给重新定义的页面
        /*model.addAttribute("aimMoney",aimMoney);*/
        rewardService.deleteReward(id);
        logger.info("删除了id="+id);
        /*int goodId = reward.getGoodId();*/
        //删除后回到当前页面
        return "forward:/user/reward/findAll?goodId="+goodid+"&goodPrice="+aimMoney;
    }

    //通过id查询一个回报信息
    @RequestMapping("/findRewardById")
    public String findRewardById(@RequestParam("id")int id,@RequestParam("goodid")int goodid,@RequestParam("goodPrice")double goodPrice,Model model){
        logger.info("点击修改传进来的id为---"+id);
        //先通过id查询一个回报信息,返回一个对象类型
        Reward reward=rewardService.findRewardById(id);
        model.addAttribute("reward",reward);
        logger.info("通过id查的回报内容"+reward);
        model.addAttribute("goodid",goodid);
        model.addAttribute("goodPrice",goodPrice);
        logger.info("goodid=="+goodid+"---------goodPrice---"+goodPrice);
        return "editReward";
    }

    //通过id修改一个回报信息
    @RequestMapping("/updateRewardById")
    public String updateRewardById(@RequestParam("id") int id,@RequestParam("goodid")int goodid,@RequestParam("goodPrice")double goodPrice,Reward reward,Model model){
        logger.info("修改时传进来的id为："+id);
        logger.info("修改时传进来的goodid为："+goodid);
        logger.info("修改时传进来的goodPrice为："+goodPrice);
        logger.info("修改时传进来的reward对象为："+reward);
        //调用通过id修改的方法
        rewardService.updateRewardById(reward);
        int goodId = reward.getGoodId();
        logger.info("执行了修改回报的方法-------");
        return "forward:/user/reward/findAll?goodId="+goodid+"&goodPrice="+goodPrice;
    }

    //第二步返回第一步
    @RequestMapping("/step1")
    public String step1(){
        return "start-step-1";
    }

    //进行下一步
    @RequestMapping("/step3")
    public String step3(@RequestParam("goodid")int goodid,@RequestParam("goodPrice")double goodPrice,Model model){
        logger.info("我是step3----"+goodid);
        model.addAttribute("goodid",goodid);
        model.addAttribute("goodPrice",goodPrice);
        return "start-step-3";
    }

    //第三步跳转到上一步
    @RequestMapping("/step2")
    public String step3(@RequestParam("goodid")int goodid,@RequestParam("goodPrice")double goodPrice,Reward reward,Model model){
        logger.info("从第三步到第二步---"+goodid);
        return "forward:/user/reward/findAll?goodId="+goodid+"&goodPrice="+goodPrice;
    }

    //进行下一步
    @RequestMapping("/step4")
    public String step4(){
        return "start-step-4";
    }
}
