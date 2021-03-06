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
					<td>${in.id}</td>
				</tr>
				<tr>
					<td>入库单编号：</td>
					<td>${in.inId}</td>
				</tr>

				<tr>
					<td>仓储资源类型：</td>
					<td>${in.wmId}</td>
				</tr>
				<tr>
					<td>占用仓储资源数目：</td>
					<td>${in.wmCount}</td>
				</tr>
				<tr>
					<td>仓位资源类型：</td>
					<td>${in.wmId}</td>
				</tr>
				<tr>
					<td>占用仓位资源数目：</td>
					<td>${in.wmCount}</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td>${in.inNote}</td>
				</tr>
				<tr>
					<td>审核状态：</td>
					<c:choose>
						<c:when test="${in.state==1 }">
							<td style="color: red">审核成功</td>
						</c:when>
						<c:when test="${in.state==0 }">
							<td style="color: blue">审核失败</td>
						</c:when>
						<c:when test="${in.state==2 }">
							<td style="color: blue">等待审核</td>
						</c:when>
					</c:choose>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>