package com.zy.role.view;

public interface View {
	public interface role {
		public static String ROLE_LIST = "WEB-INF/view/role/role_list";
		public static String ROLE_ADD = "WEB-INF/view/role/role_add";
		public static String EDIT_ROLE = "WEB-INF/view/role/edit_role";

	}
	public  interface menu{
		public static String MENU_LIST = "WEB-INF/view/menu/menu_list";
		public static String MENU_ADD_CHILD = "WEB-INF/view/menu/menu_add_child";
		public static String MENU_ADD_PARENT = "WEB-INF/view/menu/menu_add_parent";
		public static String MENU_UPDATE = "WEB-INF/view/menu/menu_update";
		public static String MENU_VIEW = "WEB-INF/view/menu/menu_view";
		

	}

}
