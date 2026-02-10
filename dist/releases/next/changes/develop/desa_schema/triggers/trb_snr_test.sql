-- liquibase formatted sql
-- changeset DESA_SCHEMA:1770152205075 stripComments:false  logicalFilePath:develop\desa_schema\triggers\trb_snr_test.sql
-- sqlcl_snapshot src/database/desa_schema/triggers/trb_snr_test.sql:null:58386096a887b6263208b176e1be20403f29391c:create

create or replace editionable trigger trb_snr_test before
    delete or insert or update on snr_users
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

alter trigger trb_snr_test enable;

