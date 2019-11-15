package com.crowd.ssm.user.view;

import com.crowd.ssm.good.service.IGoodService;
import com.crowd.ssm.good.service.bo.Good;
import com.crowd.ssm.user.service.IAdverteService;
import com.crowd.ssm.user.service.IRealService;
import com.crowd.ssm.user.service.IRoleService;
import com.crowd.ssm.user.service.IUserService;

import com.crowd.ssm.user.service.bo.Adverte;
import com.crowd.ssm.user.service.bo.Real;

import com.crowd.ssm.user.service.bo.Person;

import com.crowd.ssm.user.service.bo.Role;
import com.crowd.ssm.user.service.bo.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;


@Controller
@RequestMapping("/user")
@SessionAttributes("CURRENT_USER")
public class UserController<list> {
	private static final Logger logger = LogManager.getLogger(UserController.class);
	@Autowired
	private IUserService userService;
	@Autowired
	private IGoodService goodService;

	@Autowired
	private IRoleService roleService;

	@Autowired
	private IRealService realService;

	@Autowired
	private IAdverteService adverteService;

	@RequestMapping("/viewname/{view}")
	public String view(@PathVariable String view) {
		return view;
	}
//登录验证
	@RequestMapping("/login")
	public String login(User user, Model model, HttpServletRequest request,HttpSession session) {
		String inputVerifyCode = request.getParameter("user_input_verifyCode");
		System.out.println("用户输入的验证码值------>"
				+ inputVerifyCode);
		String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
		System.out.println("Session中的验证码值------>"
				+ verifyCodeValue);
		if (verifyCodeValue.equals(inputVerifyCode.toUpperCase())) {
			System.out.println("用户输入的验证码和图片生成的验证码相等");
			logger.info("==登录的用户名是" + user.getUserName());
			String userName = user.getUserName();
			User user1 = userService.login(userName);
			logger.info("====" + user1);
			if (user1 == null) {
				model.addAttribute("msg", "用户名或密码错误");
				return "login";
//				return "redirect:/user/viewname/reg";
			} else {
				if (user1.getPassword().equals(user.getPassword())) {
					//如果密码正确 存入session中
					logger.info("===存入Session==" + user1);
					model.addAttribute("CURRENT_USER", user1);
					//根据状态判断用户类型0为管理员进入后台界面   1为用户进入前台页面
					if (user1.getUserType() == 0) {
						return "main";
					} else {

						return "member";
					}
				} else {
					model.addAttribute("msg", "用户名或密码错误");
					return "login";

				}
			}
		}
		else {
			model.addAttribute("msg", "验证码错误");
			return "login";
		}
	}

	@RequestMapping("/register")
	public String register(User user,Model model) {


		if(!user.getUserName().equals("")){
		if(!user.getPassword().equals("")){
			user.setUserType(1);

			logger.info("===注册的用户是" + user+user.getUserName());
			userService.register(user);
			return "login";
		}
			model.addAttribute("msg", "账号不能为空");
			return "redirect:/user/viewname/reg";
		}else{
			model.addAttribute("msg", "密码不能为空");
			return "redirect:/user/viewname/reg";
		}
	}

	@RequestMapping("/mycrowd")
	public String myCrowd(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("CURRENT_USER");
		//拿到当前用户的id
		int userId = currentUser.getUserId();
		logger.info(userId);
		//通过id去拿到用户所有有关联的物品信息
		List<Good> goods = userService.showCrowd(currentUser.getUserId());
          int i=0;
		for (Good good : goods) {
			logger.info(good);
			int goodAndUserStatus = good.getGoodAndUserStatus();
			logger.info("==goodAndUserStatus=="+goodAndUserStatus);
			logger.info("==order_id=="+good.getOrderId());
			//拿到订单id去查找订单里面对应的销量和单价和订单的创建日期
			int orderSale = good.getOrderSale();
			int counts = good.getCounts();
			Date orderCreateDate = good.getOrderCreateDate();
			logger.info("===orderSale=="+orderSale);
			logger.info("===counts=="+counts);
		}
		logger.info("====goods===" + goods.size());

		model.addAttribute("goods", goods);
		return "minecrowdfunding";
	}

	@RequestMapping("/myProperty")
	public String myProperty() {
		return "member";
	}

