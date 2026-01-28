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


-- sqlcl_snapshot {"hash":"6e29ae2af10df91c836ee37b0523b403d4b27bb8","type":"TRIGGER","name":"TRB_SNR_TEST","schemaName":"DESA_SCHEMA","sxml":""}