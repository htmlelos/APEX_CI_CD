create or replace package body desa_schema.snr_test_pkg as

    function get_users return snr_users%rowtype as
        cursor cr_data is
        select
            *
        from
            snr_users;
    --
        v_users cr_data%rowtype;
    begin
        open cr_data;
        fetch cr_data into v_users;
        close cr_data;
    --
        return v_users;
    end get_users;

    function get_user_by_id (
        p_id snr_users.id%type
    ) return snr_users%rowtype as
        cursor cr_data is
        select
            *
        from
            snr_users
        where
            id = p_id;
    --
        v_user cr_data%rowtype;
    begin
        open cr_data;
        fetch cr_data into v_user;
        close cr_data;
    --
        return v_user;
    end get_user_by_id;

    procedure create_user (
        p_user snr_users%rowtype
    ) as
    begin
    -- TAREA: Se necesita implantación para procedure SNR_TEST_PKG.create_user
        null;
    end create_user;

    procedure update_user (
        p_id   snr_users.id%type,
        p_user snr_users%rowtype
    ) as
    begin
    -- TAREA: Se necesita implantación para procedure SNR_TEST_PKG.update_user
        null;
    end update_user;

end snr_test_pkg;
/


-- sqlcl_snapshot {"hash":"101c38c605019f11e1c314fb9d36f75efe845add","type":"PACKAGE_BODY","name":"SNR_TEST_PKG","schemaName":"DESA_SCHEMA","sxml":""}