	//首页展示
	@RequestMapping("/index")
	public String index(Model model) {
		List<Good> goods = goodService.selectAllGood();
		model.addAttribute("goods", goods);
		return "index";
	}

	//查用户
	@RequestMapping(value = "/finAll",method = RequestMethod.GET)
	public String finAll(Model model) {
		List<User> users = userService.findAllUser();
		model.addAttribute("user", users);
		logger.info(users.size() + "/-*/9++98+8*/-+8+");
		return "user";
	}

	//添加
	@RequestMapping("/toAdd")
	public String toAdd() {
		return "add";
	}
	//添加


	@RequestMapping("/saveUser")
	public String saveUser(User user, Model model){
		if(!user.getUserName().equals("")){
			if(!user.getPassword().equals("")){
				userService.saveUser(user);
				System.out.println(user);

			return  "redirect:/user/finAll";


		}else{
				model.addAttribute("msg", "密码不能为空");

				return  "redirect:/user/toAdd";}


		}else{
			model.addAttribute("msg", "账号不能为空");

            return  "redirect:/user/toAdd";


		}


	}
	//删除用户

	@RequestMapping("/delUser")
	public String delUser(Integer userId) throws IOException {



		userService.delUser(userId);

		System.out.println("--------删除------");

		return "redirect:/user/finAll";
	}

	//修改用户
	@RequestMapping("/findUserById")
	public String findUserById(Model model, User user) {
		User userById = userService.findUserById(user);
		model.addAttribute("userById", userById);
		return "edit";
	}

	//修改用户
	@RequestMapping("/updUserById")
	public String updUserById(User user, Model model) throws IOException {
		userService.updUserById(user);
		model.addAttribute("user", user);
		System.out.println("---------------------------------------修改------");
		return "redirect:/user/finAll";
	}

	//通过用户名查询用户
	@RequestMapping("/findLike")
	public String selectUserByName(String userName, Model model) {
		List<User> users = userService.selectUserByName(userName);
		model.addAttribute("user", users);
		System.out.println("----------" + users.size());

		return "user";
	}
	@RequestMapping(value = "/toMain", method = RequestMethod.GET)
	public String toMain(){
		return "main";
	}

	//实名认证判断
	@RequestMapping("/accttype/{userId}")
	public String accttype(@PathVariable int userId) {
		//使用userId来获取用户是否实名认证
		User accttypeByUserId = userService.getUserAccttypeByUserId(userId);
		logger.info("---------accttype--" + accttypeByUserId);
		int accttype = accttypeByUserId.getUserAccttype();
		logger.info("===实名认证-----" + accttype);
		if (accttype == 0) {
			//未进行实名认证则去实名
			return "accttype";
		} else {
			return "member";
		}
	}
	//进行实名认证
	@RequestMapping("/doAccttype")
	public String doAccttype(Person person, @RequestParam("img1") MultipartFile file)throws Exception{
		person.setPersonIdCardImg(file.getOriginalFilename());
		logger.info("====doAccttype======"+person);
		//如果图片不为空
		if (!file.isEmpty()){
			logger.info("==file===" + file.getOriginalFilename());
			file.transferTo(new File("H:/二阶段项目/SSM/crowd/src/main/webapp/resource/img/" + file.getOriginalFilename()));
		}
		userService.addUserInfo(person);
		//认证完成同时给user表的属性置位1
		int userId = person.getUserId();
		logger.info("===userId"+userId);
		userService.updateUserAccttypeById(userId);
		return "redirect:myProperty";
	}

