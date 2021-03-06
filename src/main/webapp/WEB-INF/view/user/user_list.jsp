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
			 toolbar = [
		              {id:"add", 		text:"添加用户",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		   					user_add();
		          		   				}},
		          	  {id:"edit", 		text:"编辑用户",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					user_edit();
			        	   				}},
			          {id:"delete", 	text:"删除用户",		iconCls:'icon-remove',
				       handler: 		function(){
				    	  					user_delete();
				    	   				}},
					  {id:"menu", 	text:"分配权限",		iconCls:'icon-remove',
					   handler: 		function(){
					    				give_menu();
					    					    	}},
				    	   				
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   					$("#demo_datagrid").datagrid("reload");
				    	   				}} 
	                ];
			//定义列表
			$('#demo_datagrid').datagrid({
				url:'<%=path%>/user/list.do',
			fit : true,
			fitColumns : false,
			singleSelect : false,
			rownumbers : true,
			pagination : true,
			border : false,
			autoRowHeight : true,
			toolbar : toolbar,
			frozenColumns : [ [ {
				field : 'userid',
				title : 'userid',
				align : 'center',
				width : 80
			} ] ],
			columns : [ [ {
				field : 'username',
				title : '用户名',
				align : 'center',
				width : 100
			}, {
				field : 'address',
				title : '住址',
				align : 'center',
				width : 100
			}, {
				field : 'sex',
				title : '性别',
				align : 'center',
				width : 70,
				formatter : function(value) {
					if (value == 0) {
						return '男';
					} else if (value == 1) {
						return '女';
					}
				}
			}

			] ],
			onDblClickRow : function(rowIndex, rowData) {
				view(rowData.userid);
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
				href : '<%=path%>/user/view.do?userid=' + id,
			onClose : function() {
				demo_window_close();
			}
		});
	}

	//添加
	function user_add(){
		
		win_add = $('<div/>').dialog({
			title:'添加',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/user/toAdd.do',
			onClose:function(){
				demo_window_close();
			}
		});
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
		var url = '<%=path%>/user/submit.do';
			$.post(url, formdate, function(json) {				
				var flag = json.flag;
				var msg = json.msg;
				
				if (flag == 'false') {
					$.messager.alert("错误提示", "添加失败， 原因是" + msg, "error",
							function() {
							})
				} else {
					/* $.messager.alert("提示", "添加成功", "info", function() {
					}) */
					$.messager.show({
						title:"提示",
						msg:"添加成功"
					})
					win_add.dialog("destroy");
					$("#demo_datagrid").datagrid("reload");
				}
			}, "json");

		}
	
	
	//修改

	function user_edit(id) {
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
			href:'<%=path%>/user/toUpdate.do?userid='+row[0].userid,
			onClose:function(){
				demo_window_close();
			}
		});
	}
	//提交修改
	function update_demo_submit(){
		
		 var isValid = $('#demo_update_form').form('validate'); 
	       if(!isValid){
	    	   $.messager.alert("错误提示", "您有必填内容为填写" , "error",
						function() {
				})
	           return ;
	       }
		var formdate = $("#demo_update_form").serializeArray();
		var url = "<%=path%>/user/update.do";
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
	function user_delete() {
		var row = $('#demo_datagrid').datagrid('getChecked');
		if(row == ''){
			$.messager.alert('提示框','请选择一行数据！');	
			return false;
		}
		var ids='';
		for(var i=0;i<row.length;i++){
			ids+=row[i].userid;
			if(i<row.length-1){
				ids+=',';
			}
		}
		var url = '<%=path%>/user/toDelete.do?ids='+ids;
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
		$('#demo_datagrid').datagrid('load', 
				{username:$('#username').val(),sex:$("#sex1").combobox('getValue')});		
	}

	//重置
	function demoReset() {
		$('#demo_Senior_form').form('reset');
		$('#demo_list_form').form('reset');
		$('#demo_datagrid').datagrid('load', 
				{username:$('#username').val(),sex:$("#sex1").combobox('getValue')});
	}

	//分配权限
	function give_menu(){
		var row = $('#demo_datagrid').datagrid('getChecked');
		if (row == '') {
			$.messager.alert('提示框', '请选择一行数据！');
			return false;
		}
		win_menu = $('<div/>').dialog({
			title:'分配权限',
			width:600,
			height:400,
			modal:true,
			href:'<%=path%>/user/toGive.do?userid='+row[0].userid,
			onClose:function(){
				win_menu.dialog("destroy");
			}
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
						<td align="center" width="10%">姓名</td>
						<td class="value" width="20%"><input id="username" name="username"
							class="easyui-validatebox"></td>
						<td align="center" width="10%">性别</td>
						<td class="value" width="20%"><input id="sex1"
							name="sex1" class="easyui-combobox"
							data-options="
				    valueField: 'value',
				    textField: 'label',
				    editable:false,
				    panelHeight:'auto',
				    data: 
				    [{
					    label: '全部',
					    value: '3'
				    },{
					    label: '男',
					    value: '0'
				    },{
					    label: '女',
					    value: '1'
				    }
				    ] " />
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