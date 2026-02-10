-- liquibase formatted sql
-- changeset DESA_SCHEMA:1770160880833 stripComments:false  logicalFilePath:feat0006\desa_schema\sequences\snr_test_id_sq.sql
-- sqlcl_snapshot src/database/desa_schema/sequences/snr_test_id_sq.sql:null:1009146eda1bf6c0f8368791f281c8f1086ff6d2:create

create sequence snr_test_id_sq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache 5
noorder nocycle nokeep noscale global;

