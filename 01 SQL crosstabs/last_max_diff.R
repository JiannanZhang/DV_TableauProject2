difference <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select APC, Provider_State, Outpatient_Services, last_value(Max_Services) 
OVER (PARTITION BY APC order by Outpatient_Services) Max_Services, last_value(Max_Services) 
OVER (PARTITION BY APC order by Outpatient_Services) - Outpatient_Services Service_Difference
from
(SELECT APC, Provider_State, Outpatient_Services, max(Outpatient_Services)
OVER (PARTITION BY APC) Max_Services 
FROM MEDCHARGE)
order by 1,2"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_jz7674',PASS='orcl_jz7674',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON'),verbose = TRUE)))

