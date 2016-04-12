<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
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
<title>后台界面</title>

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
			{
					id : "add_parent",
					text : "添加根级",
					iconCls : 'icon-add',
					handler : function() {
						add_parent();
					}
				}, {
					id : "add_child",
					text : "添加子级",
					iconCls : 'icon-add',
					handler : function() {
						add_child();
					}
				}, {
					id : "delete",
					text : "删除菜单",
					iconCls : 'icon-remove',
					handler : function() {
						demo_delete();
					}
				}, {
					id : "update",
					text : "编辑菜单",
					iconCls : 'icon-edit',
					handler : function() {
						demo_edit();
					}
				},
				 {
					id:"refresh", 	
					text:"刷新",	
					iconCls:'icon-reload',
				   	handler: function(){
				    $("#menu_div").treegrid("reload");
				    	  }
				}		
				];		
				$('#menu_div').treegrid({
				url : "<%=path%>/menu/loadMenuTree.do",    
			    idField:"id",    
			    method:	"get",
			    treeField:"menuName",   
			    rownumbers : true,
			    toolbar : toolbar,
			    columns:[[ 
			        {title:"菜单名",field:"menuName",width:180,align:"left"},
			        {title:"编号",field:"id",width:60,align:"center"}, 
			        {title:"父菜单",field:"parentid",width:60,align:"center"},    
			        {title:"是否叶子",field:"isleft",width:80,align:"center"},    
			        {title:"地址",field:"menuHref",width:180,align:"center"}    
			    ]],
			    onDblClickRow : function(row) {
					view(row.id);
				}  
			});
			
			
		}) 
		//查看
		function view(id) {
			 win = $('<div/>').dialog({
				title : '查看',
				width : 600,
				height : 400,
				modal : true,
				href : '<%=path%>/menu/view.do?menuId=' + id,
				onClose : function() {
				demo_window_close();
				}
			});
		};
		
		//添加父级菜单
		function add_parent(){
			  win = $('<div/>').dialog({
				title : '添加根级菜单',
				width : 600,
				height : 400,
				modal : true,
				href : '<%=path%>/menu/add_parent.do?',
				onClose : function() {
				demo_window_close();
				}
			});
		};
		//添加子级菜单
		function add_child(){
			var row1 = $('#menu_div').treegrid('getChecked');
			if(row1 == ''){
				$.messager.alert('提示框','请选择一行数据！');	
				return ;
			}
			var parentid = row1[0].id;
			var grade = row1[0].grade;
			 win = $('<div/>').dialog({
				title : '添加子级菜单',
				width : 600,
				height : 400,
				modal : true,
				href : '<%=path%>/menu/add_child.do?parentid=' + parentid+'&&grade='+grade,
				onClose : function() {
					demo_window_close();
				}
			});
		};
		//编辑
		function demo_edit(id) {
			var row = $('#menu_div').treegrid('getChecked');
			if (row == '') {
				$.messager.alert('提示框', '请选择一行数据！');
				return ;
			}
			 win= $('<div/>').dialog({
				title:'编辑',
				width:600,
				height:400,
				modal:true,
				href:'<%=path%>/menu/toUpdate.do?id='+row[0].id,
				onClose:function(){
					demo_window_close();
				}
			});
		};
		//删除
		function demo_delete() {
			var row2 = $('#menu_div').treegrid('getChecked');
			if(row2 == ''){
				$.messager.alert('提示框','请选择一行数据！');	
				return ;
			}
			var id = row2[0].id;
			var date = {
					"id":id
			}
			var url = '<%=path%>/menu/toDelete.do';
			$.messager.confirm('确认', '您是否要删除？(如果包含子菜单，则将子菜单一并删除)', function(r) {
				if (r) {
				$.post(url,date,function(json){
					var flag = json.flag;
					var msg = json.msg;
					if(flag == "false"){
						$.messager.alert("错误提示", "删除失败", "error",function() {})
					}
					else{
						$.messager.alert("提示", "删除成功", "info",function() {})
						$("#menu_div").treegrid("reload");
						$("#menu_div").treegrid("unselectAll");
					}
				},'json')
				}
				})
			};
			//销毁窗口
			function demo_window_close() {
				win.dialog('destroy');
			}
	
</script>
</head>
<body>
    	<div class="easyui-layout" data-options="fit:true,border:false">
		    <div  class="easyui-panel" data-options="region:'center',border:false">
	    		<div id="menu_div" style="heigth:500px ;float: left; "></div>
	    	</div>
    	</div>	

</body>
</html>