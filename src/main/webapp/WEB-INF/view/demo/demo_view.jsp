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
	<form id="demo_view_form" method="post">
		<table cellpadding="5">
			<tr>
				<td>
					姓名：
				</td>
				<td> ${demo.name}</td>
			</tr>
			<tr>
				<td>描述：</td>
				<td>${demo.description}</td>
			</tr>
		</table>
		
	</form>
</div>
</body>
</html>