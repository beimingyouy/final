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
		              {id:"add", 		text:"添加车辆资源",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		   					demo_add();
		          		   				}},
		          	  {id:"edit", 		text:"编辑车辆资源",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					demo_edit();
			        	   				}},
			          {id:"delete", 	text:"删除车辆",		iconCls:'icon-remove',
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
				url:'<%=path%>/car/list',
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
				field : 'carId',
				title : '车辆编号',
				align : 'center',
				width : 100
			}, {
				field : 'carName',
				title : '车辆名称',
				align : 'center',
				width : 100
			}, {
				field : 'carCount',
				title : '可用数量',
				align : 'center',
				width : 100
			}, {
				field : 'carAll',
				title : '车辆名称',
				align : 'center',
				width : 100
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
				width : 600,
				height : 400,
				modal : true,
				href : '<%=path%>/car/view?id=' + id,
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
			href:'<%=path%>/car/toAdd',
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
		win= $('<div/>').dialog({
			title:'编辑',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/car/toUpdate?id='+row[0].id,
			onClose:function(){
				demo_window_close();
			}
		});
	}
	
	//删除
	function demo_delete() {
		var row = $('#demo_datagrid').datagrid('getChecked');
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
	
		var url = '<%=path%>/car/toDelete?ids='+ids;
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
						function() {}
					)

					$("#demo_datagrid").datagrid("reload");
				}
			},'json')
			}
			})
		}
	//条件查询
	function demoSearch() {
		$('#demo_datagrid').datagrid('load', {pId:$('#pId').val()});		
	}

	//重置
	function demoReset() {
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', {pId:$('#pId').val()});
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
						<td align="center" width="10%">车辆编号</td>
						<td class="value" width="20%"><input id="pId" name="pId"
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