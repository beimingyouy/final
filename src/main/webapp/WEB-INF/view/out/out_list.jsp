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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">

<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.3.6/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/js/jquery-easyui-1.3.6/themes/icon.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.3.6/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
		var win;
		var toolbar =  new Array();
		$(function(){
			var toolbar = [
		              {id:"add", 		text:"运输出库",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		 					demo_edit();
		          		   				}},
		          	  {id:"edit", 		text:"出库单完成确认",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					demo_check();
			        	   				}},
			          {id:"delete", 	text:"删除审核单",		iconCls:'icon-remove',
				       handler: 		function(){
				    	  					demo_delete();
				    	   				}},
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   					$("#demo_datagrid").datagrid("reload");
				    	   				}} 
	                ];
			//定义列表
			$('#demo_datagrid').datagrid({
				url:'<%=path%>/out/list',
			fit : true,
			fitColumns : false,
			singleSelect : false,
			rownumbers : true,
			pagination : true,
			border : false,
			autoRowHeight : true,
			toolbar : toolbar,
			frozenColumns : [ [ {
				field : 'id',
				title : 'id',
				align : 'center',
				width : 80
			} ] ],
			columns : [ [ {
				field : 'inId',
				title : '入库单编号',
				align : 'center',
				width : 100
			},{
				field : 'outId',
				title : '出库单编号',
				align : 'center',
				width : 100
			}, {
				field : 'carId',
				title : '车辆类型',
				align : 'center',
				width : 100
			}, {
				field : 'carCount',
				title : '占用数量',
				align : 'center',
				width : 100
			},{
				field : 'state',
				title : '审核状态',
				align : 'center',
				width : 80,
				
				styler: function(value,row,index){
					if (value == 1){
						
						return 'color:black;';
					}else if(value == 0){
						return 'color:blue';
					}else if(value == 3){
						return 'color:red';
					}
					else{
						return;
					}},
					formatter: function(value,row,index){
						if (value==1){
							return "运输中";
						} else if(value==0){
							return "出库失败";
						}else if(value==2){
							return "车辆选择中";
						}else{
							return "出库完成";
						}
					}


			
			}, {
				field : 'createDate',
				title : '出库单创建时间',
				align : 'center',
				width : 200,
				formatter:function(value,row,index){ 
					if (value != null) {
						console.log(value);
						var date = new Date(value);
						console.log(date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
								+ date.getDate()+" "+date.getHours() +":"+date.getMinutes()+":"+date.getMinutes());
						
						return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
						+ date.getDate()+" "+date.getHours() +":"+date.getMinutes()+":"+date.getMinutes();
						}
                    } 
			}, {
				field : 'updateDate',
				title : '实际出库时间',
				align : 'center',
				width : 200,
				formatter:function(value,row,index){ 
					if (value != null) {
						console.log(value);
						var date = new Date(value);
						return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
						+ date.getDate()+" "+date.getHours() +":"+date.getMinutes()+":"+date.getMinutes();
						}
                    } 
				 
			}
			] ],
			onDblClickRow : function(rowIndex, rowData) {
				view(rowData.id);
			}
		});
	});
		//查看
		function view(id) {
			win = $('<div/>').dialog({
				title : '查看',
				width : 800,
				height : 600,
				modal : true,
				href : '<%=path%>/out/view?id=' + id,
				onClose : function() {
				demo_window_close();
			}
		});
	}

	//添加
	function demo_add(){
		
		win= $('<div/>').dialog({
			title:'添加',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/out/toUpdate',
			onClose:function(){
				demo_window_close();
			}
		});
	}	
	//修改

	function demo_edit(id) {
		
		var row = $('#demo_datagrid').datagrid('getChecked');
		if (row == ''||row.length!=1) {
			$.messager.alert('提示框', '请选择一行数据！');
			return false;
		}
		if(row[0].state==0||row[0].state==1){
			$.messager.alert('提示框', '该申请单已经审核，如审核失败请重新提交申请单');
			return false;
		}
		if(row[0].state==3){
			$.messager.alert('提示框', '该出库单申请单已完成！');
			return false;
		}
		win= $('<div/>').dialog({
			title:'编辑',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/out/toUpdate?id='+row[0].id,
			onClose:function(){
				demo_window_close();
			}
		});
	}
	//确认出库
	function demo_check() {
		var row = $('#demo_datagrid').datagrid('getChecked');
		
		if(row[0].state!=1){
			$.messager.alert('提示框', '只有出库申请成功的申请单才可以确认。');
			return false;
		}
		
		if(row == ''){
			$.messager.alert('提示框','请选择一行数据！');	
			return false;
		}
		var ids='';
		for(var i=0;i<row.length;i++){
			ids+=row[i].id;
			if(i<row.length-1){
				ids+=',';
			}
		}
	
		var url = '<%=path%>/out/toCheck?ids=' + ids;
		$.messager.confirm('确认', '您是否要确认完成？', function(r) {
			if (r) {
				$.post(url, ids, function(json) {
					var flag = json.flag;
					var msg = json.msg;
					if (flag == "false") {
						$.messager.alert("错误提示", "确认失败", "error", function() {
						});
					} else {
						$.messager.alert("提示", "确认成功", "info", function() {
						});

						$("#demo_datagrid").datagrid("reload");
					}
				}, 'json');
			}
		});
	}
	
	//删除
	function demo_delete() {
		var row = $('#demo_datagrid').datagrid('getChecked');
		
		if(row[0].state==1){
			$.messager.alert('提示框', '选中的申请单中，包含已经出库成功的申请单。');
			return false;
		}
		
		if(row == ''){
			$.messager.alert('提示框','请选择一行数据！');	
			return false;
		}
		var ids='';
		for(var i=0;i<row.length;i++){
			ids+=row[i].id;
			if(i<row.length-1){
				ids+=',';
			}
		}
	
		var url = '<%=path%>/out/toDelete?ids=' + ids;
		$.messager.confirm('确认', '您是否要删除？', function(r) {
			if (r) {
				$.post(url, ids, function(json) {
					var flag = json.flag;
					var msg = json.msg;
					if (flag == "false") {
						$.messager.alert("错误提示", "删除失败", "error", function() {
						});
					} else {
						$.messager.alert("提示", "删除成功", "info", function() {
						});

						$("#demo_datagrid").datagrid("reload");
					}
				}, 'json');
			}
		});
	}
	//条件查询
	function demoSearch() {
		$('#demo_datagrid').datagrid('load', {
			outId : $('#outId').val()
		});
	}

	//重置
	function demoReset() {
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', {
			outId : $('#outId').val()
		});
	}

	//销毁窗口
	function demo_window_close() {
		win.dialog('destroy');
	}
	// show提示框
	function showMsg(t, m) {
		$.messager.show({
			title : t,
			msg : m,
			timeout : 5000,
			slowType : 'slide'
		});
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'north',border:false"
			style="overflow: hidden; padding: 5px">
			<form id="demo_list_form" method="post">
				<table cellpadding="0" cellspacing="1" class="formtable">
					<tr>
						<td align="center" width="10%">出库单编号</td>
						<td class="value" width="20%"><input id="outId" name="outId"
							class="easyui-validatebox"></td>
						</td>
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