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


-- sqlcl_snapshot {"hash":"20c04a6dd2d0dcc469e76c19c9d339691293f077","type":"TRIGGER","name":"TRB_SNR_TEST","schemaName":"DESA_SCHEMA","sxml":""}