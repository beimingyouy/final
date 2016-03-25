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
		              {id:"add", 		text:"添加根节点",		iconCls:'icon-add',
		          	   handler: 		function(){
		          		   					addFirstMenu();
		          		   				}},
		          	  {id:"add_2", 		text:"添加字节点",		iconCls:'icon-add',
			           handler: 		function(){
			        	   					user_edit();
			        	   				}},
			          {id:"add_2", 		text:"修改节点",		iconCls:'icon-edit',
			           handler: 		function(){
			        	   					user_edit();
			        	   				}},	  
			          {id:"delete", 	text:"删除节点",		iconCls:'icon-remove',
				       handler: 		function(){
				    	  					user_delete();
				    	   				}},	   				 				
			        
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   					$("#tt").treegrid("reload");
				    	   				}} 
	                ];
		
		$('#tt').treegrid({ 
		fit:true,
		toolbar:toolbar,
		rownumbers: true,
		fitColumns:true,
		singleSelect:true,
		url:'<%=path%>/menu/list', 
		treeField:'menuName', 
		idField: 'id',	
		
		onDblClickRow:function(row){
		
		var pnode = $("#tt").treegrid("getParent", row.id);
		if(pnode){
		alert(pnode.id+pnode.menuName);					
		alert(row.id);
		
		}else{
		alert(row.id);
		
		}				
		}
		
		}); 
		});
	
			//添加
		function addFirstMenu(){
				win = $('<div/>').dialog({
					title:'添加',
					width:500,
					height:400,
					modal:true,
					href:'<%=path%>/menu/add',
					onClose:function(){
						demo_window_close();
					}
				});
		}
		//销毁窗口
		function demo_window_close(){
			win.dialog('destroy');
		}

		
</script>
</head>
<body>
<table id="tt">
<thead>
			<tr>
				<th data-options="field:'menuName'" width="220">菜单名称</th>
				<th data-options="field:'menuId'" width="220">菜单ID</th>				
				<th data-options="field:'icon'" width="100" align="right">图标</th>
				<th data-options="field:'url'" width="150">url</th>
			</tr>
		</thead>
</table> 
</body>
</html>