/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     15/12/2020 17:46:19                          */
/*==============================================================*/


drop index CALIFICACION_SERVICIOS_FK;

drop index CLIENTE_CALIFICACION_FK;

drop index CALIFICACION_PK;

drop table CALIFICACION;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index HABITACION_ESTANCIA_FK;

drop index CLIENTE_ESTANCIA_FK;

drop index ESTANCIA_PK;

drop table ESTANCIA;

drop index TIPO_HABITACION_FK;

drop index HABITACION_PK;

drop table HABITACION;

drop index CLIENTE_REFERENCIA_FK;

drop index REFERENCIA_PK;

drop table REFERENCIA;

drop index HABITACION_SERVICIOS_FK;

drop index SERVICIOS_PK;

drop table SERVICIOS;

drop index T_HABITACION_PK;

drop table T_HABITACION;

/*==============================================================*/
/* Table: CALIFICACION                                          */
/*==============================================================*/
create table CALIFICACION (
   ID_CALIFICACION      INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   NUM_CALIFICACION     INT4                 null,
   DESCRIPCION_CALIFICACION VARCHAR(90)          null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);

/*==============================================================*/
/* Index: CALIFICACION_PK                                       */
/*==============================================================*/
create unique index CALIFICACION_PK on CALIFICACION (
ID_CALIFICACION
);

/*==============================================================*/
/* Index: CLIENTE_CALIFICACION_FK                               */
/*==============================================================*/
create  index CLIENTE_CALIFICACION_FK on CALIFICACION (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Index: CALIFICACION_SERVICIOS_FK                             */
/*==============================================================*/
create  index CALIFICACION_SERVICIOS_FK on CALIFICACION (
ID_SERVICIO
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CEDULA_CLIENTE       INT4                 not null,
   NOMBRE               VARCHAR(40)          null,
   TELEFONOS            INT4                 null,
   NACIONALIDAD         VARCHAR(40)          null,
   CORREO               VARCHAR(40)          null,
   FECHA_NACIMIENTO     CHAR(10)             null,
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Table: ESTANCIA                                              */
/*==============================================================*/
create table ESTANCIA (
   ID_ESTANCIA          INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_HABITACION        INT4                 not null,
   FECH_LLEGADA         DATE                 null,
   FECH_SALIDA          DATE                 null,
   constraint PK_ESTANCIA primary key (ID_ESTANCIA)
);

/*==============================================================*/
/* Index: ESTANCIA_PK                                           */
/*==============================================================*/
create unique index ESTANCIA_PK on ESTANCIA (
ID_ESTANCIA
);

/*==============================================================*/
/* Index: CLIENTE_ESTANCIA_FK                                   */
/*==============================================================*/
create  index CLIENTE_ESTANCIA_FK on ESTANCIA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Index: HABITACION_ESTANCIA_FK                                */
/*==============================================================*/
create  index HABITACION_ESTANCIA_FK on ESTANCIA (
ID_HABITACION
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        INT4                 not null,
   ID_TIPO              INT4                 not null,
   PISO                 INT4                 null,
   NUM_HABITACION       INT4                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Index: HABITACION_PK                                         */
/*==============================================================*/
create unique index HABITACION_PK on HABITACION (
ID_HABITACION
);

/*==============================================================*/
/* Index: TIPO_HABITACION_FK                                    */
/*==============================================================*/
create  index TIPO_HABITACION_FK on HABITACION (
ID_TIPO
);

/*==============================================================*/
/* Table: REFERENCIA                                            */
/*==============================================================*/
create table REFERENCIA (
   ID_REFERENCIA        INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   DESCRIPCION_REFERENCIA VARCHAR(70)          null,
   FECHA_REFERENCIA     DATE                 null,
   constraint PK_REFERENCIA primary key (ID_REFERENCIA)
);

/*==============================================================*/
/* Index: REFERENCIA_PK                                         */
/*==============================================================*/
create unique index REFERENCIA_PK on REFERENCIA (
ID_REFERENCIA
);

/*==============================================================*/
/* Index: CLIENTE_REFERENCIA_FK                                 */
/*==============================================================*/
create  index CLIENTE_REFERENCIA_FK on REFERENCIA (
CEDULA_CLIENTE
);

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
create table SERVICIOS (
   ID_SERVICIO          INT4                 not null,
   ID_HABITACION        INT4                 not null,
   NOMBRE_SERVICIO      VARCHAR(50)          null,
   DESCRIPCION_SERVICIO VARCHAR(60)          null,
   PRECIO_SERVICIO      INT4                 null,
   constraint PK_SERVICIOS primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Index: SERVICIOS_PK                                          */
/*==============================================================*/
create unique index SERVICIOS_PK on SERVICIOS (
ID_SERVICIO
);

/*==============================================================*/
/* Index: HABITACION_SERVICIOS_FK                               */
/*==============================================================*/
create  index HABITACION_SERVICIOS_FK on SERVICIOS (
ID_HABITACION
);

/*==============================================================*/
/* Table: T_HABITACION                                          */
/*==============================================================*/
create table T_HABITACION (
   ID_TIPO              INT4                 not null,
   DESCRIPCION          VARCHAR(50)          null,
   PRECIO               INT4                 null,
   constraint PK_T_HABITACION primary key (ID_TIPO)
);

/*==============================================================*/
/* Index: T_HABITACION_PK                                       */
/*==============================================================*/
create unique index T_HABITACION_PK on T_HABITACION (
ID_TIPO
);

alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIOS (ID_SERVICIO)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CLIENTE_C_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_CLIENTE_E_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_TIPO_HABI_T_HABITA foreign key (ID_TIPO)
      references T_HABITACION (ID_TIPO)
      on delete restrict on update restrict;

alter table REFERENCIA
   add constraint FK_REFERENC_CLIENTE_R_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIOS
   add constraint FK_SERVICIO_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

