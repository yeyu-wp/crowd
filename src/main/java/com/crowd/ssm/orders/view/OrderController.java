package com.crowd.ssm.orders.view;

import com.crowd.ssm.good.service.IGoodService;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.money.service.IMoneyService;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.money.view.MoneyController;
import com.crowd.ssm.orders.service.IAddressService;
import com.crowd.ssm.orders.service.IOrderService;
import com.crowd.ssm.orders.service.bo.Address;
import com.crowd.ssm.orders.service.bo.Order;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


/**
 * 订单 Controller
 */

@Controller
@RequestMapping("/reward")
public class OrderController {
	private final static Logger logger = LogManager.getLogger(MoneyController.class);
	@Autowired
	private IMoneyService moneyService;
	@Autowired
	private IAddressService addressService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IGoodService goodService;


   /* @RequestMapping("/address")
    public String addAddress(@RequestParam(value = "count") int count, @RequestParam("userid") int userid, @RequestParam("sum") int sum, @RequestParam("moneyid") int moneyid,@RequestParam("goodid") int goodid, Address address){
        logger.info("前端页面传过来的："+address);
        addressService.addAddress(address);
        logger.info("回报的数量是："+count);
        logger.info("获取到的用户id是："+userid);
        logger.info("获取到的总价是："+sum);
        logger.info("moneyid"+moneyid);
        logger.info("地址的goodid"+goodid);
        return "forward:/reward/submit?count="+count+"&userid="+userid+"&sum="+sum+"&moneyid="+moneyid+"&goodid"+goodid;
    }*/







    @RequestMapping("/address")
    public String addAddress(@RequestParam(value = "count") int count, @RequestParam("userid") int userid, @RequestParam("sum") int sum, @RequestParam("moneyid") int moneyid,@RequestParam("goodid") int goodid, Address address){
        logger.info("前端页面传过来的："+address);
        addressService.addAddress(address);
        logger.info("回报的数量是："+count);
        logger.info("获取到的用户id是："+userid);
        logger.info("获取到的总价是："+sum);
        logger.info("moneyid"+moneyid);
        logger.info("地址的goodid"+goodid);
        return "forward:/reward/submit?count="+count+"&userid="+userid+"&sum="+sum+"&moneyid="+moneyid+"&goodid"+goodid;
    }


	@RequestMapping("/submit")
	public String reward(@RequestParam("count") int count, @RequestParam("userid") int userid, @RequestParam("sum") int sum, @RequestParam("moneyid") int moneyid, @RequestParam("goodid") int goodid, Model model) {
		logger.info("回报的数量是：" + count);
		logger.info("获取到的用户id是：" + userid);
		logger.info("获取到的总价是：" + sum);
		logger.info("moneyid" + moneyid);
		logger.info("goodid在第二个页面" + goodid);
		List<Address> address = addressService.selectAddressByUserId(userid);
		for (Address address1 : address) {
			logger.info("获取到的地址是：" + address);
			model.addAttribute("address", address);
		}
		Money money = moneyService.getMoneyById(moneyid);
		logger.info("order获取到的钱数是：------" + money);
		model.addAttribute("money", money);
		model.addAttribute("sum", sum);
		model.addAttribute("count", count);
		model.addAttribute("moneyid", moneyid);
		model.addAttribute("goodid", goodid);
		return "pay-step-2";
	}

	@RequestMapping("/address")
	public String addAddress(@RequestParam(value = "count") int count, @RequestParam("userid") int userid, @RequestParam("sum") int sum, @RequestParam("moneyid") int moneyid, Address address) {
		logger.info("前端页面传过来的：" + address);
		addressService.addAddress(address);
		logger.info("回报的数量是：" + count);
		logger.info("获取到的用户id是：" + userid);
		logger.info("获取到的总价是：" + sum);
		logger.info("moneyid" + moneyid);

		return "forward:/reward/submit?count=" + count + "&userid=" + userid + "&sum=" + sum + "&moneyid=" + moneyid;
	}

	@RequestMapping("/payment")
	public String payment(Order order) {
		logger.info(order.getOrderSale());
		logger.info(order.getOrderRemark());
		logger.info(order.getUserId());
		logger.info(order.getCounts());
		logger.info("hhhhhhhhhhhhhhhhhhhhhhh" + order.getGoodId());
		logger.info(order);
		logger.info("支持的单价："+order.getOrderPrice());
		orderService.addOrder(order);
		int goodId = order.getGoodId();
		logger.info("=========goodid" + goodId);
		int userId = order.getUserId();
		List<Good> goods = goodService.details(goodId);
		int orderId = order.getOrderId();
		logger.info("===orderid"+orderId);
		for (Good good : goods) {
			//添加当前的订单id
			good.setOrderId(orderId);
			//拿到当前用户达到字段
			good.setUserId(userId);
			//设置支持的字段属性1
			good.setGoodAndUserStatus(1);
			//把当前的用户和物品添加到中间表中
			goodService.addUserAndGood(good);
		}
		return "/pay-step-4";
	}

}
