package com.crowd.ssm.money.view;

import com.crowd.ssm.money.service.IMoneyService;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.orders.service.IAddressService;
import com.crowd.ssm.orders.service.bo.Address;
import com.crowd.ssm.user.service.IUserService;
import com.crowd.ssm.user.service.bo.User;
import com.sun.deploy.nativesandbox.comm.Response;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/money")
public class MoneyController {
    private final  static Logger logger= LogManager.getLogger(MoneyController.class);

    @Autowired
    private IMoneyService moneyService;
    @Autowired
    private IAddressService addressService;

 /* @RequestMapping("/moneytype")
      public String moneyType(Model model){
        List<Money> moneys=moneyService.getMoneyType();
        model.addAttribute("money",moneys);
        logger.info("*******************************"+moneys);
       return "project";
    }*/

    //确认回报内容
    @RequestMapping("/ordercontent")
    public String order(@RequestParam(value = "moneyid") int monyid,@RequestParam("goodid") int goodid,@RequestParam("moneynum") int moneynum, Model model){
       //float money=(Float)moneyService.getMoneyById(crowdId);
        Money money=moneyService.getMoneyById(monyid);
        logger.info("获取到的钱数是：------"+money);
        model.addAttribute("money",money);
        model.addAttribute("goodid",goodid);
        model.addAttribute("moneynum",moneynum);
        logger.info("moneynum+++++++++++++"+moneynum);
        return "pay-step-1";
    }
/*    //确认订单
    @RequestMapping("/reward")
    public String reward(@RequestParam ("count") int count,@RequestParam("userid") int userid,@RequestParam("sum") int sum,Model model){
        logger.info("回报的数量是："+count);
        logger.info("获取到的用户id是："+userid);
        logger.info("获取到的总价是："+sum);
        List<Address> address=addressService.selectAddressByUserId(userid);
        for (Address address1 : address) {
            logger.info("获取到的地址是："+address);
        model.addAttribute("address",address);
        }
        return "pay-step-2";
    }*/
}
