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
	
	<c:forEach items="${mainMap}" var="menu">
	var menu_id = "${menu.menuId}";
	var loadURL = "<%=path%>/chz/loadMenu.do?menu_id="+menu_id+"&date="+new Date()+"";
	
	$("#tree_div_"+menu_id+"").tree({
		url:			loadURL,
		method:			"get",
		animate:		true,
		lines:			true,
		onClick:		function(node){		
			var isLeaf = 			node.isLeaf;
			var menu_href = 		"<%=path%>" + node.menu_href;
					var menu_name = node.text;
					if (isLeaf == 1) {

						addTab(node.text, menu_href, "icon_save");
					}

				}
			});
	</c:forEach>

	
	
})
</script>
</head>
<body>
<ul id="tt"></ul>  
</body>
</html>