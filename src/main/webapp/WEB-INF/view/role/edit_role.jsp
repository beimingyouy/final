<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<title>添加角色</title>
</head>
<body class="easyui-layout">
	<div data-options="region:		'center'">
		<form id = "form1">
		<table>
			<tr>
				<td align="right">角色名称:</td>
				<td><input class="easyui-validatebox" type="text" name="roleName" id = "roleName1"
					value = "${role.roleName}"
					data-options="required:true,missingMessage:'请输入角色名！'" /></td>
			</tr>
			<tr style="height: 40px">
				<td align="right">角色备注:</td>
				<td><input class="easyui-validatebox" type="text" name="note" id = "note1"
				value = "${role.note}"/></td>
			</tr>
			<tr style="height: 40px">
				<td align="right">角色权限:</td>
				<td>
				<div id="menu_div" style="heigth:500px ;float: right; "></div>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div data-options="region:		'south'" 
		style="height: 40px text-align: right;">
		<br/>
		<a id="sava_btn" href="javascript:void(0)" onclick="savadata()"	class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">保存数据</a>

	</div>
<script>
$(function(){
	$("#menu_div").tree({
		url:				"<%=path%>/role/loadMenuTree.do?roleId=${role.roleId}",
		method:				"get",
		checkbox:			true,
		lines:				true		
	})
})

 function savadata(){
	var sava_btn = document.getElementById("sava_btn")
	var nodes = $("#menu_div").tree("getChecked",["checked","inderteminate"]);
	if(nodes==null||nodes.length==0){
		$.messager.alert("提示","权限还未选择，无法进行保存操作","warning")
	}else{		
		var total_checked_id="";		
		for(var i=0;i<nodes.length;i++){
			var  node = 	nodes[i];
			var id = 		node.id;
			var text = 		node.text;
			if(total_checked_id==""){
				total_checked_id=id;
			}else{
				total_checked_id = total_checked_id+","+id;
			}
		}
		var roleName = $("#roleName1").val();
		var note = $("#note1").val();
		var roleId = ${role.roleId};
		var jsonData = {
				"roleId":			roleId,
				"roleName":			roleName,
				"note":				note,
				"total_checked_id":	total_checked_id,
		}
		var savaURL = "<%=path%>/role/update.do";
		$.post(savaURL,jsonData,function(json){
			var flag = json.flag;
			var msg = json.msg;
			
			if (flag == 'false') {
				$.messager.alert("错误提示", "更新失败" , "error",
						function() {
						})
			} else {
				$.messager.alert("提示", "更新成功", "info", function() {
				})
				win_update.dialog("destroy");
				$("#demo_datagrid").datagrid("reload");
			}
		}, "json");
	}
} 
</script>

</body>
</html>