	/**
	 * 角色管理
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/findAllRole")
	public String findAllRole(Model model){
		 List<Role> roles = roleService.findAllRole();
        System.out.println(roles.size()+"------------------------------------------------------");
		 model.addAttribute("role",roles);
		 return "role";
	}

	/**
	 * 角色管理结束
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/delRole")
	public String delRole(Integer roleId,HttpServletRequest request){
        System.out.println(roleId+"----------------");
        roleService.delRole(roleId);
		return "redirect:/user/findAllRole";
	}
//查找用户有的id
    @RequestMapping( "/findUserRole")
    public String  findUserRole(Model model,Integer userId){

	    System.out.println(userId+"---------------------");
        List<Role> roles = roleService.findUserRole(userId);


		//return "forward:/user/findAllRole";

		//return "redirect:/user/findAllRole";

        model.addAttribute("role",roles);
        return "assignRole";
    }
    @RequestMapping("/findUserNoRole")
    public String findUserNoRole(Model model){
        List<Role> role = roleService.findUserNoRole();
        model.addAttribute("role",role);
        return "adduserRole";
    }
    @RequestMapping("/addUserRole")
     public String addUSerRole(Role role){
	    Role role1=new Role();
        role1.setUserId(role.getUserId());
        role1.setRoleId(role.getRoleId());
        System.out.println(role1.getRoleId()+"------------------"+role1.getUserId());
        roleService.addUserRole(role1);
        return "redirect:/user/findUserRole";
    }
//    //查找用户没有的角色
//    @RequestMapping("/findUserNoRole")
//    public String find(int[] selectRole, Model model){
//
//
//        List<Role> list=new ArrayList<Role>();
//        for (int i = 0; i < selectRole.length; i++) {
//            Role role=new Role();
//            role.setRoleId(selectRole[i]);
//            list.add(role);
//        }
//
//        for (Role role : list) {
//            System.out.println("--------------"+role);
//        }
//        List<Role> roles=roleService.findUserNoRole(list);
//
//      model.addAttribute("role",roles);
//        return "adduserRole";
//
//    }

    //添加
    @RequestMapping("/toAddRole")
    public String toAddRole() {
        return "addrole";
    }
    //添加

	@RequestMapping("/toPer")
	public String toPer(){
		return "permission";
	}


    @RequestMapping("/saveRole")
    public String saveRole(Role role){

                roleService.saveRole(role);
                System.out.println(role);
                return  "redirect:/user/findAllRole";

    }

	//用户退出业务
	@RequestMapping("/exit")
	public String exit(HttpServletRequest request, SessionStatus sessionStatus) {
		//退出之后清空session
		HttpSession session = request.getSession();
		sessionStatus.setComplete();
		return "redirect:index";
	}
	/**
	 * 获取验证码
	 *
	 *
	 *
	 */
	@RequestMapping("/getVerifyCode")
	public void generate(HttpServletResponse response, HttpSession session) {
		System.out.println("--------------------");
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String verifyCodeValue = drawImg(output);
		System.out.println("生成的验证码=" + verifyCodeValue + "。*****************************************");
		session.setAttribute("verifyCodeValue", verifyCodeValue);
		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	/**
	 * 绘画验证码
	 *
	 * @param output
	 * @return
	 */

	private String drawImg(ByteArrayOutputStream output) {
		String code = "";
		// 随机产生4个字符
		for (int i = 0; i < 4; i++) {
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width, height,
				BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman", Font.PLAIN, 20);
		// 调用Graphics2D绘画验证码
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66, 2, 82);
		g.setColor(color);
		g.setBackground(new Color(226, 226, 240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int) x, (int) baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}

	/**
	 * 随机参数一个字符
	 *
	 * @return
	 */
	private char randomChar() {
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}
/**
 *
 * 验证码功能结束
 * *
 * */


    /**
     * 审批流程管理
     * @param model
     * @return
     */
	@RequestMapping("/toReal")
	public String toReal(Model model){
        List<Real> real = realService.findAllReal();
        model.addAttribute("real",real);
        return "auth_cert";
    }

    @RequestMapping("/delReal")
    public String delReal(Integer prId){

	    realService.delReal(prId);
	    return "forward:/user/toReal";
    }
    /**
     * 广告审核管理
     */
    @RequestMapping("/toAdv")
    public String toAdv(Model model){

        List<Adverte> advertes = adverteService.findAll();

        model.addAttribute("adverte",advertes);
        return "auth_adv";
    }


		//批量删除
	@RequestMapping("/deleteByBath")
	public void deleteByBath(int[] selectUser,HttpServletResponse response,HttpServletRequest request) throws IOException {
		List<User> list= new ArrayList<User>();
			for (int i = 0; i < selectUser.length; i++) {
				User user=new User();
				user.setUserId(selectUser[i]);
				list.add(user);
			}
			userService.deleteByBath(list);
		response.sendRedirect(request.getContextPath() + "/user/finAll");

	}


	//ajax做删除订单的处理
	@RequestMapping("/delOrder")
	@ResponseBody
	public String  delOrder(int userId,int goodId){
       //使用userID和goodId去修改user_good表中的status状态为0
		userService.upUserAndGoodStatus(userId,goodId);
		logger.info("=-===修改Status===完成");
		return "删除成功";
	}


}
