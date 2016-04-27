<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
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
					<td>${out.id}</td>
				</tr>
				<tr>
					<td>出库单编号：</td>
					<td>${out.outId}</td>
				</tr>

				<tr>
					<td>车辆资源类型：</td>
					<td>${out.carId}</td>
				</tr>
				<tr>
					<td>占用仓储资源数目：</td>
					<td>${out.carCount}</td>
				</tr>
				
					<td>审核状态：</td>
					<c:choose>
						<c:when test="${out.state==1 }">
							<td style="color: blue">审核成功</td>
						</c:when>
						<c:when test="${out.state==0 }">
							<td style="color: blue">审核失败</td>
						</c:when>
						<c:when test="${out.state==2 }">
							<td style="color: blue">等待审核</td>
						</c:when>
						<c:when test="${out.state==3 }">
							<td style="color: red">完成出库</td>
						</c:when>
					</c:choose>
				</tr>
				<tr>
					<td>出库单创建时间：</td>
					<td><fmt:formatDate value="${out.createDate }" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
				</tr>
				

			</table>

		</form>
	</div>
</body>
</html>