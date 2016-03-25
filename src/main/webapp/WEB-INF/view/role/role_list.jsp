<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.3.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.3.6/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>

<script>
	$(function(){	
		var toolbar = [
		              {id:"add", 		text:"添加角色",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		   					role_add();
		          		   				}},
		          	  {id:"edit", 		text:"修改角色",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					edit_role();
			        	   				}},
			          {id:"delete", 	text:"删除角色",		iconCls:'icon-remove',
				       handler: 		function(){
				    	  					del_role();
				    	   				}},
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   $("#demo_datagrid").datagrid("reload")
				    	   				}} 
	                ];
		$("#demo_datagrid").datagrid({   
		        columns:[[
			           {checkbox:true,			width:30},
					   {field:"roleId",		title:"编号",	width:100,align:"center"},
					   {field:"roleName",		title:"姓名",	width:100,align:"center"},
					   {field:"note",	title:"备注",	width:100,align:"center"}
					   ]],
			    url:        					"<%=path%>/role/list.do",
				fit: 							true,
				striped:						true,
				mathod: 						"post",
				rownumbers: 					true,
				pagination: 					true,
				pageSize: 						3,
				toolbar: 						toolbar
	
			});
	
		});


	function role_add(){
		win_add = $('<div/>').dialog({
			title:'添加',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/role/toAdd.do',
			onClose:function(){
				win_add.dialog('destroy');
			}
		});
	};
	
	function edit_role(){
		var row = $('#demo_datagrid').datagrid('getChecked');
		if (row == '') {
			$.messager.alert('提示框', '请选择一行数据！');
			return false;
		}
		win_update = $('<div/>').dialog({
			title:'编辑',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/role/toUpdate.do?roleId='+row[0].roleId,
			onClose:function(){
				win_update.dialog('destroy');
			}
		});
		
	};
	
	function del_role() {
		var row = $('#demo_datagrid').datagrid('getChecked');
		if(row == ''){
			$.messager.alert('提示框','请选择一行数据！');	
			return false;
		}
		var ids='';
		for(var i=0;i<row.length;i++){
			ids+=row[i].roleId;
			if(i<row.length-1){
				ids+=',';
			}
		}
	
		var url = '<%=path%>/role/toDelete.do?ids='+ids;
		$.messager.confirm('确认', '您是否要删除？', function(r) {
			if (r) {
			$.post(url,ids,function(json){
				var flag = json.flag;
				var msg = json.msg;
				if(flag == "false"){
					$.messager.alert("错误提示", "删除失败", "error",
						function() {
						})
				}
				else{
					$.messager.alert("提示", "删除成功", "info", 
						function() {
						$("#demo_datagrid").datagrid("reload");
					}
					)

					
				}
			},'json')
			}
			})
	}
	//条件查询
	function demoSearch() {
		$('#demo_datagrid').datagrid('load', 
				{roleName:$('#roleName').val()});		
	}

	//重置
	function demoReset() {
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', 
				{roleName:$('#roleName').val()});
	}
</script>
<title>角色列表</title>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north',border:false"
			style="overflow: hidden; padding: 5px">
			<form id="demo_list_form" method="post">
				<table cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="center" width="10%">角色名</td>
						<td class="value" width="20%"><input id="roleName" name="roleName"
							class="easyui-validatebox"></td>
						<td colspan="2" align="center" class="value" width="40%"><a
							href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-search',plain:false,onClick:function(){demoSearch()}">查询</a>
							<a href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'icon-reload',plain:false,onClick:function(){demoReset()}">重置</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:true">
			<table id="demo_datagrid"></table>
		</div>
	</div>
</body>


</html>