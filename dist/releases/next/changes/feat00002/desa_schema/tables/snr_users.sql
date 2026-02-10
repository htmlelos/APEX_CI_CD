-- liquibase formatted sql
-- changeset DESA_SCHEMA:1768863659011 stripComments:false  logicalFilePath:feat00002\desa_schema\tables\snr_users.sql
-- sqlcl_snapshot src/database/desa_schema/tables/snr_users.sql:null:96ac4cd571a11fe2a18fcaced23154b0ec8ee9b4:create

create table snr_users (
    id       varchar2(20 byte) not null enable,
    username varchar2(100 byte) not null enable,
    email    varchar2(200 byte) not null enable,
    password varchar2(100 byte)
);

create unique index snr_user_pk on
    snr_users (
        id
    );

alter table snr_users
    add constraint snr_user_pk
        primary key ( id )
            using index snr_user_pk enable;

