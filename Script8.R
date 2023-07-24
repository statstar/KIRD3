library(readxl)
community <-  read_excel("C:/Users/stats/Downloads/전국마을회관.xls")
head(community)
community$제공기관명 %>% table

library(dplyr)
community %>% 
  filter(substr(제공기관명,1,5)=="부산광역시") -> busan

library(maps)
map('world','south korea')
points(busan$경도, busan$위도)

busan$영업상태명 %>% table
busan$시설유형 %>% table

dim(community)
