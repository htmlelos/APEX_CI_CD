-- liquibase formatted sql
-- changeset DESA_SCHEMA:1770160880891 stripComments:false  logicalFilePath:feat0006\desa_schema\triggers\trb_snr_test.sql
-- sqlcl_snapshot src/database/desa_schema/triggers/trb_snr_test.sql:null:9d6ac8d09c655e849ae278ff3e221be969a41b71:create

create or replace editionable trigger desa_schema.trb_snr_test before
    delete or insert or update on desa_schema.snr_users
    for each row
begin
    if inserting then
        if :new.id is null then
            :new.id := snr_test_id_sq.nextval;
        end if;

    end if;
  --
end;
/

alter trigger desa_schema.trb_snr_test enable;

