/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.3.0

Source Server         : final
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2016-04-01 10:52:12
*/


-- ----------------------------
-- Table structure for "DEMO"
-- ----------------------------
DROP TABLE "DEMO";

  CREATE TABLE "SCOTT"."DEMO" 
   (	"ID" NUMBER(11,0) NOT NULL ENABLE, 
	"NAME" NVARCHAR2(200), 
	"DESCRIPTION" NVARCHAR2(2000), 
	 CHECK ("ID" IS NOT NULL) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of DEMO
-- ----------------------------
INSERT INTO "DEMO" VALUES ('81', '123', '456');
INSERT INTO "DEMO" VALUES ('2', 'name1', 'description1');
INSERT INTO "DEMO" VALUES ('3', 'name3', 'name3');
INSERT INTO "DEMO" VALUES ('4', 'name4', 'description4');
INSERT INTO "DEMO" VALUES ('5', '5', '5');
INSERT INTO "DEMO" VALUES ('6', '6', '6');
INSERT INTO "DEMO" VALUES ('7', '7', '7');
INSERT INTO "DEMO" VALUES ('8', '8', '8');
INSERT INTO "DEMO" VALUES ('9', '9', '9');
INSERT INTO "DEMO" VALUES ('10', '10', '10');
INSERT INTO "DEMO" VALUES ('12', '12', '12');
INSERT INTO "DEMO" VALUES ('13', '12', '12');
INSERT INTO "DEMO" VALUES ('61', 'test', '123');

-- ----------------------------
-- Table structure for "T_MENU"
-- ----------------------------
DROP TABLE "T_MENU";

  CREATE TABLE "SCOTT"."T_MENU" 
   (	"MENU_ID" NUMBER(11,0) NOT NULL ENABLE, 
	"MENU_NAME" NVARCHAR2(1000), 
	"MENU_HREF" VARCHAR2(256), 
	"MENU_TARGET" VARCHAR2(256), 
	"PARENTID" NUMBER(11,0), 
	"GRADE" NUMBER(2,0), 
	"ISLEFT" NUMBER(2,0), 
	 PRIMARY KEY ("MENU_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CHECK ("MENU_ID" IS NOT NULL) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_MENU
-- ----------------------------
INSERT INTO "T_MENU" VALUES ('9', '系统管理', null, null, '0', '1', '0');
INSERT INTO "T_MENU" VALUES ('903', '用户管理', '/user/userList', null, '9', '2', '1');
INSERT INTO "T_MENU" VALUES ('904', '角色管理', '/role/roleList', null, '9', '2', '1');
INSERT INTO "T_MENU" VALUES ('905', '菜单管理', '/menu/menu_list.do', null, '9', '2', '1');

-- ----------------------------
-- Table structure for "T_NOTICE"
-- ----------------------------
DROP TABLE "T_NOTICE";

  CREATE TABLE "SCOTT"."T_NOTICE" 
   (	"NOTICE_ID" NUMBER, 
	"NOTICE_TITLE" NVARCHAR2(200), 
	"NOTICE_CONTENT" NVARCHAR2(2000), 
	"FILENAME" NVARCHAR2(200), 
	"CREATE_DATE" DATE, 
	"END_DATE" DATE, 
	"CREATE_USER" NVARCHAR2(200), 
	"IS_INVALID" NUMBER, 
	 PRIMARY KEY ("NOTICE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_NOTICE
-- ----------------------------
INSERT INTO "T_NOTICE" VALUES ('28', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('29', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:42', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('30', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:43', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('31', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:45', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('21', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/></strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p>', null, TO_DATE('2016-02-18 09:22:01', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('22', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p>', null, TO_DATE('2016-02-18 09:23:10', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('23', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:33:16', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('5', '123', '<p>213</p>', null, TO_DATE('2016-02-17 14:52:09', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123', null);
INSERT INTO "T_NOTICE" VALUES ('8', 'chz', '<p>123<em>123<strong>213</strong></em></p>', null, TO_DATE('2016-02-17 14:58:26', 'YYYY-MM-DD HH24:MI:SS'), null, '321', null);
INSERT INTO "T_NOTICE" VALUES ('24', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:30', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('25', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:34', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('26', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:36', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('27', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:38', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('34', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:50', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('35', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:39:23', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('36', '123', '<p>213</p>', null, TO_DATE('2016-02-18 09:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-20 09:39:53', 'YYYY-MM-DD HH24:MI:SS'), '213', null);
INSERT INTO "T_NOTICE" VALUES ('37', '123', '<p>213</p>', null, TO_DATE('2016-02-18 09:41:14', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-20 09:39:53', 'YYYY-MM-DD HH24:MI:SS'), '213', null);
INSERT INTO "T_NOTICE" VALUES ('38', 'chz', '<p>231<br/></p>', null, TO_DATE('2016-02-18 09:41:29', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-12 09:41:23', 'YYYY-MM-DD HH24:MI:SS'), '123', null);
INSERT INTO "T_NOTICE" VALUES ('32', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:47', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);
INSERT INTO "T_NOTICE" VALUES ('33', '公告', '<p>213123<span style="border: 1px solid rgb(0, 0, 0);">12312312<em>3123<span id="_baidu_bookmark_start_5" style="display: none; line-height: 0px;">？</span></em></span><span id="_baidu_bookmark_start_7" style="display: none; line-height: 0px;">？</span><em>font12312</em>123123<strong>12323123<img src="http://img.baidu.com/hi/jx2/j_0025.gif"/><img src="http://img.baidu.com/hi/jx2/j_0059.gif"/>2131231231231233333333333333哈哈哈啊哈啊哈哈 &nbsp;哈师大好 &nbsp;asd&nbsp;</strong><span id="_baidu_bookmark_end_8" style="display: none; line-height: 0px;">？</span><span style="border: 1px solid rgb(0, 0, 0);"><em><span id="_baidu_bookmark_end_6" style="display: none; line-height: 0px;">？</span></em></span></p><p><strong>敖德萨的</strong></p><p><strong>asd<img src="http://img.baidu.com/hi/jx2/j_0050.gif"/>123 21333333333333333333333333333333333333333333333333333333333333333哈哈哈哈哈哈哈哈哈</strong><span id="_baidu_bookmark_start_13" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_start_15" style="display: none; line-height: 0px;">？</span>fontasd&nbsp;<em>按时打算 &nbsp;爱迪生阿达asd请问请问 请问 请问请问 请问我wqe 请问</em><span id="_baidu_bookmark_end_16" style="display: none; line-height: 0px;">？</span><span id="_baidu_bookmark_end_14" style="display: none; line-height: 0px;">？</span></p><p><em>请问</em></p><p><em>qwe</em></p><p><em><br/></em></p><p><em>qwe</em></p><p><em>qweqwe</em></p><p><em>2131</em></p><p><em><img src="http://img.baidu.com/hi/jx2/j_0017.gif"/></em></p><p><em>123<img src="http://img.baidu.com/hi/jx2/j_0020.gif"/>213</em></p>', null, TO_DATE('2016-02-18 09:35:48', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-02-19 09:21:21', 'YYYY-MM-DD HH24:MI:SS'), '陈汉泽', null);

-- ----------------------------
-- Table structure for "T_ROLE"
-- ----------------------------
DROP TABLE "T_ROLE";

  CREATE TABLE "SCOTT"."T_ROLE" 
   (	"ROLE_ID" NUMBER(20,0) NOT NULL ENABLE, 
	"ROLE_NAME" VARCHAR2(256), 
	"ROLE_CODE" VARCHAR2(256), 
	"CREATER_ID" NUMBER(20,0), 
	"IS_SYS" NUMBER(2,0), 
	"ENABLE" NUMBER(2,0), 
	"NOTE" VARCHAR2(2048), 
	"CREATE_DATE" DATE, 
	"UPDATE_DATE" DATE, 
	 CONSTRAINT "PK_TSYS_ROLE" PRIMARY KEY ("ROLE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CHECK ("ROLE_ID" IS NOT NULL) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_ROLE
-- ----------------------------
INSERT INTO "T_ROLE" VALUES ('1', '超级管理员', '1', null, null, '1', null, TO_DATE('2016-04-01 10:29:52', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2016-04-01 10:44:12', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for "T_ROLE_MENU"
-- ----------------------------
DROP TABLE "T_ROLE_MENU";

  CREATE TABLE "SCOTT"."T_ROLE_MENU" 
   (	"ID" NUMBER(11,0) NOT NULL ENABLE, 
	"ROLE_ID" NUMBER(11,0) NOT NULL ENABLE, 
	"MENU_ID" NUMBER(11,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CHECK ("ID" IS NOT NULL) ENABLE, 
	 CHECK ("ROLE_ID" IS NOT NULL) ENABLE, 
	 CHECK ("MENU_ID" IS NOT NULL) ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_ROLE_MENU
-- ----------------------------
INSERT INTO "T_ROLE_MENU" VALUES ('1025', '1', '904');
INSERT INTO "T_ROLE_MENU" VALUES ('1023', '1', '9');
INSERT INTO "T_ROLE_MENU" VALUES ('1026', '1', '905');
INSERT INTO "T_ROLE_MENU" VALUES ('1024', '1', '903');

-- ----------------------------
-- Table structure for "T_USER"
-- ----------------------------
DROP TABLE "T_USER";

  CREATE TABLE "SCOTT"."T_USER" 
   (	"USERID" NUMBER(11,0) NOT NULL ENABLE, 
	"USERNAME" NVARCHAR2(1000) NOT NULL ENABLE, 
	"TRUENAME" NVARCHAR2(1000) NOT NULL ENABLE, 
	"SEX" NUMBER(1,0) NOT NULL ENABLE, 
	"ADDRESS" NVARCHAR2(1000), 
	"PASSWORD" VARCHAR2(1000) NOT NULL ENABLE, 
	 PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_USER
-- ----------------------------
INSERT INTO "T_USER" VALUES ('1', 'admin', 'ZHUANGYI', '0', '1', 'admin');

-- ----------------------------
-- Table structure for "T_USER_ROLE"
-- ----------------------------
DROP TABLE "T_USER_ROLE";

  CREATE TABLE "SCOTT"."T_USER_ROLE" 
   (	"ID" NUMBER(20,0) NOT NULL ENABLE, 
	"ROLE_ID" NUMBER(20,0) NOT NULL ENABLE, 
	"USER_ID" NUMBER(20,0), 
	 CONSTRAINT "PK_TSYS_USER_ROLE" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 ;

-- ----------------------------
-- Records of T_USER_ROLE
-- ----------------------------
INSERT INTO "T_USER_ROLE" VALUES ('1', '1', '1');
