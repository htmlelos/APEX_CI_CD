-- liquibase formatted sql
-- changeset DESA_SCHEMA:1770152204993 stripComments:false  logicalFilePath:develop\desa_schema\sequences\snr_test_id_sq.sql
-- sqlcl_snapshot src/database/desa_schema/sequences/snr_test_id_sq.sql:null:acd0bf43304dc2df2c2818b8c25ea656dc957722:create

create sequence snr_test_id_sq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache 5 noorder nocycle
nokeep noscale global;

