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
<script type="text/javascript">
	function add_submit_demo()
	{
		$("#demo_add_form").form('submit', {
			url:'${path.web}/demo/submitDemo',
			success: function(data){
				var data = eval('(' + data + ')'); 
	    		if(data.code == 'S1000'){
	    			demo_window_close();
					$('#demo_datagrid').datagrid('reload');
					showMsg('提示框', '添加成功！');		//提示信息
	      		}
	    		else
	      		{
	    			showMsg('提示框',data.errorText);		//提示信息
	      		}
			}
		});
	}	
	function cancel_submit_demo()
	{
		demo_window_close();
	}	
</script>
<div style="padding: 10px;">	
	<form id="demo_add_form" method="post">
		<table cellpadding="5">
	    		<tr>
	    			<td>名称:</td>
	    			<td><input class="easyui-textbox" type="text" name="name" data-options="required:true,missingMessage:'请输入名称！'" ></input></td>
	    			<td>类型:</td>
	    			<td>
		    			<input id="type" name="type" class="easyui-combobox" data-options="
						    valueField: 'label',
						    textField: 'value',
						    required:true,
						    missingMessage:'请选择类型！',
						    data: 
						    [{
							    label: '1',
							    value: '1'
						    },{
							    label: '2',
							    value: '2'
						    },{
							    label: '3',
							    value: '3'
						    }]" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>描述:</td>
	    			<td><input class="easyui-textbox" type="text" name="description" data-options="required:false,missingMessage:'请输入描述！'"></input></td>
	    			
	    		</tr>
	    			<tr>
	    			<td>描述:</td>
	    			<td><input class="easyui-textbox" type="text" name="description" data-options="required:false,missingMessage:'请输入描述！'"></input></td>
	    			
	    		</tr>
	    			<tr>
	    			<td>描述:</td>
	    			<td><input class="easyui-textbox" type="text" name="description" data-options="required:false,missingMessage:'请输入描述！'"></input></td>
	    			
	    		</tr>
	    			<tr>
	    			<td>描述:</td>
	    			<td><input class="easyui-textbox" type="text" name="description" data-options="required:false,missingMessage:'请输入描述！'"></input></td>
	    			
	    		</tr>
	    			<tr>
	    			<td>描述:</td>
	    			<td><input class="easyui-textbox" type="text" name="description" data-options="required:false,missingMessage:'请输入描述！'"></input></td>
	    			
	    		</tr>
	    </table>
	</form>
	<div style="text-align:center;padding:5px">
			<a class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" onclick="add_submit_demo();" >确定</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)" onclick="cancel_submit_demo();">取消</a>
	</div>
</div>