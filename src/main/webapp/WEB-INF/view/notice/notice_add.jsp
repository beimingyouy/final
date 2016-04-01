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
	src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/js/ueditor1_3_6-utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/js/ueditor1_3_6-utf8-jsp/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="utf-8"
	src="<%=path%>/js/ueditor1_3_6-utf8-jsp/lang/zh-cn/zh-cn.js"></script>
<script>
	/* $(function() {
		var formData = {
			"url" : window.location.href
		};
		var url = "${path}/login/login!checkUser.action";
		$.post(url, formData, function(jsonData) {
			var flag = jsonData.flag;
			if (!flag) {
				window.location.href = "${path}/common/limit.jsp";
			}
		}, "json");
	}) */
	$(function() {
		var configObj = {
			toolbars : [ [ 'fullscreen', 'source', '|', 'undo', 'redo', '|',
					'bold', 'italic', 'underline', 'fontborder',
					'strikethrough', 'superscript', 'subscript',
					'removeformat', 'formatmatch', 'autotypeset', 'blockquote',
					'pasteplain', '|', 'forecolor', 'backcolor',
					'insertorderedlist', 'insertunorderedlist', 'selectall',
					'cleardoc', '|', 'rowspacingtop', 'rowspacingbottom',
					'lineheight', '|', 'link', 'unlink', 'anchor', '|',
					'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
					'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music',
					'attachment', 'map', 'gmap', 'insertframe', 'insertcode',
					'webapp', 'pagebreak', 'template', 'background', '|',
					'print', 'preview', 'searchreplace', 'help', 'drafts' ] ],
			autoHeightEnabled : false
		};
		UE.getEditor('notice_content', configObj);

		var flag = "${flag}";
		var errorMsg = "${errorMsg}";
		if (flag == "false") {
			alert(errorMsg);
		}
	})
	function submitForm() {
		var formdate = $('#demo_add_form').serializeArray();
		var url = '<%=path%>/notice/submit.do';
		$.post(url, formdate, function(json) {
			var flag = json.flag;
			var msg = json.msg;

			if (flag == 'false') {
				$.messager.alert("错误提示", "添加失败， 原因是" + msg, "error",
						function() {
						})
			} else {
				$.messager.alert("提示", "添加成功", "info", function() {
					$("#demo_add_form")[0].reset();
				})
			}
		}, "json");
	}
</script>
<style>
table {
	border-collapse: collapse;
}

td {
	padding: 5px;
}

input[type="text"] {
	width: 250px;
}
</style>
</head>
<body>
	<form  id="demo_add_form">
		<table border="1" width="100%" style="font-size: 12px;">
			<tr>
				<td style="width: 20%; text-align: right">公告标题</td>
				<td><input type="text" name="notice_title" id="notice_title" /></td>
			</tr>
			<tr>
				<td style="width: 20%; text-align: right">截止时间</td>
				<td><input id="end_date1" name="end_date1"  class="easyui-datetimebox" name="birthday"     
       					 data-options="required:true,showSeconds:true"  style="width:150px">  </td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td style="width: 20%; text-align: right">发布人</td>
				<td><input type="text" name="create_user" /></td>
			</tr>
			<tr>
				<td style="width: 20%; text-align: right">公告内容</td>
				<td><script id="notice_content" name="notice_content"
						type="text/plain" style="width: 100%; height: 300px;"></script></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center">
					<button type="button" class="easyui-linkbutton"
						onclick="submitForm();">保存公告</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

