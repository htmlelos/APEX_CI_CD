-- liquibase formatted sql
-- changeset DESA_SCHEMA:1768865290006 stripComments:false  logicalFilePath:feat00003\desa_schema\package_specs\snr_test_pkg.sql
-- sqlcl_snapshot src/database/desa_schema/package_specs/snr_test_pkg.sql:null:d974372cd4f0ed43c6581de2d3b5efc4607eb976:create

create or replace package desa_schema.snr_test_pkg as 
  /* TODO enter package declarations (types, exceptions, methods etc) here */

    function get_users return snr_users%rowtype;

    function get_user_by_id (
        p_id snr_users.id%type
    ) return snr_users%rowtype;

    procedure create_user (
        p_user snr_users%rowtype
    );

    procedure update_user (
        p_id   snr_users.id%type,
        p_user snr_users%rowtype
    );

end snr_test_pkg;
/

