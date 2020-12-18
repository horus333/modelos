
create table CALIFICACION (
   ID_CALIFICACION      INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   NUM_CALIFICACION     INT4                 null,
   DESCRIPCION_CALIFICACION VARCHAR(90)          null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);


create table CLIENTE (
   CEDULA_CLIENTE       INT4                 not null,
   NOMBRE               VARCHAR(40)          null,
   TELEFONOS            INT4                 null,
   NACIONALIDAD         VARCHAR(40)          null,
   CORREO               VARCHAR(40)          null,
   FECHA_NACIMIENTO     CHAR(10)             null,
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);



create table ESTANCIA (
   ID_ESTANCIA          INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_HABITACION        INT4                 not null,
   FECH_LLEGADA         DATE                 null,
   FECH_SALIDA          DATE                 null,
   constraint PK_ESTANCIA primary key (ID_ESTANCIA)
);


create table HABITACION (
   ID_HABITACION        INT4                 not null,
   ID_TIPO              INT4                 not null,
   PISO                 INT4                 null,
   NUM_HABITACION       INT4                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);


create table REFERENCIA (
   ID_REFERENCIA        INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   DESCRIPCION_REFERENCIA VARCHAR(70)          null,
   FECHA_REFERENCIA     DATE                 null,
   constraint PK_REFERENCIA primary key (ID_REFERENCIA)
);


create table SERVICIOS (
   ID_SERVICIO          INT4                 not null,
   ID_HABITACION        INT4                 not null,
   NOMBRE_SERVICIO      VARCHAR(50)          null,
   DESCRIPCION_SERVICIO VARCHAR(60)          null,
   PRECIO_SERVICIO      INT4                 null,
   constraint PK_SERVICIOS primary key (ID_SERVICIO)
);


create table T_HABITACION (
   ID_TIPO              INT4                 not null,
   DESCRIPCION          VARCHAR(50)          null,
   PRECIO               INT4                 null,
   constraint PK_T_HABITACION primary key (ID_TIPO)
);
