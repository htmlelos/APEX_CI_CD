create or replace package body snr_test_pkg as

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
        insert into snr_users (
            username,
            email,
            password
        ) values ( p_user.username,
                   p_user.email,
                   p_user.password );

    end create_user;

    procedure update_user (
        p_id   snr_users.id%type,
        p_user snr_users%rowtype
    ) as
    begin
        update snr_users
        set
            username = p_user.username,
            email = p_user.email,
            password = p_user.password
        where
            id = p_id;

    end update_user;

end snr_test_pkg;
/


-- sqlcl_snapshot {"hash":"e9142953d4aad8c1248c3161dd916bb32b39b774","type":"PACKAGE_BODY","name":"SNR_TEST_PKG","schemaName":"DESA_SCHEMA","sxml":""}
