create sequence desa_schema.snr_log_id_sq minvalue 1 maxvalue 9999999999999999999999999999 increment by 1 /* start with n */ cache 20
noorder nocycle nokeep noscale global;


-- sqlcl_snapshot {"hash":"0f1e6b2d865c9d8ca691a32e8b47568c68b422f8","type":"SEQUENCE","name":"SNR_LOG_ID_SQ","schemaName":"DESA_SCHEMA","sxml":"\n  <SEQUENCE xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>DESA_SCHEMA</SCHEMA>\n   <NAME>SNR_LOG_ID_SQ</NAME>\n   \n   <INCREMENT>1</INCREMENT>\n   <MINVALUE>1</MINVALUE>\n   <MAXVALUE>9999999999999999999999999999</MAXVALUE>\n   <CACHE>20</CACHE>\n   <SCALE>NOSCALE</SCALE>\n</SEQUENCE>"}