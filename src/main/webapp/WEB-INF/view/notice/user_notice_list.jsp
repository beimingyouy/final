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
<script type="text/javascript"
	src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript">
		var win;
		var toolbar =  new Array();
		$(function(){
			var toolbar = [
			          {id:"delete", 	text:"删除公告",		iconCls:'icon-remove',
				       handler: 		function(){
				    	  					demo_delete();
				    	   				}},
				      {id:"add", 	text:"发布公告",		iconCls:'icon-add',
				    					       handler: 		function(){
				    					    	  					demo_add();
				    					    	   				}},
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   					$("#demo_datagrid").datagrid("reload");
				    	   				}} 
	                ];
			//定义列表
			$('#demo_datagrid').datagrid({
			url:'<%=path%>/notice/list.do',
			fit : true,
			loadMsg:				"正在加载公告列表",
			fitColumns : false,
			singleSelect : false,
			rownumbers : true,
			pagination : true,
			border : false,
			autoRowHeight : true,
			toolbar : toolbar,
			frozenColumns : [ [ {
				field : 'notice_title',
				title : '标题',
				align : 'center',
				width : 200
			} ] ],
			columns : [ [ {
				field : 'create_date',
				title : '发布时间',
				align : 'center',
				width : 150,
				formatter: function (value) { 
					if (value == null) { 
						return value; 
						}
					else{
						return new Date(value).format("yyyy-MM-dd hh:mm:ss");
						}
					}
			}, {
				field : 'end_date',
				title : '截止时间',
				align : 'center',
				width : 150,
				formatter: function (value) { 
					if (value == null) { 
						return value; 
						}
					else{
						return new Date(value).format("yyyy-MM-dd");
						}
					}
			},{
				field : 'create_user',
				title : '发布人',
				align : 'center',
				width : 150
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
				href : '<%=path%>/notice/view.do?id=' + id,
			onClose : function() {
				demo_window_close();
			}
		});
	}
		//添加父级菜单
		function demo_add(){
			  win_add = $('<div/>').dialog({
				title : '添加根级菜单',
				width : 600,
				height : 400,
				modal : true,
				href : '<%=path%>/notice/notice_add.do?',
				onClose : function() {
				demo_window_close();
				}
			});
		};
	


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
	
		var url = '<%=path%>/notice/toDelete.do?ids='+ids;
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
		$('#demo_datagrid').datagrid('load', {notice_title:$('#notice_title').val()});		
	}

	//重置
	function demoReset() {
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', {notice_title:$('#notice_title').val()});
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
						<td align="center" width="10%">标题</td>
						<td class="value" width="20%"><input id="notice_title" name="notice_title"
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