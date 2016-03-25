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
				<td>name：</td>
				<td><input class="easyui-validatebox" type="text"
					name="name"
					data-options="required:true,missingMessage:'请输入用户名！'" /></td>
			</tr>
			<tr>
				<td>description：</td>
				<td><input class="easyui-validatebox" type="text"
					name="description"
					data-options="required:true,validType:'username',missingMessage:'请输入描述！'"></input></td>
			</tr>
			<tr>
				<td><input class="button" type="button"  onclick="add_demo_submit()" value="提交" ></td>
				<td><input class="button" type="reset" value="重置" ></td>
			</tr>

		</table>
	</form>
</body>
</html>