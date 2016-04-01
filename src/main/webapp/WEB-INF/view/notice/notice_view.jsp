
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

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
<title>修改公告</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/script/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/script/easyui/themes/icon.css">
<script type="text/javascript"
	src="<%=path%>/script/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/script/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/script/easyui/locale/easyui-lang-zh_CN.js"></script>
<script language="javascript" type="text/javascript"
	src="<%=path%>/script/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/script/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/script/ueditor1_3_6-utf8-jsp/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/script/ueditor1_3_6-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
</head>
<body>
	<div style="padding: 10px;">
		<form id="demo_update_form" method="post">
			<table cellpadding="5">
				<tr>
					<td width="60px" align="right">标题：</td>
					<td>${notice.notice_title}</td>
				</tr>
				<tr>
					<td width="60px" align="right" valign="top">内容：</td>
					<td>${notice.notice_content}</td>

				</tr>
				<tr>
					<td width="60px" align="right">发布时间：</td>
					<td>${create_date}</td>
				</tr>
				<tr>
					<td width="60px" align="right">截止时间：</td>
					<td><c:if test="${end_date != ''}">
						${end_date} 
			    
						</c:if></td>
				</tr>
				<tr>
					<td width="60px" align="right">发布人：</td>
					<td>${notice.create_user}</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>

