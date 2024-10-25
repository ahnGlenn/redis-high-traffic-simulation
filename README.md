# redis-high-traffic-simulation
Redis를 이용한 대용량 트래픽을 경험

<br/><br/>

# 1. 프로젝트 목표
 - 대용량 트래픽을 발생시켜 Redis를 통한 세션 관리의 성능을 테스트하고 병목지점을 파악
 - Redis의 기능을 활용하여 애플리케이션 성능을 향상
 - JMeter로 부하 트래픽을 발생 시킨 후 Redis의 기능을 통해 문제점 해결 
 
<br/><br/>

# 2. 아키텍처
![image](https://github.com/user-attachments/assets/ccd35302-97ff-42e6-9751-f727461a6ef5)


<br/>

# 3. 구현
1. SpringBoot, jsp를 사용하여 로그인 화면 구현
2. Redis서버 설치 및 클러스터링 작업
3. JMeter를 통한 로그인 과부하 발생

<br/>

# 4. 부하 테스트 시나리오 설정
1. 동시 접속자 수 증가 테스트: JMeter로 부하가 걸릴때까지 데이터를 점진적으로 늘리며, 에러를 과부하로인한 커넥션 에러 발생시키기.
 - 동시접속 5000개 발생<br/>
   <img src="https://github.com/user-attachments/assets/c9588a1f-6e91-45d3-a454-c2190bfcd676" alt="동시접속 5000개 발생 이미지" width="500">

 - 에러 발생<br/>
   <img src="https://github.com/user-attachments/assets/89a25447-d637-4950-ae3a-a6e51486e29f" alt="에러 발생 이미지" width="500">

3. Redis클러스터링 구축 후 동시접속을 다시 발생시키며, 정상등록됨을 확인

<br/>

# 사전 정보 수집내용
1. JMeter 과부하 발생 방법 숙지
2. Redis 클러스터 구성 방법 숙지: 대용량 트래픽을 처리하기 위해 Redis 클러스터를 구성. Redis 클러스터링은 여러 Redis 노드를 묶어 하나의 클러스터로 구성하는 방법이다. 이 클러스터는 데이터와 요청을 여러 노드에 분산 처리하여 성능을 향상시키고, 특정 노드에 장애가 발생해도 데이터를 복구할 수 있는 구조를 제공
3. 클러스터링의 기본 개념
  - 슬롯(Slot): Redis 클러스터는 0부터 16383까지 총 16384개의 슬롯으로 구성. 각 키는 해시 함수에 의해 특정 슬롯에 매핑되고, 이 슬롯이 클러스터 내 특정 노드에 할당
  - 마스터-슬레이브 구조: 각 마스터 노드는 데이터를 저장하고 요청을 처리하며, 슬레이브 노드는 마스터 노드를 백업하고 장애 조치(failover)를 제공. 마스터 (읽기, 쓰기 전용),  슬레이브(읽기전용)  > 마스터 삭제시 슬레이브 내용도 지워짐.
  - 왜 Redis 클러스터링이 적합한가?
    - 자동화된 데이터 분산: Redis 클러스터링은 데이터(세션)를 자동으로 여러 노드에 분산시켜 저장한다. 이를 통해 단일 노드의 메모리 용량이나 처리 한계를 극복 가능
    - 고가용성 지원: 클러스터링 환경에서는 노드에 장애가 발생해도 다른 노드가 대신 처리할 수 있다. 클러스터의 각 마스터 노드는 슬레이브 노드와 함께 장애 복구를 지원
    - 부하 분산: 여러 노드가 동시에 요청을 처리하므로, 부하가 분산되어 성능이 향상
4. Redis클러스터링 구성 방법<br/>
   <img src="https://github.com/user-attachments/assets/d9ac68aa-aaf4-419f-a160-a3935e0d674e" alt="클러스터링구성작업" width="700">

<br/>

# 8. 디렉토리 구조
![image](https://github.com/user-attachments/assets/91620caf-21cb-4bb0-8625-8b70b972fe4c)

<br/>

# [ 기록 & 에러 ]
1. @EnableRedisHttpSession과 application.properties에서 Redis 설정을 주석 처리했음에도 불구하고 Redis에 세션이 저장되는 이유?
   - Spring Boot의 자동 구성 기능과 spring-session-data-redis(build.gradle) 라이브러리 때문에, @EnableRedisHttpSession과 Redis 설정을 주석 처리해도 Redis에 세션이 저장될 수 있다. 따라서 spring.session.store-type=none(application.properties) 처리
   - 그래도 안되면 build.gradle의 라이브러리 의존성을 주석 implementation 'org.springframework.session:spring-session-data-redis'

<br/>

# 추가적인 고려 사항
- 보안 고려: 세션 정보가 Redis에 평문으로 저장되지 않도록 암호화하거나 Redis 연결 시 보안 설정을 적용 필요.
