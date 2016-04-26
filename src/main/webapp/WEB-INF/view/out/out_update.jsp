<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
					<td>${in.wmId}</td>
				</tr>
				<tr>
					<td>占用仓储资源数目：</td>
					<td>${in.wmCount}</td>
				</tr>
				<tr>
					<td>仓位资源类型：</td>
					<td>${in.pId}</td>
				</tr>
				<tr>
					<td>占用仓位资源数目：</td>
					<td>${in.pCount}</td>
				</tr>
				<tr>
					<td>备注：</td>
					<td>${in.inNote}</td>
				</tr>
				<tr>
					<td>审核状态：${in.state}${in.state}</td>
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
				<tr>
					<td>请选择审核状态：</td>
					<td><select id="state" class="easyui-combobox"   data-options="editable:false"  >
							<option value="1">同意</option>
							<option value="0">拒绝</option>
					</select></td>
				</tr>
				<tr>
					<td><input type="hidden" name="id" value="${in.id}" /></td>
					<td><input type="hidden" name="inId" value="${in.inId}" /></td>
					<td><input type="hidden" name="wmId" value="${in.wmId}" /></td>
					<td><input type="hidden" name="pId" value="${in.pId}" /></td>
					<td><input type="hidden" name="wmCount" value="${in.wmCount}" /></td>
					<td><input type="hidden" name="pCount" value="${in.pCount}" /></td>
					<td><a id="sava_btn" href="javascript:void(0)"
						onclick="update_demo_submit()" class="easyui-linkbutton"
						data-options="iconCls:'icon-save'">保存数据</a></td>
				</tr>

			</table>

		</form>
		<script type="text/javascript">
		//提交修改
		function update_demo_submit(){
			var formdate = $("#demo_view_form").serializeArray();
			var state =$("#state").combobox('getValue');
			
			var url = "<%=path%>/in/update?state="+state;
				$.post(url, formdate, function(json) {
					var flag = json.flag;
					var msg = json.msg;
					if (flag == "false") {
						$.messager.alert("错误提示", "修改失败， 原因是" + msg, "error",
								function() {
								});
					} else {
						$.messager.alert("提示", "修改成功", "info", function() {
						});
						win.dialog("destroy");
						$("#demo_datagrid").datagrid("reload");
					}
				}, "json");
			}
		</script>
		
	</div>
</body>
</html>