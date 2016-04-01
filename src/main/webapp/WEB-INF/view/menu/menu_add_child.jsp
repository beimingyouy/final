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
	<form id="demo_add_form">
		<table cellpadding="5">
			<tr>
				<td>父id：</td>
				<td><input type="text"name="parentid" value="${parentid}" readonly="readonly"></input></td>
			</tr>
			<tr>
				<td>编号:</td>
				<td><input class="easyui-validatebox" type="text"
					name="menuId" id = "menuId"
					data-options=" required:true" /></td>
			</tr>
			<tr>
				<td>菜单名：</td>
				<td><input class="easyui-validatebox" type="text"
					name="menuName" id ="menuName"
					data-options="required:true,validType:'menuHref'"></input></td>
			</tr>
			<tr>
				<td>是否叶子节点：</td>
				<td><input id="isleft" name="isleft"  value = "1" class="easyui-combobox" data-options="
				    valueField: 'value',
				    required:true,
				    textField: 'label',
				    editable:false,
				    panelHeight:'auto',
				    data: 
				    [{
					    label: '是',
					    value: '1'
				    },{
					    label: '否',
					    value: '0'
					   
				    }]" /></td>
			</tr>
			<tr >
				<td>链接地址：</td>
				<td><input class="easyui-validatebox" type="text"
					name="menuHref" data-options="validType:'menuHref'"></input></td>
			</tr>
			<tr>
			<tr style="display:none">			
				<td>grade：</td>
				<td><input type="text"name="grade" value="${grade+1}"></input></td>
							
			</tr>
			
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
		
		var a = $("#menuId").val();
		var b = $("#menuName").val();
		var c = $("#isleft").val();
		alert(a);
		alert(b);
		alert(c);
		
		 var isValid = $('#demo_add_form').form('validate'); 
	       if(isValid==false){
	    	   $.messager.alert("错误提示", "您有必填内容为填写" , "error",
						function() {
				})
	           return ;
	       }
	       
		var formdate = $('#demo_add_form').serializeArray();
		var url = '<%=path%>/menu/submit.do';
			$.post(url, formdate, function(json) {				
				var flag = json.flag;
				var msg = json.msg;
				
				if (flag == 'false') {
					$.messager.alert("错误提示", "添加失败， 原因是" + msg, "error",
							function() {
							})
				} else {
					$.messager.alert("提示", "添加成功", "info", function() {
					})
					win_add.dialog("destroy");
					$("#menu_div").treegrid("reload");
				}
			}, "json");

		}
	</script>
</body>
</html>