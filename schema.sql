/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/24/2026 1:06:33 PM                        */
/*==============================================================*/


alter table BASE 
   drop foreign key FK_BASE_COMMANDS__SOLDIER;

alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_ASSIGNED__UNIT;

alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_IS_OF_TYP_EQUIPMEN;

alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_STORED_AT_BASE;

alter table INJURY 
   drop foreign key FK_INJURY_OCCURS_DU_MISSION;

alter table INJURY 
   drop foreign key FK_INJURY_SUFFERS_SOLDIER;

alter table IS_CERTIFIED_IN 
   drop foreign key FK_IS_CERTI_IS_CERTIF_SPECIALI;

alter table IS_CERTIFIED_IN 
   drop foreign key FK_IS_CERTI_IS_CERTIF_SOLDIER;

alter table PARTICIPATES_IN 
   drop foreign key FK_PARTICIP_PARTICIPA_MISSION;

alter table PARTICIPATES_IN 
   drop foreign key FK_PARTICIP_PARTICIPA_UNIT;

alter table SOLDIER 
   drop foreign key FK_SOLDIER_HAS_RANK_MILITARY;

alter table SOLDIER 
   drop foreign key FK_SOLDIER_SERVES_IN_UNIT;

alter table UNIT 
   drop foreign key FK_UNIT_COMMANDS__SOLDIER;

alter table UNIT 
   drop foreign key FK_UNIT_CURRENTLY_BASE;

alter table UNIT 
   drop foreign key FK_UNIT_HOME_BASE_BASE;

alter table UNIT 
   drop foreign key FK_UNIT_IS_PART_UNIT;


alter table BASE 
   drop foreign key FK_BASE_COMMANDS__SOLDIER;

drop table if exists BASE;


alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_IS_OF_TYP_EQUIPMEN;

alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_STORED_AT_BASE;

alter table EQUIPMENT 
   drop foreign key FK_EQUIPMEN_ASSIGNED__UNIT;

drop table if exists EQUIPMENT;

drop table if exists EQUIPMENT_TYPE;


alter table INJURY 
   drop foreign key FK_INJURY_SUFFERS_SOLDIER;

alter table INJURY 
   drop foreign key FK_INJURY_OCCURS_DU_MISSION;

drop table if exists INJURY;


alter table IS_CERTIFIED_IN 
   drop foreign key FK_IS_CERTI_IS_CERTIF_SPECIALI;

alter table IS_CERTIFIED_IN 
   drop foreign key FK_IS_CERTI_IS_CERTIF_SOLDIER;

drop table if exists IS_CERTIFIED_IN;

drop table if exists MILITARY_RANK;

drop table if exists MISSION;


alter table PARTICIPATES_IN 
   drop foreign key FK_PARTICIP_PARTICIPA_MISSION;

alter table PARTICIPATES_IN 
   drop foreign key FK_PARTICIP_PARTICIPA_UNIT;

drop table if exists PARTICIPATES_IN;


alter table SOLDIER 
   drop foreign key FK_SOLDIER_HAS_RANK_MILITARY;

alter table SOLDIER 
   drop foreign key FK_SOLDIER_SERVES_IN_UNIT;

drop table if exists SOLDIER;

drop table if exists SPECIALITY;


alter table UNIT 
   drop foreign key FK_UNIT_COMMANDS__SOLDIER;

alter table UNIT 
   drop foreign key FK_UNIT_HOME_BASE_BASE;

alter table UNIT 
   drop foreign key FK_UNIT_CURRENTLY_BASE;

alter table UNIT 
   drop foreign key FK_UNIT_IS_PART_UNIT;

drop table if exists UNIT;

/*==============================================================*/
/* Table: BASE                                                  */
/*==============================================================*/
create table BASE
(
   BASE_ID              int not null  comment '',
   SOLDIER_ID           int  comment '',
   NAME                 varchar(100)  comment '',
   LOCATION             varchar(100)  comment '',
   BASE_TYPE            varchar(100)  comment '',
   primary key (BASE_ID)
);

/*==============================================================*/
/* Table: EQUIPMENT                                             */
/*==============================================================*/
create table EQUIPMENT
(
   EQUIPMENT_ID         int not null  comment '',
   BASE_ID              int not null  comment '',
   UNIT_ID              int  comment '',
   TYPE_ID              int not null  comment '',
   SERIAL_NO            varchar(100)  comment '',
   "CONDITION"          varchar(100)  comment '',
   primary key (EQUIPMENT_ID)
);

/*==============================================================*/
/* Table: EQUIPMENT_TYPE                                        */
/*==============================================================*/
create table EQUIPMENT_TYPE
(
   TYPE_ID              int not null  comment '',
   NAME                 varchar(100)  comment '',
   CATEGORIE            varchar(100)  comment '',
   UNIT_COAST           int  comment '',
   primary key (TYPE_ID)
);

/*==============================================================*/
/* Table: INJURY                                                */
/*==============================================================*/
create table INJURY
(
   INJURY_ID            int not null  comment '',
   MISSION_ID           int  comment '',
   SOLDIER_ID           int not null  comment '',
   INJURY_DATE          date  comment '',
   SEVERITY             varchar(30)  comment '',
   DESCRIPTION          text  comment '',
   primary key (INJURY_ID)
);

/*==============================================================*/
/* Table: IS_CERTIFIED_IN                                       */
/*==============================================================*/
create table IS_CERTIFIED_IN
(
   SPECIALITY_ID        int not null  comment '',
   SOLDIER_ID           int not null  comment '',
   primary key (SPECIALITY_ID, SOLDIER_ID)
);

