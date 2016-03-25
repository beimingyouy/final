<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<form id="demo_update_form" method="post">
		<table cellpadding="5">
			<tr>
				<td>用户名：</td>
				<td>${user.username}</td>
			</tr>
			<tr>
				<td>真名：</td>
				<td>${user.truename}</td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><select id="cc" class="easyui-combobox " name="sex" 
					style="width: 200px;" data-options=" editable:false"  >
						<option value="0"  
							<c:if test="${user.sex==0}"> selected="selected"
							</c:if>>男</option>
						<option value="1" <c:if test="${user.sex==1}"> selected="selected"
							</c:if>>女</option>

				</select></td>

			</tr>
			<tr>
				<td>密码：</td>
				<td><input class="easyui-validatebox" type="password"
					name="password" value = "${user.password}"
					data-options="required:true,validType:'username',missingMessage:'请输入密码！'"></input></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input class="easyui-textbox" type="text" name="address" value = "${user.address}"/></td>
			</tr>
			<tr><td><input type = "hidden"  name = "userid" value = "${user.userid}"/>
				<td><input class="button" type="button"  onclick="update_demo_submit()" value="提交" ></td>
				<td><input class="button" type="reset" value="重置" ></td>
			</tr>

		</table>
	</form>
</body>
</html>