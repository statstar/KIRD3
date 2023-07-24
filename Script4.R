diet <- read.csv("C:/Users/stats/Downloads/KIRD3-main/KIRD3-main/diet.csv")

head(diet)
dim(diet)

# filter
## 논리식을 이용해서 내가 원하는 자료만 선택
== : 같다.
!= : 같지 않다.
< : 크다.
> : 작다.
& : and
| : or
%in% : 여러개의 조건 중 하나라도 만족하면

library(dplyr)
diet %>% 
  filter(Height>=190)

diet %>% #Ctrl + Shift + M
  filter(Age==20)

diet # 40대만 선택하여 분석한다면?
diet %>% 
  filter(40<= Age <50) # 대소문자 구분, 복합조건 X

diet %>% 
  filter(40<= Age, Age <50) # 대소문자 구분, 복합조건 X

diet %>% 
  filter(Height >=190 , pre.weight >=80) # 두 조건 모두 만족
diet %>% 
  filter(Height >=190 & pre.weight >=80) # 두 조건 모두 만족
diet %>% 
  filter(Height >=190 | pre.weight >=80)  # 두 가지 중 하나라도
diet %>% 
  filter(Age==20|Age==30|Age==40|Age==50)
diet %>% 
  filter(Age %in% c(20,30,40,50))

# 1. 남자이면서 (gender==1)이면서 다이어트 프로그램 (Diet)를 1번
#    참여한 사람의 평균키는?
diet %>% filter(gender==1, Diet==1) -> out1
out1$Height %>% mean

# 2. 30대의 남자와 여자의 비율은 어떻게 되나요?
diet %>% 
  filter(30<=Age, Age<40) -> out2
out2$gender %>% table

# select
diet %>% head
diet %>% 
  dplyr::select(Age:Diet) %>% head
diet %>% 
  dplyr::select(3:6) %>% head

BMI가 
18.5 이하 : “저체중”, 
18.5~23 : “정상”, 
23~25 : “과체중”, 
25~ : “비만” 이다.


# mutate
diet %>% 
  mutate(BMI.pre = pre.weight/(Height/100)^2) %>% 
  mutate(BMI.c = cut(BMI.pre, c(0,18.5,23,25,35),
                     c("저체중","정상","과체중","비만"))) -> diet1
head(diet1)
# weight6weeks 참여 후 BMI 계산, 및 BMI 정상여부 확인하는 자료 diet2
diet1 %>% 
  mutate(BMI.after = weight6weeks/(Height/100)^2) %>% 
  mutate(BMI.c2 = cut(BMI.after, c(0,18.5,23,25,35),
                     c("저체중","정상","과체중","비만"))) -> diet2
head(diet2)
table(diet2$BMI.c, diet2$BMI.c2)

# 연속형 자료를 범주형 자료로 변환시 유용한 함수
mtcars$mpg >=20
ifelse(mtcars$mpg >=20, "합격","불합격")

cut(diet$Age, c(0,29,39,49,100),
    c("20대이하","30대","40대","50대이상")) %>% table
diet %>% 
  mutate(Age.c = cut(Age, c(0,29,39,49,100),
                     c("20대이하","30대","40대","50대이상")))

set.seed(1234)
x <- runif(200) # r : random number, uniform 균등분포
x > 0.5
ifelse(x > 0.5,"head", "tail") %>% table

y <- c(30,40,NA,50,50,40,30,60)
mean(y)
mean(y, na.rm=T) -> mean_y

fill.y <- ifelse(is.na(y), mean_y , y)
data.frame(y, fill.y) #imputation 

# arrange
diet %>% arrange(Height) %>% head(5)#오름차순 %>% h
diet %>% arrange(-Height) %>% head(2)#내림차순
diet %>% arrange(desc(Height)) #내림차순

filter, select, mutate, arrange

Import -> Tidy (filter, select, mutate, arrange)
10:00~12:00 

13:00~15:00

15:30~17:30
# group_by
# summarise

diet %>% #요약값 생성, 내가 원하는 이름으로 요약값을 출력하겠다.
  summarise(mean_h = mean(Height), max_h=max(Height), min_h=min(Height))

# n = n() 표본수
# mean=mean() 평균
# sd = sd() 표준편차

diet %>% 
   summarise_at(.var=c("Height", "pre.weight"), .funs=c(mean, sd))
library(dplyr)

diet %>% 
  group_by(gender) %>% 
  summarise(n=n(), mean=mean(Height), sd=sd(Height))
# group_by
# summarise

diet %>% #요약값 생성, 내가 원하는 이름으로 요약값을 출력하겠다.
  summarise(mean_h = mean(Height), max_h=max(Height), min_h=min(Height))

diet %>% #요약값 생성, 내가 원하는 이름으로 요약값을 출력하겠다.
  summarize(mean_h = mean(Height), max_h=max(Height), min_h=min(Height))

# n = n() 표본수
# mean=mean() 평균
# sd = sd() 표준편차

diet %>% 
   summarise_at(.var=c("Height", "pre.weight"), .funs=c(mean, sd))

library(dplyr)

diet %>% 
  group_by(gender) %>% 
  summarise(n=n(), mean=mean(Height), sd=sd(Height))

diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  arrange(-diff)

# Diet 프로그램 별로 가장 살이 많이 사람 3명씩 선택한다면?
diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  group_by(Diet) %>% 
  arrange(-diff) %>% head(3)

diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  group_by(Diet,gender) %>% 
  slice_max(diff, n=3)
diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  arrange(-diff)

# Diet 프로그램 별로 가장 살이 많이 사람 3명씩 선택한다면?
diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  group_by(Diet) %>% 
  arrange(-diff) %>% head(3)

diet %>% 
  mutate(diff = pre.weight -weight6weeks) %>% 
  group_by(Diet,gender) %>% 
  slice_max(diff, n=3)