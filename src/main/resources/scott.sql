-----------------------------------------
-- Export file for user SCOTT          --
-- Created by zyc on 2016/5/7, 0:50:53 --
-----------------------------------------

spool scott.log

prompt
prompt Creating table DEMO
prompt ===================
prompt
create table SCOTT.DEMO
(
  ID          NUMBER(11) not null,
  NAME        NVARCHAR2(200),
  DESCRIPTION NVARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_CAR
prompt ====================
prompt
create table SCOTT.T_CAR
(
  ID        NUMBER(10) not null,
  CAR_ID    VARCHAR2(256),
  CAR_NAME  VARCHAR2(256),
  CAR_COUNT NUMBER(19),
  CAR_ALL   NUMBER(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_CAR
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_IN
prompt ===================
prompt
create table SCOTT.T_IN
(
  ID          NUMBER not null,
  IN_ID       VARCHAR2(20),
  IN_NOTE     VARCHAR2(2000),
  WM_ID       VARCHAR2(256),
  WM_COUNT    NUMBER,
  P_ID        VARCHAR2(256),
  P_COUNT     NUMBER,
  CREATE_TIME TIMESTAMP(6),
  UPDATE_TIME TIMESTAMP(6),
  STATE       NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_IN
  add constraint T_IN_PRIMARY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_MENU
prompt =====================
prompt
create table SCOTT.T_MENU
(
  MENU_ID     NUMBER(11) not null,
  MENU_NAME   NVARCHAR2(1000),
  MENU_HREF   VARCHAR2(256),
  MENU_TARGET VARCHAR2(256),
  PARENTID    NUMBER(11),
  GRADE       NUMBER(2),
  ISLEFT      NUMBER(2)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_MENU
  add primary key (MENU_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_NOTICE
prompt =======================
prompt
create table SCOTT.T_NOTICE
(
  NOTICE_ID      NUMBER not null,
  NOTICE_TITLE   NVARCHAR2(200),
  NOTICE_CONTENT NVARCHAR2(2000),
  FILENAME       NVARCHAR2(200),
  CREATE_DATE    DATE,
  END_DATE       DATE,
  CREATE_USER    NVARCHAR2(200),
  IS_INVALID     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_NOTICE
  add primary key (NOTICE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_OUT
prompt ====================
prompt
create table SCOTT.T_OUT
(
  ID          NUMBER not null,
  OUT_ID      VARCHAR2(256),
  IN_ID       VARCHAR2(256),
  CAR_ID      VARCHAR2(256),
  CAR_COUNT   NUMBER,
  CREATE_DATE TIMESTAMP(6),
  STATE       NUMBER,
  UPDATE_DATE TIMESTAMP(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_OUT
  add constraint T_OUT_PRIMAREY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_POSITION
prompt =========================
prompt
create table SCOTT.T_POSITION
(
  ID      NUMBER(10) not null,
  P_ID    VARCHAR2(256),
  P_COUNT NUMBER(10),
  P_ALL   NUMBER(10),
  P_NAME  VARCHAR2(256)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_POSITION
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ROLE
prompt =====================
prompt
create table SCOTT.T_ROLE
(
  ROLE_ID     NUMBER(20) not null,
  ROLE_NAME   VARCHAR2(256),
  ROLE_CODE   VARCHAR2(256),
  CREATER_ID  NUMBER(20),
  IS_SYS      NUMBER(2),
  ENABLE      NUMBER(2),
  NOTE        VARCHAR2(2048),
  CREATE_DATE DATE,
  UPDATE_DATE DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_ROLE
  add constraint PK_TSYS_ROLE primary key (ROLE_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_ROLE_MENU
prompt ==========================
prompt
create table SCOTT.T_ROLE_MENU
(
  ID      NUMBER(11) not null,
  ROLE_ID NUMBER(11) not null,
  MENU_ID NUMBER(11) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_ROLE_MENU
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER
prompt =====================
prompt
create table SCOTT.T_USER
(
  USERID   NUMBER(11) not null,
  USERNAME NVARCHAR2(1000) not null,
  TRUENAME NVARCHAR2(1000) not null,
  SEX      NUMBER(1) not null,
  ADDRESS  NVARCHAR2(1000),
  PASSWORD VARCHAR2(1000) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_USER
  add primary key (USERID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_USER_ROLE
prompt ==========================
prompt
create table SCOTT.T_USER_ROLE
(
  ID      NUMBER(20) not null,
  ROLE_ID NUMBER(20) not null,
  USER_ID NUMBER(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_USER_ROLE
  add constraint PK_TSYS_USER_ROLE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table T_WM
prompt ===================
prompt
create table SCOTT.T_WM
(
  WM_ID    VARCHAR2(256) not null,
  WM_NAME  VARCHAR2(256),
  WM_COUNT NUMBER(10),
  WM_ALL   NUMBER(10),
  ID       NUMBER(10) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SCOTT.T_WM
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence DEMO_SEQUENCE
prompt ===============================
prompt
create sequence SCOTT.DEMO_SEQUENCE
minvalue 1
maxvalue 999999
start with 101
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence EMP_SEQUENCE
prompt ==============================
prompt
create sequence SCOTT.EMP_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 26
increment by 1
nocache;

prompt
prompt Creating sequence GOODS_SEQUENCE
prompt ================================
prompt
create sequence SCOTT.GOODS_SEQUENCE
minvalue 5
maxvalue 99999999999999999999999999
start with 45
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence GOODS_TYPE_SEQUENCE
prompt =====================================
prompt
create sequence SCOTT.GOODS_TYPE_SEQUENCE
minvalue 5
maxvalue 99999999999999999999
start with 45
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence NOTICE_SEQUENCE
prompt =================================
prompt
create sequence SCOTT.NOTICE_SEQUENCE
minvalue 1
maxvalue 9999999999999
start with 64
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence ORDER_APPLY_SEQUENCE
prompt ======================================
prompt
create sequence SCOTT.ORDER_APPLY_SEQUENCE
minvalue 5
maxvalue 9999999999999999999999999999
start with 25
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence PURCHASE_GOODS_SEQUENCE
prompt =========================================
prompt
create sequence SCOTT.PURCHASE_GOODS_SEQUENCE
minvalue 5
maxvalue 9999999999999999999999999999
start with 45
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence PURCHASE_SEQUENCE
prompt ===================================
prompt
create sequence SCOTT.PURCHASE_SEQUENCE
minvalue 5
maxvalue 9999999999999999999999999999
start with 45
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence ROLE_MENU_SEQUENCE
prompt ====================================
prompt
create sequence SCOTT.ROLE_MENU_SEQUENCE
minvalue 70
maxvalue 9999999999999999999
start with 1073
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence ROLE_SEQUENCE
prompt ===============================
prompt
create sequence SCOTT.ROLE_SEQUENCE
minvalue 6
maxvalue 99999
start with 107
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_T_CAR
prompt ===========================
prompt
create sequence SCOTT.SEQ_T_CAR
minvalue 1
maxvalue 9999999999999999999999999
start with 9
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_T_IN
prompt ==========================
prompt
create sequence SCOTT.SEQ_T_IN
minvalue 1
maxvalue 9999999999999999999999999999
start with 64
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_OUT
prompt ===========================
prompt
create sequence SCOTT.SEQ_T_OUT
minvalue 1
maxvalue 9999999999999999999999999999
start with 30
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_T_POSITION
prompt ================================
prompt
create sequence SCOTT.SEQ_T_POSITION
minvalue 1
maxvalue 9999999999999999999999999999
start with 34
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence SEQ_T_WM
prompt ==========================
prompt
create sequence SCOTT.SEQ_T_WM
minvalue 0
maxvalue 9999999999999999999999999999
start with 30
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence T_USER_SEQUENCE
prompt =================================
prompt
create sequence SCOTT.T_USER_SEQUENCE
minvalue 10
maxvalue 9999999
start with 252
increment by 1
cache 20
cycle;

prompt
prompt Creating sequence USER_ROLE_SEQUENCE
prompt ====================================
prompt
create sequence SCOTT.USER_ROLE_SEQUENCE
minvalue 6
maxvalue 999999999999
start with 66
increment by 1
cache 20
cycle;


spool off
