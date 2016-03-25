package com.zy.login.web.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.zy.login.web.view.View;
import com.zy.role.entities.Menu;
import com.zy.role.services.MenuService;
import com.zy.user.entities.User;
import com.zy.user.services.UserService;
import com.zy.util.VerifyCodeUtil;
  
/** 
 * 本例中用到的jar文件如下 
 * @see aopalliance.jar 
 * @see commons-lang3-3.1.jar 
 * @see commons-logging-1.1.2.jar 
 * @see log4j-1.2.17.jar 
 * @see shiro-all-1.2.2.jar 
 * @see slf4j-api-1.7.5.jar 
 * @see slf4j-log4j12-1.7.5.jar 
 * @see spring-aop-3.2.4.RELEASE.jar 
 * @see spring-beans-3.2.4.RELEASE.jar 
 * @see spring-context-3.2.4.RELEASE.jar 
 * @see spring-core-3.2.4.RELEASE.jar 
 * @see spring-expression-3.2.4.RELEASE.jar 
 * @see spring-jdbc-3.2.4.RELEASE.jar 
 * @see spring-oxm-3.2.4.RELEASE.jar 
 * @see spring-tx-3.2.4.RELEASE.jar 
 * @see spring-web-3.2.4.RELEASE.jar 
 * @see spring-webmvc-3.2.4.RELEASE.jar 
 * @create Sep 30, 2013 11:10:06 PM 
 * @author 玄玉<http://blog.csdn.net/jadyer> 
 */  
@Controller  
@RequestMapping("admin")  
public class LoginController {  
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
    /** 
     * 获取验证码图片和文本(验证码文本会保存在HttpSession中) 
     */  
    @RequestMapping("/getVerifyCodeImage")  
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        //设置页面不缓存  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);  
        //将验证码放到HttpSession里面  
        request.getSession().setAttribute("verifyCode", verifyCode);  
        System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");  
        //设置输出的内容的类型为JPEG图像  
        response.setContentType("image/jpeg");  
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);  
        //写给浏览器  
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());  
    }  
      
      
    /** 
     * 用户登录 
     */  
    @RequestMapping(value="/login", method=RequestMethod.POST)  
    public String login(HttpServletRequest request,HttpSession session,Model model){  
        String resultPageURL = InternalResourceViewResolver.FORWARD_URL_PREFIX + "/";  
        String username = request.getParameter("username");  
        String password = request.getParameter("password");  
        //获取HttpSession中的验证码  
        String verifyCode = (String)request.getSession().getAttribute("verifyCode");  
        //获取用户请求表单中输入的验证码  
        String submitCode = WebUtils.getCleanParam(request, "verifyCode");  
        System.out.println("用户[" + username + "]登录时输入的验证码为[" + submitCode + "],HttpSession中的验证码为[" + verifyCode + "]");  
        if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(verifyCode, submitCode.toLowerCase())){  
            request.setAttribute("message_login", "验证码不正确");  
            return resultPageURL;  
        }
        
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);  
        token.setRememberMe(false);  
        System.out.println("为了验证登录用户而封装的token为" + ReflectionToStringBuilder.toString(token, ToStringStyle.MULTI_LINE_STYLE));  
        //获取当前的Subject  
        Subject currentUser = SecurityUtils.getSubject();   
        try {  
            //在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查  
            //每个Realm都能在必要时对提交的AuthenticationTokens作出反应  
            //所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法  
            System.out.println("对用户[" + username + "]进行登录验证..验证开始");  
            currentUser.login(token);  
            System.out.println("对用户[" + username + "]进行登录验证..验证通过");  
           
        }catch(UnknownAccountException uae){  
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,未知账户");  
            request.setAttribute("message_login", "未知账户");  
        }catch(IncorrectCredentialsException ice){  
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误的凭证");  
            request.setAttribute("message_login", "密码不正确");  
        }catch(LockedAccountException lae){  
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,账户已锁定");  
            request.setAttribute("message_login", "账户已锁定");  
        }catch(ExcessiveAttemptsException eae){  
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,错误次数过多");  
            request.setAttribute("message_login", "用户名或密码错误次数过多");  
        }catch(AuthenticationException ae){  
            //通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景  
            System.out.println("对用户[" + username + "]进行登录验证..验证未通过,堆栈轨迹如下");  
            ae.printStackTrace();  
            request.setAttribute("message_login", "用户名或密码不正确");  
        }  
        //验证是否登录成功  
        if(currentUser.isAuthenticated()){  
            System.out.println("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");  
            User user= (User) session.getAttribute("user");
    		Long userid  = user.getUserid();
    		List<Menu> mainMap = new ArrayList<Menu>();
    		mainMap=this.menuService.getMainList(userid);
    		model.addAttribute("mainMap", mainMap);
        }else{  
            token.clear();  
            return View.LOGIN.LOGIN;  
        }  
        return View.LOGIN.ADMIN_MAIN;  
    }  
	
	@RequestMapping(value = "loadMenu.do", method = RequestMethod.GET)
	public @ResponseBody List<Map<String, Object>> loadMenu(Long menu_id, HttpSession session) throws IOException {
		
		User user = (User) session.getAttribute("user");
		Long userId = user.getUserid();
		 List<Map<String, Object>> menuTreeList = menuService.getMenuTreeByParentId(userId,menu_id);
		 return menuTreeList;
	}
      
    /** 
     * 用户登出 
     */  
    @RequestMapping("/logout")  
    public String logout(HttpServletRequest request){  
         SecurityUtils.getSubject().logout();  
         return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/";  
    }  
}  