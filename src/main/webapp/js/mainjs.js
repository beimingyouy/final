		var content_width;
		//创建菜单
		function createMenu(data,path){
			var menulist ='';
			$.each(eval(data), function(i, n) {
				menulist +='<li>';
				menulist += '<a href="javascript:void(0);"> <i class="icon-desktop"> </i> '+n.menuName+' </a>';
				menulist +='<ul class="sub-menu">';
				if(n.subMenus != null){
					$.each(n.subMenus, function(j, o) {
						menulist += '<li> <a href="javascript:void(0);" rel="' + o.menuUrl + '" ref="' + o.openType + '"> <i class="icon-angle-right"> </i> ' + o.menuName + ' </a> </li>'
					})
				}
				menulist += '</ul>';
				menulist += '</li>';
			});
			$('#nav').append(menulist);		
			$('.sub-menu li a').click(function(){
				var tabTitle = $(this).text().trim();
				var url = $(this).attr("rel");
				var openType = $(this).attr("ref");
				if(openType == '1'){
					layout_center_addTabFun({
						title : tabTitle,
						closable : true,
						content : createFrame(path+url)
					});
				}else if(openType == '2'){
					window.open(path+url);
				}else{
					layout_center_addTabFun({
						title : tabTitle,
						closable : true,
						content : createFrame(path+url)
					});
				}
			})
		}
		
		function createFrame(url)
		{
			var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			return s;
		}
		
		//定义tabs组件
		function layout_center_tabscreate(){
			$('#layout_center_tabsMenu').menu({
				style:{
					width:3000
				},
				onClick : function(item) {
					var curTabTitle = $(this).data('tabTitle');
					var type = $(item.target).attr('type');
	
					if (type === 'refresh') {
						layout_center_refreshTab(curTabTitle);
						return;
					}
	
					if (type === 'close') {
						var t = $('#layout_center_tabs').tabs('getTab', curTabTitle);
						if (t.panel('options').closable) {
							$('#layout_center_tabs').tabs('close', curTabTitle);
						}
						return;
					}
	
					var allTabs = $('#layout_center_tabs').tabs('tabs');
					var closeTabsTitle = [];
	
					$.each(allTabs, function() {
						var opt = $(this).panel('options');
						if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
							closeTabsTitle.push(opt.title);
						} else if (opt.closable && type === 'closeAll') {
							closeTabsTitle.push(opt.title);
						}
					});
	
					for ( var i = 0; i < closeTabsTitle.length; i++) {
						$('#layout_center_tabs').tabs('close', closeTabsTitle[i]);
					}
				}
			});	
			$('#layout_center_tabs').tabs({
					fit : true,
					border : false,
					onContextMenu : function(e, title) {
						e.preventDefault();
						$('#layout_center_tabsMenu').menu('show', {
							left : e.pageX,
							top : e.pageY
						}).data('tabTitle', title);
					}
			});
		}
		//刷新tabs组件
		function layout_center_refreshTab(title) {
			$('#layout_center_tabs').tabs('getTab', title).panel('refresh');
		}
		//关闭tabs组件
		function layout_center_closeTab(title)
		{
			$('#layout_center_tabs').tabs('close',title);	
		}
		//关闭后刷新tabs组件
		function layout_center_closeTabAndfresh(title,title2)
		{
			$('#layout_center_tabs').tabs('close',title);	
			layout_center_refreshTab(title2);
		}
		//添加tabs组件
		function layout_center_addTabFun(opts) 
		{
			var t = $('#layout_center_tabs');
			if (t.tabs('exists', opts.title)) {
				t.tabs('select', opts.title);
			}
			else
			{
				t.tabs('add', opts);	
			}	
		}
		//添加同时刷新tabs组件
		function layout_center_addAndRefreshTab(opts)
		{
			var t = $('#layout_center_tabs');
			if (t.tabs('exists', opts.title)) {
				t.tabs('select', opts.title);
				layout_center_refreshTab(opts.title);
			}
			else
			{	
				t.tabs('add', opts);		
			}		
		}
		
		//通知提醒入口
		function index_most_centertab(path){
			layout_center_addTabFun({
							title : "收件箱",
							closable : true,
							content : createFrame(path+'/admin/notify/userlist')
			});
		}
