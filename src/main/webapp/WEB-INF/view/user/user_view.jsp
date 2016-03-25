<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看</title>
</head>
<body>
<div style="padding: 10px;">
	<form id="demo_update_form" method="post">
		<table cellpadding="5">
			<tr>
				<td>
					用户名：
				</td>
				<td> ${user.username}</td>
			</tr>
			<tr>
				<td>真名：</td>
				<td>${user.truename}</td>

			</tr>
			<tr>
				<td>性别：</td>
				<td>
				<c:if test="${user.sex==0}">男
				</c:if>
				<c:if test="${user.sex==1}">女
				</c:if></td>
			</tr>
			<tr>
				<td>地址：</td>
				<td>${user.address}</td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>