<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center',border:true">
			<table id="demo1_datagrid"></table>
		</div>
	</div>
<script>
$(function(){
			var toolbar = [
					  {id:"menu", 	text:"分配权限",		iconCls:'icon-remove',
					   handler: 		function(){
					    				give1();
					    					    	}},
				    	   				
			          {id:"refresh", 	text:"刷新",			iconCls:'icon-reload',
				       handler: 		function(){
				    	   					$("#demo1_datagrid").datagrid("reload");
				    	   				}} 
	                ];
			//定义列表
			var userid = ${userid};
			$('#demo1_datagrid').datagrid({
				url:'<%=path%>/user/rolelist.do?userid='+userid,
			fit : true,
			fitColumns : false,
			singleSelect : true,
			rownumbers : true,
			pagination : true,
			border : false,
			autoRowHeight : true,
			toolbar : toolbar,
			frozenColumns : [ [ 
				{checkbox:true,			width:30},
			   	{
				field : 'roleName',
				title : '角色名',
				align : 'center',
				width : 80
			} ] ],
			columns : [ [ {
				field : 'note',
				title : '备注',
				align : 'center',
				width : 100
			}
			] ],
			onLoadSuccess: function (data) {
				var roleid = data.roleid;
				var row = $("#demo1_datagrid").datagrid('getRows');
				for(var i = 0;i<row.length;i++){
					
					if(row[i].roleId==roleid){
						$('#demo1_datagrid').datagrid("selectRow", i);
					}
				}	
				
			}
			
		});
	});
	
	function give1(){
		
		var row = $('#demo1_datagrid').datagrid('getChecked');
		if (row == '') {
			$.messager.alert('提示框', '请选择一行数据！');
			return false;
		}
		var roleid = row[0].roleId;
		
		var userid = ${userid};
		var url = '<%=path%>/user/givesubmit.do?userid='+userid+'&roleid='+roleid;
				
		$.post(url,null,function(json){
			var flag = json.flag;
			var msg = json.msg;
			
			if(flag != "false"){
				
				$.messager.alert("提示","权限分配成功","info",function(){});
				win_menu.dialog("destroy");
				$("#demo_datagrid").datagrid("reload");
			}else{
				
				$.messager.alert("错误提示","权限分配失败","error",function(){});
			}
			
		},"json")
	}
</script>
</body>
</html>