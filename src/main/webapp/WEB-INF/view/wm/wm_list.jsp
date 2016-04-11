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
		              {id:"add", 		text:"添加用户",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		   					demo_add();
		          		   				}},
		          	  {id:"edit", 		text:"编辑用户",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					demo_edit();
			        	   				}},
			          {id:"delete", 	text:"删除用户",		iconCls:'icon-remove',
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
				url:'<%=path%>/wm/list',
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
				field : 'wmId',
				title : '仓储编号',
				align : 'center',
				width : 100
			}, {
				field : 'wmName',
				title : '仓储名称',
				align : 'center',
				width : 100
			}, {
				field : 'wmCount',
				title : '可用数量',
				align : 'center',
				width : 100
			}, {
				field : 'wmAll',
				title : '仓储名称',
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
				href : '<%=path%>/wm/view?id=' + id,
			onClose : function() {
				demo_window_close();
			}
		});
	}

	//添加
	function demo_add(){
		
		win_add = $('<div/>').dialog({
			title:'添加',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/wm/toAdd',
			onClose:function(){
				demo_window_close();
			}
		});
	}
	//提交添加
	function add_demo_submit(){
		var formdate = $('#demo_add_form').serializeArray();
		var url = '<%=path%>/demo/submit.do';
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
					$("#demo_datagrid").datagrid("reload");
				}
			}, "json");

		}
	
	
	//修改

	function demo_edit(id) {
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
			href:'<%=path%>/demo/toUpdate.do?id='+row[0].id,
			onClose:function(){
				demo_window_close();
			}
		});
	}
	//提交修改
	function update_demo_submit(){
		var formdate = $("#demo_update_form").serializeArray();
		var url = "<%=path%>/demo/update.do";
		$.post(url,formdate,function(json){
			var flag = json.flag;
			var msg = json.msg;
			if(flag == "false"){
				$.messager.alert("错误提示", "修改失败， 原因是" + msg, "error",
						function() {
						})
			}
			else{
				$.messager.alert("提示", "修改成功", "info", function() {
				})
				win_update.dialog("destroy");
				$("#demo_datagrid").datagrid("reload");
			}
			
		},"json")		
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
	
		var url = '<%=path%>/demo/toDelete.do?ids='+ids;
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
		$('#demo_datagrid').datagrid('load', {name:$('#name').val()});		
	}

	//重置
	function demoReset() {
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', {name:$('#name').val()});
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
						<td align="center" width="10%">姓名</td>
						<td class="value" width="20%"><input id="name" name="name"
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