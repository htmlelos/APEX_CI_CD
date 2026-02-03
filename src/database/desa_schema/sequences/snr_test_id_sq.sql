create sequence desa_schema.snr_test_id_sq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache 5
noorder nocycle nokeep noscale global;


-- sqlcl_snapshot {"hash":"1009146eda1bf6c0f8368791f281c8f1086ff6d2","type":"SEQUENCE","name":"SNR_TEST_ID_SQ","schemaName":"DESA_SCHEMA","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>DESA_SCHEMA</SCHEMA>\n   <NAME>SNR_TEST_ID_SQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>1</MINVALUE>\n   <MAXVALUE>9999999999999999999999999999</MAXVALUE>\n   <CACHE>5</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}