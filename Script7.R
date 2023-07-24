
R 기본 문법
  1. <-, =, -> 객체를 저장하고 불러올 수 있다.
  2. () 함수다. 
  3. 패키지를 설치해서 library()로 불러오면 함수를 이용할 수 있다.
  4. [], index, 자료의 일부를 선택
  
Import -> Tidy -> Model -> communicate

Import : 자료를 불러오기
  직접입력 
  엑셀에 입력 후 복사(Ctrl+C) 후, data<- read.table("clipboard", header=T)
  environment > Import Dataset : 쉽게 불러오자. 
  read.csv("file 주소")
  read_excel("file 주소")

  head, tail, dim, str, summary, View # V는 대문자
  
Tidy : 자료를 요약하거나 정리
  filter : 논리식을 통해 원하는 행 선택
  select : 원하는 변수를 선택
    
community %>% 
    select(시설명, 시설유형, 위도, 경도, 건립일자,제공기관명) -> community1
  
  mutate : 새로운 변수를 만들기

community1 %>% 
  mutate(birth=substr(건립일자,1,4) %>% as.numeric) %>% 
  mutate(age = 2023 - birth) -> community2
  
community2$age %>% hist

  arrange : 자료를 정렬
  
community2 %>% arrange(-age) %>% head(10)
community2 %>%
  group_by(제공기관명) %>% 
  slice_max(age, n=1) 

community2 %>%
  group_by(제공기관명) %>% 
  summarise(mean=mean(age)) %>% arrange(mean) %>% head(15)

filter, select, mutate, arrange, group_by, summarise

일표본 t검정 : t.test
독립 t검정 : t.test
대응 t검정 : t.test
일원배치분산분석 : aov, oneway.test
카이제곱검정(교차검정) : chisq.test
상관분석 : cor.test
회귀분석 : lm
비모수분석 : wilcox.test, kruskal.test

정규성검정 : shapiro.test

