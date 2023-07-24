R을 구성하는 기본 원리

# 1. <-, =, ->
객체(데이터, 그림, 분석결과)를 내가 원하는 이름으로 저장

# 2. 함수 ()
sample(1:100, 8) # 1부터 100까지 숫자중 8개를 임의로 선택

hist(mtcars$mpg)
stem(mtcars$mpg)
max(mtcars$mpg)
mean(mtcars$mpg)

# 3. 패키지
R에 내장되지 않은 함수를 사용할 경우

map('world')
library(maps)
map('world')

# 4. [], index
cars[cars$speed>=23,1]
cars[cars$dist>=70,c(1,2) ]
cars[ , ]
cars
