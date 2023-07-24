Import 

# 자료 불러오는 것 
불러온 자료 확인

head()
dim()

# Tidy
library(dplyr)
filter : 논리식을 이용하여 내가 원하는 자료를 선택
mtcars %>% 
  filter(mpg>=25)

select : 분석에 필요한 변수 선택
mtcars %>% 
  select(cyl, gear, wt, mpg)

mutate : 많이 활용해야 할 함수
cut(mtcars$mpg, c(0,15,20,25,35), c("나쁨","보통","좋음","매우좋음"))

mtcars %>% 
  mutate(efficacy = cut(mpg, c(0,15,20,25,35), c("나쁨","보통","좋음","매우좋음")))

mtcars %>% 
  arrange(-mpg) %>% head(5)
  
group_by
summarise
mtcars %>% 
  group_by(gear) %>% 
  summarise(평균연비 = mean(mpg), 표준편차 = sd(mpg))


# 시각적
boxplot(mpg~gear, mtcars)

# 요약값
mtcars %>% 
  group_by(gear) %>% 
  summarise(평균연비 = mean(mpg), 표준편차 = sd(mpg))

# 집단간 평균차이 : 일원배치분산분석
oneway.test(mpg~gear, mtcars)

# 가설세우기
# 유의수준설정
# 검정통계량계산
# 기각역 계산
# 통계적 가설검정 

library(tidyr)
mtcars %>% 
  group_by(cyl, gear) %>% 
  summarise(mean=mean(mpg)) %>% 
  pivot_wider(id_cols=cyl, names_from=gear, values_from=mean)

2000 상위 100개 기업 -> a

2020 상위 100개 기업 -> b

inner_join(a, b) # 2000 & 2020
left_join(a, b) # 2000
anti_join(a, b) # 2000에는 있고 2020에는 사라진 기업
full_join(a, b) #




