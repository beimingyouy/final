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
					<td>id：</td>
					<td>${car.id}</td>
				</tr>
				<tr>
					<td>车辆编号：</td>
					<td>${car.carId}</td>
				</tr>
				<tr>
					<td>车辆名称：</td>
					<td>${car.carName}</td>
				</tr>
				<tr>
					<td>可用车辆数：</td>
					<td>${car.carCount}</td>
				</tr>
				<tr>
					<td>总车辆数：</td>
					<td>${car.carAll}</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>