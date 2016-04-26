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
<script type="text/javascript">

$(function(){
	$('#wm').combobox({    
    url:'<%=path%>/wm/wmType',    
    valueField:'wmId',    
    textField:'wmName',
    editable:false 
});
	$('#p').combobox({    
	    url:'<%=path%>/position/pType',    
	    valueField:'pId',    
	    textField:'pName',
	    editable:false 
	});
	
	});
 </script>
	<form id="demo_add_form">
		<table cellpadding="5">
			<tr>
				<td>入库单编号:</td>
				<td><input class="easyui-validatebox" type="text" name="inId"
					id="inId" data-options=" required:true" /></td>
			</tr>
			<tr>
				<td>仓储资源选择:</td>
				<td><input id="wm" name="wm" value="请选择仓储资源"></td>
			</tr>
			<tr>
				<td>占用数量:</td>
				<td><input class="easyui-validatebox" type="text"
					name="wmCount" id="carAll" data-options=" required:true" /></td>
			</tr>
			<tr>
				<td>仓位选择:</td>
				<td><input id="p" name="p" value="请选择仓位资源"></td>
			</tr>
			<tr>
				<td>占用位置:</td>
				<td><input class="easyui-validatebox" type="text" name="pCount"
					id="pCount" data-options=" required:true" /></td>
			</tr>
			<tr>
				<td>备注:</td>
				<td><input class="easyui-validatebox" type="text" name="inNote"
					id="inNote" data-options=" required:true" /></td>
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
		var wmtype = $('#wm').combobox('getValue');
		var count = $("#carCount").val();
		var all = $("#carAll").val();
		if(all<count){
			   $.messager.alert("错误提示", "可用数量大于总数量！" , "error",
						function() {
				   
				});
			   return ; 
		}
		
		 var isValid = $('#demo_add_form').form('validate'); 
	       if(isValid==false){
	    	   $.messager.alert("错误提示", "您有必填内容为填写" , "error",
						function() {
				})
	           return ;
	       }
	       
		var formdate = $('#demo_add_form').serializeArray();
		var url = '<%=path%>/car/submit';
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
					win.dialog("destroy");
					$("#demo_datagrid").datagrid("reload");
				}
			}, "json");

		}
	</script>
</body>
</html>