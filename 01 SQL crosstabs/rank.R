rank <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select PROVIDER_STATE,AVERAGE_TOTAL_PAYMENTS,PROVIDER_CITY,rank() 
OVER (PARTITION BY PROVIDER_STATE order by AVERAGE_TOTAL_PAYMENTS desc) as STATE_RANK 
from MEDCHARGE"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_jz7674',PASS='orcl_jz7674',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON'),verbose = TRUE))); tbl_df(rank)