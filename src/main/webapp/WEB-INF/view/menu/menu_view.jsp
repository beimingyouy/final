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
					菜单名：
				</td>
				<td> ${menu.menuName}</td>
			</tr>
			<tr>
				<td>父菜单：</td>
				<td>${menu.parentid}</td>

			</tr>
			<tr>
				<td>级别：</td>
				<td>${menu.grade}</td>

			</tr>
			<tr>
				<td>打开方式：</td>
				<td>
				<c:if test="${menu.isleft==0}">文件夹
				</c:if>
				<c:if test="${menu.isleft==1}">窗口
				</c:if></td>
			</tr>
			<tr>
				<td>链接地址：</td>
				<td>${menu.menuHref}</td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>