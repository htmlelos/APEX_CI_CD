create sequence snr_test_id_sq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache 5 noorder nocycle
nokeep noscale global;


-- sqlcl_snapshot {"hash":"acd0bf43304dc2df2c2818b8c25ea656dc957722","type":"SEQUENCE","name":"SNR_TEST_ID_SQ","schemaName":"DESA_SCHEMA","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>DESA_SCHEMA</SCHEMA>\n   <NAME>SNR_TEST_ID_SQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>1</MINVALUE>\n   <MAXVALUE>9999999999999999999999999999</MAXVALUE>\n   <CACHE>5</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}