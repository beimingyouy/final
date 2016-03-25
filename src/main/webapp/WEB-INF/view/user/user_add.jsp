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
	<form id="demo_add_form" method="post">
		<table cellpadding="5">
			<tr>
				<td>用户名：</td>
				<td><input class="easyui-validatebox" type="text"
					name="username"
					data-options="required:true,missingMessage:'请输入用户名！'" /></td>
			</tr>
			<tr>
				<td>真实姓名：</td>
				<td><input class="easyui-validatebox" type="text"
					name="truename"
					data-options="required:true,validType:'username',missingMessage:'请输入用户名！'"></input></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><select id="cc" class="easyui-combobox" name="sex"
					style="width: 200px;">
						<option value="0" selected="selected">男</option>
						<option value="1">女</option>

				</select></td>

			</tr>
			<tr>
				<td>密码：</td>
				<td><input class="easyui-validatebox" type="password"
					name="password"
					data-options="required:true,validType:'username',missingMessage:'请输入密码！'"></input></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td><input class="easyui-textbox" type="text" name="address" /></td>
			</tr>
			<tr>
				<td><a id="sava_btn" href="javascript:void(0)"
					onclick="add_demo_submit()" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存数据</a></td>
				<td>	<a href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-reload',plain:false,onClick:function(){
							$('#demo_add_form').form('reset');}">重置</a></td>
			</tr>

		</table>
	</form>
</body>
</html>