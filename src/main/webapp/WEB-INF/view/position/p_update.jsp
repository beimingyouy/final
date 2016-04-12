<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<form id="demo_update_form" method="post">
		<table cellpadding="5">
			<tr>
				<td>id：</td>
				<td>${p.id}
			</tr>
			<tr>
				<td>仓位编号：</td>
				<td>${p.pId}
			</tr>

			<tr>
				<td>仓位名称：</td>
				<td><input class="easyui-validatebox" type="text" name="pName"
					value="${p.pName}"
					data-options="required:true,validType:'pCount',missingMessage:'请输入仓位名称！'"></input></td>
			</tr>
			<tr>
				<td>可用数量：</td>
				<td><input class="easyui-validatebox" type="text" id="pCount"
					name="pCount" value="${p.pCount}"
					data-options="required:true,validType:'code',missingMessage:'请输入可用数量！'"></input></td>
			</tr>
			<tr>
				<td>总数量：</td>
				<td><input class="easyui-validatebox" type="text" name="pAll"
					id="pAll" value="${p.pAll}"
					data-options="required:true,validType:'code',missingMessage:'请输入总数量！'"></input></td>
			</tr>
			<tr>
			<tr>
				<td><input type="hidden" name="id" value="${p.id}" />
				<td><a id="sava_btn" href="javascript:void(0)"
					onclick="update_demo_submit()" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'">保存数据</a> <a
					href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-reload',plain:false,onClick:function(){formreset()}">重置</a></td>
			</tr>
		</table>
	</form>
	<script>	
	function formreset(){
		$("#demo_update_form").form("reset");
		
	}
	//提交修改
	function update_demo_submit(){
		var count = $("#pCount").val();
		var all = $("#pAll").val();
		if(all<count){
			   $.messager.alert("错误提示", "可用数量大于总数量！" , "error",
						function() {
				   
				});
			   return ; 
		}
		 var isValid = $('#demo_update_form').form('validate'); 
	       if(isValid==false){
	    	   $.messager.alert("错误提示", "您有必填内容为填写" , "error",
						function() {
				});
	           return ;
	       }
	       
		var formdate = $("#demo_update_form").serializeArray();
		var url = "<%=path%>/position/update";
			$.post(url, formdate, function(json) {
				var flag = json.flag;
				var msg = json.msg;
				if (flag == "false") {
					$.messager.alert("错误提示", "修改失败， 原因是" + msg, "error",
							function() {
							})
				} else {
					$.messager.alert("提示", "修改成功", "info", function() {
					})
					win.dialog("destroy");
					$("#demo_datagrid").datagrid("reload");
				}
			}, "json")
		}

		$.extend($.fn.validatebox.defaults.rules, {
			//验证汉子
			CHS : {
				validator : function(value) {
					return /^[\u0391-\uFFE5]+$/.test(value);
				},
				message : '只能输入汉字'
			},
			//移动手机号码验证
			mobile : {//value值为文本框中的值
				validator : function(value) {
					var reg = /^1[3|4|5|8|9]\d{9}$/;
					return reg.test(value);
				},
				message : '输入手机号码格式不准确.'
			},
			//数字验证
			code : {
				validator : function(value) {
					var reg = /^[1-9]\d{0,9}$/;
					return reg.test(value);
				},
				message : '只允许输入10位以内数字@_@~.'
			},

		})
	</script>
</body>
</html>