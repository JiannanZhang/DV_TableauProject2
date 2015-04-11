cumediff <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select APC, Provider_State, Outpatient_Services, cume_dist() 
OVER (PARTITION BY APC order by Outpatient_Services) cume_dist
from MEDCHARGE 
order by 1,2 desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_jz7674',PASS='orcl_jz7674',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON'),verbose = TRUE)))