/*==============================================================*/
/* Table: MILITARY_RANK                                         */
/*==============================================================*/
create table MILITARY_RANK
(
   RANK_ID              int not null  comment '',
   NAME                 varchar(100)  comment '',
   AGE                  int  comment '',
   primary key (RANK_ID)
);

/*==============================================================*/
/* Table: MISSION                                               */
/*==============================================================*/
create table MISSION
(
   MISSION_ID           int not null  comment '',
   NAME                 varchar(100)  comment '',
   OBJECTIOVE           text  comment '',
   START_DATE           date  comment '',
   END_DATE             date  comment '',
   STATUS               bool  comment '',
   primary key (MISSION_ID)
);

/*==============================================================*/
/* Table: PARTICIPATES_IN                                       */
/*==============================================================*/
create table PARTICIPATES_IN
(
   MISSION_ID           int not null  comment '',
   UNIT_ID              int not null  comment '',
   primary key (MISSION_ID, UNIT_ID)
);

/*==============================================================*/
/* Table: SOLDIER                                               */
/*==============================================================*/
create table SOLDIER
(
   SOLDIER_ID           int not null  comment '',
   RANK_ID              int not null  comment '',
   UNIT_ID              int  comment '',
   NAME                 varchar(100)  comment '',
   BIRTH_DATE           date  comment '',
   ENLIST_DATE          date  comment '',
   STATUS               bool  comment '',
   primary key (SOLDIER_ID)
);

/*==============================================================*/
/* Table: SPECIALITY                                            */
/*==============================================================*/
create table SPECIALITY
(
   SPECIALITY_ID        int not null  comment '',
   NAME                 varchar(100)  comment '',
   DESCRIPTION          text  comment '',
   primary key (SPECIALITY_ID)
);

/*==============================================================*/
/* Table: UNIT                                                  */
/*==============================================================*/
create table UNIT
(
   UNIT_ID              int not null  comment '',
   SOLDIER_ID           int  comment '',
   UNI_UNIT_ID          int  comment '',
   BASE_ID              int not null  comment '',
   BAS_BASE_ID          int  comment '',
   NAME                 varchar(100)  comment '',
   UNIT_TYPE            varchar(100)  comment '',
   UNIT_PARENT_ID       int  comment '',
   primary key (UNIT_ID)
);

alter table BASE add constraint FK_BASE_COMMANDS__SOLDIER foreign key (SOLDIER_ID)
      references SOLDIER (SOLDIER_ID) on delete restrict on update restrict;

alter table EQUIPMENT add constraint FK_EQUIPMEN_ASSIGNED__UNIT foreign key (UNIT_ID)
      references UNIT (UNIT_ID) on delete restrict on update restrict;

alter table EQUIPMENT add constraint FK_EQUIPMEN_IS_OF_TYP_EQUIPMEN foreign key (TYPE_ID)
      references EQUIPMENT_TYPE (TYPE_ID) on delete restrict on update restrict;

alter table EQUIPMENT add constraint FK_EQUIPMEN_STORED_AT_BASE foreign key (BASE_ID)
      references BASE (BASE_ID) on delete restrict on update restrict;

alter table INJURY add constraint FK_INJURY_OCCURS_DU_MISSION foreign key (MISSION_ID)
      references MISSION (MISSION_ID) on delete restrict on update restrict;

alter table INJURY add constraint FK_INJURY_SUFFERS_SOLDIER foreign key (SOLDIER_ID)
      references SOLDIER (SOLDIER_ID) on delete restrict on update restrict;

alter table IS_CERTIFIED_IN add constraint FK_IS_CERTI_IS_CERTIF_SPECIALI foreign key (SPECIALITY_ID)
      references SPECIALITY (SPECIALITY_ID) on delete restrict on update restrict;

alter table IS_CERTIFIED_IN add constraint FK_IS_CERTI_IS_CERTIF_SOLDIER foreign key (SOLDIER_ID)
      references SOLDIER (SOLDIER_ID) on delete restrict on update restrict;

alter table PARTICIPATES_IN add constraint FK_PARTICIP_PARTICIPA_MISSION foreign key (MISSION_ID)
      references MISSION (MISSION_ID) on delete restrict on update restrict;

alter table PARTICIPATES_IN add constraint FK_PARTICIP_PARTICIPA_UNIT foreign key (UNIT_ID)
      references UNIT (UNIT_ID) on delete restrict on update restrict;

alter table SOLDIER add constraint FK_SOLDIER_HAS_RANK_MILITARY foreign key (RANK_ID)
      references MILITARY_RANK (RANK_ID) on delete restrict on update restrict;

alter table SOLDIER add constraint FK_SOLDIER_SERVES_IN_UNIT foreign key (UNIT_ID)
      references UNIT (UNIT_ID) on delete restrict on update restrict;

alter table UNIT add constraint FK_UNIT_COMMANDS__SOLDIER foreign key (SOLDIER_ID)
      references SOLDIER (SOLDIER_ID) on delete restrict on update restrict;

alter table UNIT add constraint FK_UNIT_CURRENTLY_BASE foreign key (BAS_BASE_ID)
      references BASE (BASE_ID) on delete restrict on update restrict;

alter table UNIT add constraint FK_UNIT_HOME_BASE_BASE foreign key (BASE_ID)
      references BASE (BASE_ID) on delete restrict on update restrict;

alter table UNIT add constraint FK_UNIT_IS_PART_UNIT foreign key (UNI_UNIT_ID)
      references UNIT (UNIT_ID) on delete restrict on update restrict;

