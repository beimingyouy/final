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
<style>
.west {
	width: 200px;
	padding: 10px;
}

.footer {
	text-align: center;
	color: #15428B;
	margin: 0px;
	padding: 0px;
	line-height: 23px;
	font-weight: bold;
}

.tree-title {
	font-size: 15px;
	display: inline-block;
	text-decoration: none;
	vertical-align: top;
	white-space: nowrap;
	padding: 0 2px;
	height: 18px;
	line-height: 18px;
}
</style>
</head>
<body class="easyui-layout" style="overflow-y: hidden" scroll="no">
	<div region="north"  border="false"
		style="overflow: hidden; height: 30px; background: url(<%=path%>/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px; color: #fff; font-family: Verdana, 微软雅黑, 黑体">
		<span style="float: right; padding-right: 20px;" class="head">欢迎
			${user.truename} <a href="#" style="color:white"> 修改密码</a> <a
			href="<%=path%>/chz/login_out.do" id="loginOut" style="color:white">安全退出</a>
		</span> <span style="padding-left: 10px; font-size: 16px;"><img
			width="20" height="20" align="absmiddle"
			src="<%=path%>/images/blocks.gif" />角色管理系统 </span>
	</div>
	<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				
			<h1>首页</h1>

			</div>
		</div>
    </div>


	<div region="west" class="west" title="系统功能"
		style="padding: 0px; margin: 0px; width: 200px">
		<div class="easyui-accordion" data-options="fit:true">
			<c:forEach items="${mainMap}" var="menu">

				<div title="${menu.menuName}" icon="icon-sys"
					style="overflow: auto; font-size: 20px; font-family: 新宋体;">
					<div id="tree_div_${menu.menuId}"></div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div region="south" 
		style="height: 25px; background: #D2E0F2;">
		<div class="footer">${user.truename} 毕设1.0</div>
	</div>

	<div id=mm class="easyui-menu" style="width: 150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
	<script> 
$(function(){
//绑定右键菜单事件
	//关闭当前
	$('#mm-tabclose').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('#tabs').tabs('close',currtab_title);
	})
	//全部关闭
	$('#mm-tabcloseall').click(function(){	
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
		});	
	});
	//关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function(){
		var currtab_title = $('#mm').data("currtab");
		$('.tabs-inner span').each(function(i,n){
			var t = $(n).text();
			if (t != "首页"){
				if(t!=currtab_title)
					$('#tabs').tabs('close',t);
			}
		});	
	});
	//关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		if(nextall.length==0){
			//msgShow('系统提示','后边没有啦~~','error');
			alert('后边没有啦~~');
			return false;
		}
		nextall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
		});
		return false;
	});
	//关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function(){
		var prevall = $('.tabs-selected').prevAll();
		if(prevall.length==0){
			alert('到头了，前边没有啦~~');
			return false;
		}
		prevall.each(function(i,n){
			var t=$('a:eq(0) span',$(n)).text();
			if (t != "首页"){
				$('#tabs').tabs('close',t);
			}
		});
		return false;
	});

	//退出
	$("#mm-exit").click(function(){
		$('#mm').menu('hide');
	})
	
	/*加载每个菜单的树权限*/
			
	<c:forEach items="${mainMap}" var="menu">
	var menu_id = "${menu.menuId}";
	var loadURL = "<%=path%>/admin/loadMenu.do?menu_id="+menu_id+"&date="+new Date()+"";
	
	$("#tree_div_"+menu_id+"").tree({
		url:			loadURL,
		method:			"get",
		animate:		true,
		lines:			true,
		onClick:		function(node){				
			var isLeaf = 			node.isLeaf;
			var menu_href = 		"<%=path%>" +node.menu_href;
			var menu_name = 		node.text;
			if (isLeaf == "1"){
				
				addTab(node.text,menu_href,"icon_save");
			}	
				}
			});
			</c:forEach>

		});

		function addTab(subtitle,url){
	if(!$('#tabs').tabs('exists',subtitle)){
		$('#tabs').tabs('add',{
			title:subtitle,
			content:createFrame(url),
			closable:true,
			width:$('#mainPanle').width()-20,
			height:$('#mainPanle').height()-15
		});
		}else{
		$('#tabs').tabs('select',subtitle);
	}
	tabClose();
	$('#tabs').tabs('select',subtitle);
	}
		function createFrame(url)
		{
			var s = '<iframe name="mainFrame" scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:1500px"></iframe>';
			return s;
		}
		

		function tabClose() {
			/*双击关闭TAB选项卡*/
			$(".tabs-inner").dblclick(function() {
				var subtitle = $(this).children(".tabs-closable").text();
				$('#tabs').tabs('close', subtitle);
			})
			/*为选项卡绑定右键*/
			$(".tabs-inner").bind('contextmenu', function(e) {
				$('#mm').menu('show', {
					left : e.pageX,
					top : e.pageY
				});

				var subtitle = $(this).children(".tabs-closable").text();

				$('#mm').data("currtab", subtitle);
				$('#tabs').tabs('select', subtitle);
				return false;
			});
		}
	</script>
</body>
</html>