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
	<form id="demo_add_form" >
		<table cellpadding="5">
			<tr>
				<td>父id：</td>
				<td><input type ="text" name = "parentid" value ="${menu.parentid}" readonly="readonly" style="border: 0"/></td>
			</tr>
			<tr>
				<td>编号:</td>
				<td><input type ="text" name = "menuId" value ="${menu.menuId}" readonly="readonly" style="border: 0"/></td>
			</tr>
			<tr>			
				<td>grade：</td>
				<td><input type ="text" name = "grade" value ="${menu.grade}" readonly="readonly" style="border: 0"/></td>						
			</tr>
			<tr>
				<td>菜单名：</td>
				<td><input class="easyui-validatebox" type="text"
					name="menuName" value="${menu.menuName}"
					data-options="required:true,validType:'menuHref'"></input></td>
			</tr>
			<tr>
				<td>是否叶子节点：</td>
				<td><select id="cc" class="easyui-combobox" name="isleft"
					style="width: 200px;">
						<option value="0"
							<c:if test="${menu.isleft==0}"> selected="selected"
							</c:if>>否</option>
						<option value="1"
							<c:if test="${menu.isleft==1}"> selected="selected"
							</c:if>>是</option>

				</select></td>
			</tr>
			<tr id = "ishide">
				<td>链接地址：</td>
				<td><input class="easyui-validatebox" type="text"
					name="menuHref" value = "${menu.menuHref}" data-options="validType:'menuHref'"></input></td>
			</tr>
			<tr>
			
			
			<tr>
				<td><a id="sava_btn" href="javascript:void(0)"
					onclick="add_demo_submit()" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存数据</a></td>
				<td><a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-reload',plain:false,onClick:function(){formreset()}">重置</a></td>
			</tr>
			

		</table>
	</form>
	<script>
	
	
	function formreset(){
		$("#demo_add_form").form("reset");
		
	}
	//提交添加
	function add_demo_submit(){
		 var isValid = $('#demo_add_form').form('validate'); 
	       if(!isValid){
	    	   $.messager.alert("错误提示", "您有必填内容为填写" , "error",
						function() {
				})
	           return ;
	       }
	       
		var formdate = $('#demo_add_form').serializeArray();
		var url = '<%=path%>/menu/update.do';
			$.post(url, formdate, function(json) {				
				var flag = json.flag;
				var msg = json.msg;
				
				if (flag == 'false') {
					$.messager.alert("错误提示", "更新失败", "error",
							function() {
							})
				} else {
					$.messager.alert("提示", "更新成功", "info", function() {
					})
					win.dialog("destroy");
					$("#menu_div").treegrid("reload");
				}
			}, "json");

		}
	</script>
</body>
</html>