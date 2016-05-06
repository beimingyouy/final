prompt PL/SQL Developer import file
prompt Created on 2016ƒÍ5‘¬7»’ by zyc
set feedback off
set define off
prompt Disabling triggers for DEMO...
alter table DEMO disable all triggers;
prompt Disabling triggers for T_CAR...
alter table T_CAR disable all triggers;
prompt Disabling triggers for T_IN...
alter table T_IN disable all triggers;
prompt Disabling triggers for T_MENU...
alter table T_MENU disable all triggers;
prompt Disabling triggers for T_NOTICE...
alter table T_NOTICE disable all triggers;
prompt Disabling triggers for T_OUT...
alter table T_OUT disable all triggers;
prompt Disabling triggers for T_POSITION...
alter table T_POSITION disable all triggers;
prompt Disabling triggers for T_ROLE...
alter table T_ROLE disable all triggers;
prompt Disabling triggers for T_ROLE_MENU...
alter table T_ROLE_MENU disable all triggers;
prompt Disabling triggers for T_USER...
alter table T_USER disable all triggers;
prompt Disabling triggers for T_USER_ROLE...
alter table T_USER_ROLE disable all triggers;
prompt Disabling triggers for T_WM...
alter table T_WM disable all triggers;
prompt Deleting T_WM...
delete from T_WM;
commit;
prompt Deleting T_USER_ROLE...
delete from T_USER_ROLE;
commit;
prompt Deleting T_USER...
delete from T_USER;
commit;
prompt Deleting T_ROLE_MENU...
delete from T_ROLE_MENU;
commit;
prompt Deleting T_ROLE...
delete from T_ROLE;
commit;
prompt Deleting T_POSITION...
delete from T_POSITION;
commit;
prompt Deleting T_OUT...
delete from T_OUT;
commit;
prompt Deleting T_NOTICE...
delete from T_NOTICE;
commit;
prompt Deleting T_MENU...
delete from T_MENU;
commit;
prompt Deleting T_IN...
delete from T_IN;
commit;
prompt Deleting T_CAR...
delete from T_CAR;
commit;
prompt Deleting DEMO...
delete from DEMO;
commit;
prompt Loading DEMO...
insert into DEMO (ID, NAME, DESCRIPTION)
values (81, '123', '456');
insert into DEMO (ID, NAME, DESCRIPTION)
values (2, 'name1', 'description1');
insert into DEMO (ID, NAME, DESCRIPTION)
values (3, 'name3', 'name3');
insert into DEMO (ID, NAME, DESCRIPTION)
values (4, 'name4', 'description4');
insert into DEMO (ID, NAME, DESCRIPTION)
values (5, '5', '5');
insert into DEMO (ID, NAME, DESCRIPTION)
values (6, '6', '6');
insert into DEMO (ID, NAME, DESCRIPTION)
values (7, '7', '7');
insert into DEMO (ID, NAME, DESCRIPTION)
values (8, '8', '8');
insert into DEMO (ID, NAME, DESCRIPTION)
values (9, '9', '9');
insert into DEMO (ID, NAME, DESCRIPTION)
values (10, '10', '10');
insert into DEMO (ID, NAME, DESCRIPTION)
values (12, '12', '12');
insert into DEMO (ID, NAME, DESCRIPTION)
values (13, '12', '12');
insert into DEMO (ID, NAME, DESCRIPTION)
values (61, 'test', '123');
commit;
prompt 13 records loaded
prompt Loading T_CAR...
insert into T_CAR (ID, CAR_ID, CAR_NAME, CAR_COUNT, CAR_ALL)
values (8, '≥µ¡æ≤‚ ‘001', '≤‚ ‘≈‹≥µ', 30, 100);
insert into T_CAR (ID, CAR_ID, CAR_NAME, CAR_COUNT, CAR_ALL)
values (7, '122', '100¡æ', 34, 100);
insert into T_CAR (ID, CAR_ID, CAR_NAME, CAR_COUNT, CAR_ALL)
values (6, '1', 'À—À˜À≠Àµµƒ', 1, 1);
commit;
prompt 3 records loaded
prompt Loading T_IN...
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (48, '111', '555', '≤÷¥¢100', 50, '≤‚ ‘≤÷Œª001', 50, to_timestamp('06-05-2016 20:33:15.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 20:33:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (36, '11', '1', '≤÷¥¢100', 11, '≤‚ ‘100', 1, to_timestamp('26-04-2016 21:15:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-04-2016 21:15:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (33, '1', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 1, to_timestamp('26-04-2016 17:17:09.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (38, '1∫≈»Îø‚µ•', '11', '≤÷¥¢100', 1, '≤‚ ‘100', 11, to_timestamp('27-04-2016 10:42:11.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-04-2016 10:42:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (39, '»Îø‚2∫≈', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 1, to_timestamp('27-04-2016 10:43:16.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-04-2016 10:43:28.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (40, '11', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 1, to_timestamp('27-04-2016 11:20:22.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-04-2016 11:20:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (41, '≤‚ ‘1∫≈', '∞°', '≤÷¥¢100', 1, '≤‚ ‘100', 1, to_timestamp('27-04-2016 11:26:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-04-2016 11:28:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (43, '4-27', '4-27', '≤÷¥¢100', 50, '≤‚ ‘≤÷Œª001', 50, to_timestamp('27-04-2016 16:19:59.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('27-04-2016 16:20:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (46, '1', '11111', '≤÷¥¢100', 50, '≤‚ ‘100', 50, to_timestamp('06-05-2016 20:21:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 20:21:41.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (32, '1', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 2, to_timestamp('26-04-2016 17:10:00.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-04-2016 21:10:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (47, '111', '11', '≤‚ ‘ÃÌº”001', 11, '≤‚ ‘≤÷Œª001', 11, to_timestamp('06-05-2016 20:27:10.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 20:27:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (45, '2016-5-6 20:19', '≤‚ ‘', '≤÷¥¢100', 50, '≤‚ ‘100', 50, to_timestamp('06-05-2016 20:19:32.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 20:19:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (49, '111', '11', '≤‚ ‘ÃÌº”001', 11, '≤‚ ‘≤÷Œª001', 11, to_timestamp('06-05-2016 22:27:46.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), null, 2);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (50, '1', '11', '≤÷¥¢100', 11, '≤‚ ‘100', 1, to_timestamp('06-05-2016 22:28:18.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 22:28:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (34, '1111', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 10, to_timestamp('26-04-2016 21:01:52.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-04-2016 21:02:12.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (35, '1', '1', '≤÷¥¢100', 1, '≤‚ ‘100', 11, to_timestamp('26-04-2016 21:11:04.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-04-2016 21:13:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (37, '°§1°§', '1', '≤÷¥¢100', 11, '≤‚ ‘100', 1, to_timestamp('26-04-2016 21:16:58.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('26-04-2016 21:22:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (51, '≤‚ ‘»Îø‚µ•01', '≤‚ ‘»Îø‚µ•01', '≤÷¥¢100', 10, '≤‚ ‘100', 10, to_timestamp('06-05-2016 23:53:23.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('06-05-2016 23:58:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1);
insert into T_IN (ID, IN_ID, IN_NOTE, WM_ID, WM_COUNT, P_ID, P_COUNT, CREATE_TIME, UPDATE_TIME, STATE)
values (52, '≤‚ ‘»Îø‚µ•02', '≤‚ ‘»Îø‚µ•02', '≤÷¥¢100', 10, '≤‚ ‘100', 10, to_timestamp('07-05-2016 00:01:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), to_timestamp('07-05-2016 00:01:56.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0);
commit;
prompt 19 records loaded
prompt Loading T_MENU...
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (1, 'œµÕ≥π‹¿Ì', null, null, 0, 1, 0);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (103, '”√ªßπ‹¿Ì', '/user/userList', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (104, 'Ω«…´π‹¿Ì', '/role/roleList', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (105, '≤Àµ•π‹¿Ì', '/menu/menu_list.do', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (2, 'π´∏Êπ‹¿Ì', null, null, 0, 1, 0);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (201, 'ÃÌº”π´∏Ê', '/notice/notice_add.do', null, 2, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (202, 'π´∏Ê≤Èø¥', '/notice/notice_list.do', null, 2, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (101, '≤÷Œª◊ ‘¥π‹¿Ì', '/position/list', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (1008, '≥ˆø‚µ•¡˜≥Ãπ‹¿Ì', '/out/list', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (1007, '≥µ¡æ◊ ‘¥π‹¿Ì', '/car/list', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (102, '≤÷¥¢◊ ‘¥π‹¿Ì', '/wm/wmList', null, 1, 2, 1);
insert into T_MENU (MENU_ID, MENU_NAME, MENU_HREF, MENU_TARGET, PARENTID, GRADE, ISLEFT)
values (1001, '»Îø‚µ•¡˜≥Ãπ‹¿Ì', '/in/inList', null, 1, 2, 1);
commit;
prompt 12 records loaded
prompt Loading T_NOTICE...
prompt Table is empty
prompt Loading T_OUT...
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (12, 'Out111', '111', '≥µ¡æ≤‚ ‘001', 1, to_timestamp('06-05-2016 20:33:30.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, to_timestamp('06-05-2016 22:27:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (3, 'Out°§1°§', null, '122', 11, to_timestamp('26-04-2016 21:22:53.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null);
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (1, 'Outnull', null, '122', 50, to_timestamp('26-04-2016 21:13:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null);
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (9, 'Out4-27', '4-27', '≥µ¡æ≤‚ ‘001', 1, to_timestamp('27-04-2016 16:20:50.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null);
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (4, 'Outnull', null, '122', 50, to_timestamp('27-04-2016 09:59:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, to_timestamp('27-04-2016 11:46:35.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (5, 'Out1∫≈»Îø‚µ•', null, '122', 50, to_timestamp('27-04-2016 10:42:17.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, to_timestamp('27-04-2016 11:46:51.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (8, 'Out≤‚ ‘1∫≈', '≤‚ ‘1∫≈', '≥µ¡æ≤‚ ‘001', 11, to_timestamp('27-04-2016 11:28:03.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, to_timestamp('27-04-2016 11:43:55.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (10, 'Out2016-5-6 20:19', '2016-5-6 20:19', '≥µ¡æ≤‚ ‘001', 50, to_timestamp('06-05-2016 20:19:39.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 1, null);
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (11, 'Out111', '111', '122', 1, to_timestamp('06-05-2016 20:27:14.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 0, null);
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (13, 'Out1', '1', '≥µ¡æ≤‚ ‘001', 7, to_timestamp('06-05-2016 22:28:45.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, to_timestamp('06-05-2016 22:29:27.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into T_OUT (ID, OUT_ID, IN_ID, CAR_ID, CAR_COUNT, CREATE_DATE, STATE, UPDATE_DATE)
values (14, 'Out≤‚ ‘»Îø‚µ•01', '≤‚ ‘»Îø‚µ•01', '122', 5, to_timestamp('06-05-2016 23:58:01.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), 3, to_timestamp('07-05-2016 00:30:06.000000', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 11 records loaded
prompt Loading T_POSITION...
insert into T_POSITION (ID, P_ID, P_COUNT, P_ALL, P_NAME)
values (33, '≤‚ ‘≤÷Œª001', 39, 100, '≤÷Œª001');
insert into T_POSITION (ID, P_ID, P_COUNT, P_ALL, P_NAME)
values (32, '≤‚ ‘100', 100, 100, '≤‚ ‘100');
commit;
prompt 2 records loaded
prompt Loading T_ROLE...
insert into T_ROLE (ROLE_ID, ROLE_NAME, ROLE_CODE, CREATER_ID, IS_SYS, ENABLE, NOTE, CREATE_DATE, UPDATE_DATE)
values (1, '≥¨º∂π‹¿Ì‘±', '1', null, null, 1, '”µ”–À˘”–»®œﬁ≈∂', to_date('01-04-2016 10:29:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('26-04-2016 20:46:33', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_ROLE (ROLE_ID, ROLE_NAME, ROLE_CODE, CREATER_ID, IS_SYS, ENABLE, NOTE, CREATE_DATE, UPDATE_DATE)
values (106, '≤‚ ‘–ﬁ∏ƒ', null, null, null, null, '≤‚ ‘Ω«…´', null, to_date('27-04-2016 16:11:58', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading T_ROLE_MENU...
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1065, 106, 105);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1067, 106, 1001);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1069, 106, 1008);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1071, 106, 201);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1061, 106, 101);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1063, 106, 103);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1036, 1, 102);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1037, 1, 103);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1038, 1, 104);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1039, 1, 105);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1040, 1, 106);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1034, 1, 1);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1041, 1, 1001);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1035, 1, 101);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1042, 1, 1007);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1043, 1, 1008);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1044, 1, 2);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1045, 1, 201);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1046, 1, 202);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1064, 106, 104);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1066, 106, 106);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1068, 106, 1007);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1070, 106, 2);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1072, 106, 202);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1060, 106, 1);
insert into T_ROLE_MENU (ID, ROLE_ID, MENU_ID)
values (1062, 106, 102);
commit;
prompt 26 records loaded
prompt Loading T_USER...
insert into T_USER (USERID, USERNAME, TRUENAME, SEX, ADDRESS, PASSWORD)
values (1, 'admin', 'ZHUANGYI', 0, '1', 'admin');
insert into T_USER (USERID, USERNAME, TRUENAME, SEX, ADDRESS, PASSWORD)
values (251, 'zhuangyi', 'zhuangyi', 0, '∏£Ω®', 'admin');
commit;
prompt 2 records loaded
prompt Loading T_USER_ROLE...
insert into T_USER_ROLE (ID, ROLE_ID, USER_ID)
values (1, 1, 1);
commit;
prompt 1 records loaded
prompt Loading T_WM...
insert into T_WM (WM_ID, WM_NAME, WM_COUNT, WM_ALL, ID)
values ('≤‚ ‘ÃÌº”001', '≤‚ ‘ÃÌº”', 89, 100, 29);
insert into T_WM (WM_ID, WM_NAME, WM_COUNT, WM_ALL, ID)
values ('≤÷¥¢100', '≤÷¥¢100', 50, 100, 27);
commit;
prompt 2 records loaded
prompt Enabling triggers for DEMO...
alter table DEMO enable all triggers;
prompt Enabling triggers for T_CAR...
alter table T_CAR enable all triggers;
prompt Enabling triggers for T_IN...
alter table T_IN enable all triggers;
prompt Enabling triggers for T_MENU...
alter table T_MENU enable all triggers;
prompt Enabling triggers for T_NOTICE...
alter table T_NOTICE enable all triggers;
prompt Enabling triggers for T_OUT...
alter table T_OUT enable all triggers;
prompt Enabling triggers for T_POSITION...
alter table T_POSITION enable all triggers;
prompt Enabling triggers for T_ROLE...
alter table T_ROLE enable all triggers;
prompt Enabling triggers for T_ROLE_MENU...
alter table T_ROLE_MENU enable all triggers;
prompt Enabling triggers for T_USER...
alter table T_USER enable all triggers;
prompt Enabling triggers for T_USER_ROLE...
alter table T_USER_ROLE enable all triggers;
prompt Enabling triggers for T_WM...
alter table T_WM enable all triggers;
set feedback on
set define on
prompt Done.
