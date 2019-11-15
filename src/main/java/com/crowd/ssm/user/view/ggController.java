package com.crowd.ssm.user.view;

import com.crowd.ssm.good.service.IGoodService;

import com.crowd.ssm.good.service.bo.ADV;
import com.crowd.ssm.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/gg")
public class ggController {

	@Autowired
	private IGoodService goodService;
	@Autowired
	private IUserService userService;

	@RequestMapping("/selectAdv")
	public String selectAdv(Model model, int startIndex, int pageSize) {
		List<ADV> advs = goodService.selectAdv(startIndex, pageSize);
		Integer count = goodService.selectADVCount();
		System.out.println("======count======" + count);
		for (ADV adv : advs) {
			System.out.println(adv);
		}
		System.out.println(advs.size() + "kanwo------------------------------------");
		model.addAttribute("advs", advs);
		model.addAttribute("pageCount", count);
//总共的页码数
		int allPage;
		if (count % pageSize == 0)
			allPage = count / pageSize;
		else
			allPage = (count / pageSize) + 1;
		model.addAttribute("allPage", allPage);
		return "auth_adv";

	}

	@RequestMapping("/doUp")
	public String updateGoodTop(int goodId,int startIndex,int pageSize) {
		System.out.println();
		goodService.doUp(goodId);

		System.out.println("-------------------------修改");
		return "redirect:/gg/selectAdv?startIndex="+startIndex+"&pageSize="+pageSize;
	}

	@RequestMapping("/doDown")
	public String updateGoodTop1(int goodId,int startIndex,int pageSize) {
		System.out.println();
		goodService.doDown(goodId);

		System.out.println("-------------------------修改");
		return "redirect:/gg/selectAdv?startIndex="+startIndex+"&pageSize="+pageSize;
	}


}
