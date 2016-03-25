package com.zy.shiro;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.zy.user.entities.User;
import com.zy.user.services.UserService;

/**
 * 自定义的指定Shiro验证用户登录的类
 * 
 * @see 在本例中定义了2个用户:jadyer和玄玉,jadyer具有admin角色和admin:manage权限,玄玉不具有任何角色和权限
 * @create Sep 29, 2013 3:15:31 PM
 * @author 玄玉<http://blog.csdn.net/jadyer>
 */
public class MyRealm extends AuthorizingRealm {
	// 逻辑错误日志
	private static Logger log = Logger.getLogger(MyRealm.class);


	@Autowired
	private UserService userService;

	/**
	 * 为当前登录的Subject授予角色和权限
	 * 
	 * @see 经测试:本例中该方法的调用时机为需授权资源被访问时
	 * @see 经测试:并且每次访问需授权资源时都会执行该方法中的逻辑,这表明本例中默认并未启用AuthorizationCache
	 * @see 个人感觉若使用了Spring3
	 *      .1开始提供的ConcurrentMapCache支持,则可灵活决定是否启用AuthorizationCache
	 * @see 比如说这里从数据库获取权限信息时,先去访问Spring3.1提供的缓存,而不使用Shior提供的AuthorizationCache
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
//		String currentUsername = (String) super
//				.getAvailablePrincipal(principals);
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~");
		
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		simpleAuthorInfo.addRole("admin");
		// 添加权限
		simpleAuthorInfo.addStringPermission("admin");
		return simpleAuthorInfo;
		// Admin admin = iloginService.selectByPrimaryKey(currentUsername);
		// log.info(admin.getUsername() + "真实姓名:" + admin.getRealname() + " ");

		// List<String> roleList = new ArrayList<String>();
		// List<String> permissionList = new ArrayList<String>();
		// 从数据库中获取当前登录用户的详细信息
		// User user = userService.getByUsername(currentUsername);
		// if(null != user){
		// //实体类User中包含有用户角色的实体类信息
		// if(null!=user.getRoles() && user.getRoles().size()>0){
		// //获取当前登录用户的角色
		// for(Role role : user.getRoles()){
		// roleList.add(role.getName());
		// //实体类Role中包含有角色权限的实体类信息
		// if(null!=role.getPermissions() && role.getPermissions().size()>0){
		// //获取权限
		// for(Permission pmss : role.getPermissions()){
		// if(!StringUtils.isEmpty(pmss.getPermission())){
		// permissionList.add(pmss.getPermission());
		// }
		// }
		// }
		// }
		// }
		// }else{
		// throw new AuthorizationException();
		// }
		// //为当前用户设置角色和权限
		// SimpleAuthorizationInfo simpleAuthorInfo = new
		// SimpleAuthorizationInfo();
		// simpleAuthorInfo.addRoles(roleList);
		// simpleAuthorInfo.addStringPermissions(permissionList);
		// 实际中可能会像上面注释的那样从数据库取得
//		if (null != currentUsername && "jadyer".equals(currentUsername)) {
//			// 添加一个角色,不是配置意义上的添加,而是证明该用户拥有admin角色
//			simpleAuthorInfo.addRole("admin");
//			// 添加权限
//			simpleAuthorInfo.addStringPermission("admin:manage");
//			System.out.println("已为用户[jadyer]赋予了[admin]角色和[admin:manage]权限");
//			return simpleAuthorInfo;
//		} else if (null != currentUsername && "玄玉".equals(currentUsername)) {
//			System.out.println("当前用户[玄玉]无授权");
//			return simpleAuthorInfo;
//		}
//		// 若该方法什么都不做直接返回null的话,就会导致任何用户访问/admin/listUser.jsp时都会自动跳转到unauthorizedUrl指定的地址
//		// 详见applicationContext.xml中的<bean id="shiroFilter">的配置
//		return null;
	}

	/**
	 * 验证当前登录的Subject
	 * 
	 * @see 经测试:本例中该方法的调用时机为LoginController.login()方法中执行Subject.login()时
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {

		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		System.out.println("验证当前Subject时获取到token为"
				+ ReflectionToStringBuilder.toString(token,
						ToStringStyle.MULTI_LINE_STYLE));
		
		User user = userService.selectByPrimaryKey(token.getUsername());
		if (user == null) {
			return null;
		} else {
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
					user.getUsername(), user.getPassword(), this.getName());
			this.setSession("user", user);
			return authcInfo;
		}

	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out
					.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}