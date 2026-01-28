create or replace package snr_test_pkg as 
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


-- sqlcl_snapshot {"hash":"090111397ff8e7c4ba8b0251487bc4df7c83c70f","type":"PACKAGE_SPEC","name":"SNR_TEST_PKG","schemaName":"DESA_SCHEMA","sxml":""}