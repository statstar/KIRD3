# 데이터 유형 (Model)

## 범주형(문자형) 자료
## 연속형(수치형) 자료

head(mtcars)

# 범주형 (cyl, gear, vs, am, carb)
mtcars$cyl %>% table # 빈도
mtcars$cyl %>% table %>% barplot

vote <- data.frame(party=c("A","B","C"), vote=c(80,120,30))
round(vote$vote/sum(vote$vote)*100,1)

# 응답결과를 봤더니 B정당 선호가 55%다. 
모비율 가설검정
binom.test(x=1200, n=2300, p=0.53) 
# x : 응답수, n : 전체 응답수, p : 확인하고자 하는 모비율
# p>0.05, 귀무가설 채택

# 연속형 (mpg, wt, hp, disp)
summary(mtcars$mpg)
summary(mtcars$wt)
summary(mtcars$hp)

mtcars$mpg %>% hist # 히스토그램 
mtcars$mpg %>% density %>% plot
mtcars$mpg %>% boxplot # 상자그림 (이상치)

## 평균값
mtcars$mpg %>% mean
# 조사하기 전 10년전 평균 19.01 

# 표본평균 : 조사한 자료의 평균
# 모평균  : 가설검정 하고자 하는 평균

t.test(mtcars$mpg, mu=15.01) # 일표본 t검정

# 귀무가설 : 현재 평균을 19.01이라 말할 수 있다.
# 연구가설 : not 귀무가설

## 검정통계량, 유의확률
검정통계량 = (표본평균 - 모평균)/표준오차

검정통계량 -> 0 , 귀무가설 채택
|검정통계량| > 0 , 귀무가설 기각

p-value : 귀무가설의 지지도 (유의수준 = 0.05)
p-value >0.05 귀무가설 채택
p-value < 0.05 귀무가설 기각

표본의 수가 작고 (n<30), 정규성을 만족하지 않는다면
비모수 검정

wilcox.test(mtcars$mpg, mu=15.01) # 일표본 t검정

# 정규성 검정
shapiro.test(mtcars$mpg)
# 귀무가설 : 정규분포를 따른다.
# 대립가설 : 정규분포를 따르지 않는다.
## p-value : 유의확률 >0.05, 정규성 만족

##########################################################
일변량 분석

범주형 : table, barplot, binom.test
연속형 : summary, hist, boxplot, t.test(, mu=모평균)

shapiro.test() # 정규성 확인 함수

##########################################################
이변량 분석

범주형 * 범주형 : 카이제곱 검정

cyl, gear
table(mtcars$cyl, mtcars$gear) # 교차표
table(mtcars$cyl, mtcars$gear) %>% 
  barplot(beside=T, legend=rownames(.))
table(mtcars$cyl, mtcars$gear) %>% chisq.test
table(mtcars$cyl, mtcars$gear) %>% fisher.test

##########################################################
범주형 * 연속형 : 독립 t검정, 일원분산분석

# 독립 t검정 : 집단이 2개
# 일원배치분산분석 : 집단이 2개 이상

boxplot(mpg ~ vs, data = mtcars)
mtcars %>% 
  group_by(vs) %>% 
  summarise(n=n(), mean=mean(mpg), sd=sd(mpg))

var.test(mpg ~ vs, data = mtcars) #분산이 동질한지 가설검정
# p-value >0.05 등분산, p-value< 0.05 이분산

t.test(mpg ~ vs, data = mtcars, var.equal=T)

# 집단이 여러개
boxplot(mpg ~ cyl, data = mtcars)
mtcars %>% 
  group_by(cyl) %>% 
  summarise(n=n(), mean=mean(mpg), sd=sd(mpg))

bartlett.test(mpg ~ cyl, data = mtcars) #분산이 동질한지 가설검정
# p-value >0.05 등분산, p-value< 0.05 이분산

## 등분산 만족
out1 <- aov(mpg ~ factor(cyl), data = mtcars)
out1 %>% summary

TukeyHSD(out1)

## 등분산 만족하지 않는다면
oneway.test(mpg ~ cyl, data = mtcars)

#####################################################################
## 연속형 * 연속형

plot(mpg~wt, mtcars) #scatter plot 
plot(mpg~hp, mtcars)
plot(hp~wt, mtcars)

cor.test(mtcars$mpg, mtcars$wt)
cor.test(mtcars$mpg, mtcars$hp)
cor.test(mtcars$wt, mtcars$hp)

plot(hp~wt, mtcars)
abline(lm(hp~wt, mtcars))
lm(hp~wt, mtcars)
hp = -1.821 + 46.160*wt # 회귀분석 
