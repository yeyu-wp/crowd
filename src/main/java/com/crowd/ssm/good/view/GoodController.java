package com.crowd.ssm.good.view;

import com.crowd.ssm.good.service.IGoodService;
import com.crowd.ssm.good.service.bo.ADV;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.money.service.IMoneyService;
import com.crowd.ssm.money.service.bo.Money;
import com.crowd.ssm.user.service.IUserService;
import com.crowd.ssm.user.service.bo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/good")
public class GoodController {
	private static final Logger logger = LogManager.getLogger(GoodController.class);
	@Autowired
	private IGoodService goodService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IMoneyService moneyService;

	@RequestMapping("/addGood")
	public String addGood(Good good, @RequestParam("xmfile") MultipartFile file, @RequestParam("xqfile") MultipartFile file1, Model model) throws Exception {

//		设置为用户发起的状态
		good.setGoodAndUserStatus(3);
		logger.info("===代码执行====");
		logger.info(file);
		logger.info(file1);
		if (!file.isEmpty() && !file1.isEmpty()) {
			logger.info("==file===" + file.getOriginalFilename());
			logger.info("==file1===" + file1.getOriginalFilename());
		//使用的是绝对路径

			file.transferTo(new File("E:\\java\\ssm项目\\SSM\\crowd\\src\\main\\webapp\\resource\\img\\" + file.getOriginalFilename()));
			file1.transferTo(new File("E:\\java\\ssm项目\\SSM\\crowd\\src\\main\\webapp\\resource\\img\\" + file1.getOriginalFilename()));

			/*file.transferTo(new File("H:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file.getOriginalFilename()));
			file1.transferTo(new File("H:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file1.getOriginalFilename()));

			file.transferTo(new File("d:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file.getOriginalFilename()));
			file1.transferTo(new File("d:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file1.getOriginalFilename()));*/
	}

			/*file.transferTo(new File("d:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file.getOriginalFilename()));
			file1.transferTo(new File("d:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file1.getOriginalFilename()));
*/

			/*file.transferTo(new File("h:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file.getOriginalFilename()));
			file1.transferTo(new File("h:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file1.getOriginalFilename()));
*/

		//添加物品
		good.setGoodImgUrl(file.getOriginalFilename());
		good.setGoodDescImg(file1.getOriginalFilename());
		goodService.addGood(good);
		logger.info("==添加的Good信息===" + good);
		//中间表关系
		logger.info("==添加的Good信息===" + good);
		//传给回报设置的id
		int goodId = good.getGoodId();
		logger.info("==========goodid=================" + goodId);
		model.addAttribute("goodId", goodId);
		logger.info("==========goodid================="+goodId);
		model.addAttribute("goodId",goodId);
		//传给回报设置的目标金额
		double goodPrice = good.getGoodPrice();
		logger.info("==========goodid================="+goodId);
		logger.info("==========goodPrice================="+goodPrice);
		model.addAttribute("goodId",goodId);
		model.addAttribute("goodPrice",goodPrice);
		goodService.addUserAndGood(good);
		return "redirect:../user/reward/findAll?goodId="+goodId+"&goodPrice="+goodPrice;
	}


	//显示物品详情
	@RequestMapping("/details/{goodId}")
	public String details(@PathVariable int goodId, Model model) {
		List<Good> details = goodService.details(goodId);
		//根据物品Id拿到具体发起的发起者信息
		User user = goodService.getUserInfoByGoodId(goodId);
//		通过userId去获取用户的公司信息
		User user1 = userService.findUserById(user);
		model.addAttribute("user", user1);
		for (Good detail : details) {
			//物品到期时间的业务
//		获取到物品的创建时间
			Date goodStartDate = detail.getGoodStartDate();
//		把日期转换为long类型
			long goodDate = detail.getGoodDate();
			logger.info("==goodDate==" + goodDate);
			long startDateTime = goodStartDate.getTime();
			//一天24*60*60*1000毫秒
			long endtime = startDateTime + (goodDate * 24 * 60 * 60 * 1000);
			logger.info("===endtime====" + endtime);
			//项目结束时间
			Date haveDate = (new Date(endtime));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String format = sdf.format(haveDate);
			//发送给前端页面 使用ajax做时间处理
			model.addAttribute("haveDate", format);
			model.addAttribute("goods", detail);

			logger.info("-------支持的用户是：------------" + user1);

			List<Money> moneys = moneyService.getMoneyByGoodId(goodId);
			model.addAttribute("money", moneys);
			for (Money money : moneys) {
				logger.info("*******************************"+money);
			}
		}


		return "project";
	}

	//跳转到更多
	@RequestMapping("/projects")
	public String projects() {
		return "projects";
	}
	//置顶项目
	@RequestMapping("/doUp")
	public String doUp( int goodId){
		goodService.doUp(goodId);
		//修改完之后重定向到myProperty
		return "redirect:../user/myProperty";
	}
	@RequestMapping("/addADV")
		public String addADV(ADV adv){
		ADV adv1 = new ADV();
		logger.info("-=-"+adv.getUserId()+"------------"+adv.getGoodId());
		adv1.setUserId(adv.getUserId());
		adv1.setGoodId(adv.getGoodId());
		goodService.addADV(adv1);
		logger.info("====baocuo======");
		return "redirect:../user/myProperty";
	}
}
