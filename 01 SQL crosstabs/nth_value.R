nth_value <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select PROVIDER_STATE,AVERAGE_TOTAL_PAYMENTS,PROVIDER_CITY,nth_value(AVERAGE_TOTAL_PAYMENTS, 2)
OVER (PARTITION BY PROVIDER_STATE) as nth_AVG_Total_Payments 
from MEDCHARGE order by 1,2 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_jz7674',PASS='orcl_jz7674',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON'),verbose = TRUE)))
tbl_df(nth_value)
