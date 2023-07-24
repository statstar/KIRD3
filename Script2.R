1/0 # Inf 무한대
-1/0 # -Inf 무한대

0/0
log(-1)
sqrt(-4)

# Inf 무한대
# NA 결측치
# NaN 계산불가

math <- c(70,80,90,80,60)
eng <- c(80,85,90,85,95)

eng / 3 # 실수가 출력
eng %/% 3 # 몫
eng %% 3 # 나머지 (계통추출)

sqrt(math) #제곱근 0.5승
math^0.5

x <- rexp(50, 2)
hist(x)
hist(sqrt(x))
hist(log(x))

mean(math) # 평균
median(math) # 중앙값

var(math) #분산
sd(math) #표준편차
IQR(math) #사분위범위
range(math) # 범위

quantile(math) # 분위수
quantile(math, p=seq(0,1,0.1))
