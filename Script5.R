library(ggplot2)
head(mpg)

# 회사별로 suv 차량의 통합연비를 구한 후 
# 연비가 높은 순서대로 상위 5개 회사를 구하면 어떻게 되나요?

# 회사 : manufacturer
# 차량종류 : class
# cty : 시내연비, hwy : 고속연비
# 통합연비 = (시내연비 + 고속연비)/2

mpg %>% 
  filter(class=="suv") %>% 
  mutate(total = (cty+hwy)/2) %>% 
  group_by(manufacturer) %>% 
  summarise(n=n(), mean=mean(total)) %>% 
  arrange(-mean) %>% head(5)

# 1번
mpg %>% group_by(class) %>% 
  summarise(n=n(), mean=mean(cty))

# 2번
mpg %>% group_by(class) %>% 
  summarise(n=n(), mean=mean(cty)) %>% arrange(-mean)

# 3번
mpg %>% group_by(manufacturer) %>% 
  summarise(n=n(), mean=mean(hwy)) %>% arrange(-mean) %>% head(5)

# 4번
mpg %>% 
  filter(class=="compact") %>% group_by(manufacturer) %>% 
  summarise(n=n()) %>% arrange(-n)

diet %>% summary
# 결측치 
## 결측치가 적으면 결측치를 제거 후 분석
 ifelse(평균값 대체)
 
## 결측치를 imputation 
  MICE 함수 (blog, 인터넷)
 
## 이상치 (평균)
boxplot(c(1,2,3,4,5,6,7,8,9,50)) -> box1
box1$out 

boxplot(mpg$cty ) -> box1  # 
IQR : Q3 - Q1 (50% 범위) * 1.5 # 울타리 범위위

boxplot(mpg$cty) -> box1
mpg %>% 
  filter(cty %in% box1$out)

library(tidyr)
mpg %>% group_by(manufacturer, class) %>% 
  summarise(mean=mean(hwy)) %>% 
  pivot_wider(id_cols=manufacturer, names_from=class,
              values_from=mean)

pivot_wider # 사용법 공부

Tidy : filter, select, mutate, arrange, group_by, summarise