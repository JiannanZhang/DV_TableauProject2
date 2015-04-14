---
title: "Project 5: Cross Tabs"
author: "Jeffrey Zhang and Jaclyn Nguyen"
date: April 13, 2015
output: html_document
---



__1. Loading of R packages: RCurl, ggplot2, extrafont, jsonlite, dplyr, tidyr, extrafont, jsonlite, reshape2 (R code not shown)__


__2. Data__
Data that is provided for Project2 was selected from the Centers for Medicare and Medicaid Services (CMS). This center provides information about all health care services in America. In this project, Jeffrey and Jackie are focusing on Medicare Providers and the medical charges for outpatient services in 2012. 

The data set can be found at [Medicare Provider Utilization and Payment Data: Outpatient](http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/Outpatient.html)


```r
source("../03 Data/df.R",echo = T)
```

```
## 
## > df <- data.frame(fromJSON(getURL(URLencode("129.152.144.84:5001/rest/native/?query=\"select * from medcharge\""), 
## +     httpheader = c(DB = "jdbc:o ..." ... [TRUNCATED]
```
__3. Crosstabss created through SQL query in R__
From this rank crosstab, we can clearly see the rank of a specific medicial payment(on AVG) in each state. For example, a $738 medical payment is on the 10th rank in AK state. Therefore, this crosstab is very useful for us to visulize the rank for a specific medical payment in each state.


```r
source("../01 SQL crosstabs/rank.R", echo=T)
```

```
## 
## > rank <- data.frame(fromJSON(getURL(URLencode(gsub("\n", 
## +     " ", "129.152.144.84:5001/rest/native/?query=\n\"select PROVIDER_STATE,AVERAGE_TOTAL_ .... [TRUNCATED] 
## 
## > head(rank)
##   PROVIDER_STATE AVERAGE_TOTAL_PAYMENTS PROVIDER_CITY STATE_RANK
## 1             AK                   1000        JUNEAU          1
## 2             AK                    982      SOLDOTNA          2
## 3             AK                    918     FAIRBANKS          3
## 4             AK                    901     ANCHORAGE          4
## 5             AK                    894        PALMER          5
## 6             AK                    845        JUNEAU          6
```



```r
source("../01 SQL crosstabs/last_max_diff.R", echo=T)
```

```
## 
## > difference <- data.frame(fromJSON(getURL(URLencode(gsub("\n", 
## +     " ", "129.152.144.84:5001/rest/native/?query=\n\"select APC, Provider_State, Ou .... [TRUNCATED] 
## 
## > head(difference)
##                                            APC PROVIDER_STATE
## 1 0012 - Level I Debridement  and  Destruction             AK
## 2 0012 - Level I Debridement  and  Destruction             AR
## 3 0012 - Level I Debridement  and  Destruction             AR
## 4 0012 - Level I Debridement  and  Destruction             AR
## 5 0012 - Level I Debridement  and  Destruction             AR
## 6 0012 - Level I Debridement  and  Destruction             AR
##   OUTPATIENT_SERVICES MAX_SERVICES1 SERVICE_DIFFERENCE
## 1                1053         25502              24449
## 2                  23         25502              25479
## 3                3314         25502              22188
## 4                 352         25502              25150
## 5                  19         25502              25483
## 6                  64         25502              25438
```

From this nth_value crosstab, we can clearly see the nth value of the medical payment (on AVG) in each state as we want. For exmaple, if we want to see the fifth value of the medicial payment in each state, we can put 5 in the nth_value parameter.

```r
source("../01 SQL crosstabs/nth_value.R", echo=T)
```

```
## 
## > nth_value <- data.frame(fromJSON(getURL(URLencode(gsub("\n", 
## +     " ", "129.152.144.84:5001/rest/native/?query=\n\"select PROVIDER_STATE,AVERAGE_T .... [TRUNCATED] 
## 
## > head(nth_value)
##   PROVIDER_STATE AVERAGE_TOTAL_PAYMENTS PROVIDER_CITY
## 1             AK                   1000        JUNEAU
## 2             AK                    982      SOLDOTNA
## 3             AK                    918     FAIRBANKS
## 4             AK                    901     ANCHORAGE
## 5             AK                    894        PALMER
## 6             AK                    845        JUNEAU
##   NTH_AVG_TOTAL_PAYMENTS
## 1                    982
## 2                    982
## 3                    982
## 4                    982
## 5                    982
## 6                    982
```


```r
source("../01 SQL crosstabs/cumediff.R", echo=T)
```

```
## 
## > cumediff <- data.frame(fromJSON(getURL(URLencode(gsub("\n", 
## +     " ", "129.152.144.84:5001/rest/native/?query=\n\"select APC, Provider_State, Outp .... [TRUNCATED] 
## 
## > head(cumediff)
##                                            APC PROVIDER_STATE
## 1 0012 - Level I Debridement  and  Destruction             WV
## 2 0012 - Level I Debridement  and  Destruction             WV
## 3 0012 - Level I Debridement  and  Destruction             WI
## 4 0012 - Level I Debridement  and  Destruction             WI
## 5 0012 - Level I Debridement  and  Destruction             WI
## 6 0012 - Level I Debridement  and  Destruction             WI
##   OUTPATIENT_SERVICES CUME_DIST
## 1                 168 0.5451713
## 2                 757 0.7352025
## 3                 743 0.7320873
## 4                 655 0.7196262
## 5                  12 0.0623053
## 6                 593 0.7133957
```
__4. Crosstabs created through Tableau__
## rank
![](./rank1.jpg)
## diff
![](./diff1.jpg)
## nth_value
![](./nth_value_1st.jpg)
## cume_dist
![](./Cume_dist.jpg)



