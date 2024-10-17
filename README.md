# redis-high-traffic-simulation
Redis를 이용한 대용량 트래픽을 경험(접속자 세션을 부하시키는 프로젝트를 설계하고 운영)

<br/>

# 1. 프로젝트 목표
 - 대용량 트래픽을 발생시켜 Redis를 통한 세션 관리의 성능을 테스트하고 병목지점을 파악
 - Redis의 기능을 활용하여 애플리케이션 성능을 향상
 - JMeter로 부하 트래픽을 발생 시킨 후 Redis의 기능을 통해 문제점 해결 
 
<br/>

# 2. 아키텍처
![image](https://github.com/user-attachments/assets/ccd35302-97ff-42e6-9751-f727461a6ef5)


<br/>

# 3. 구현

<br/>

# 4. 부하 테스트 시나리오 설정
1. 동시 접속자 수 증가 테스트: 점진적으로 동시 접속자 수를 늘리면서 서버의 반응 시간을 측정
2. 지속적인 부하 테스트: 일정 시간 동안 지속적으로 요청을 보내며 서버가 안정적으로 처리할 수 있는지를 확인
3. 피크 트래픽 테스트: 짧은 시간 동안 많은 요청을 보내 트래픽이 급증하는 상황을 시뮬레이션

<br/>

# 5. 부하 테스트 도구 사용(JMeter)
1. JMeter 설치 및 설정: JMeter를 설치하고, 테스트 계획을 작성
2. 테스트 시나리오 작성: 로그인 요청, 세션 유지, 로그아웃 요청 등을 포함한 테스트 계획 작성

<br/>

# 6. 성능 모니터링 및 최적화
- 모니터링 툴 사용: 애플리케이션 성능 모니터링을 위해 Prometheus와 Grafana를 사용하여 메트릭을 수집하고 시각화합니다.
- Redis 성능 최적화: Redis의 설정을 조정하여 메모리 사용량을 최적화하거나, Eviction Policy를 설정하여 메모리 초과 시 불필요한 데이터를 제거합니다.
- Spring Boot 최적화: 스레드 풀 크기 조정, Redis 연결 풀 설정 등을 통해 애플리케이션의 성능을 향상시킵니다.

<br/>

# 7. 장애처리 및 확정성 고려
- Redis 클러스터 구성: 대용량 트래픽을 처리하기 위해 Redis 클러스터를 구성하고, Sharding을 이용하여 데이터를 분산 저장합니다.
- 로드 밸런싱: 여러 서버에 트래픽을 분산시켜 서버 과부하를 방지합니다.
- Redis 장애 대비: Redis Sentinel을 이용해 Redis 장애 상황에서 자동으로 장애 복구를 수행하도록 설정합니다.

<br/>

# 8. 디렉토리 구조
![image](https://github.com/user-attachments/assets/91620caf-21cb-4bb0-8625-8b70b972fe4c)

<br/>

# [ 기록 & 에러 ]
1. @EnableRedisHttpSession과 application.properties에서 Redis 설정을 주석 처리했음에도 불구하고 Redis에 세션이 저장되는 이유?
   - Spring Boot의 자동 구성 기능과 spring-session-data-redis(build.gradle) 라이브러리 때문에, @EnableRedisHttpSession과 Redis 설정을 주석 처리해도 Redis에 세션이 저장될 수 있다. 따라서 spring.session.store-type=none(application.properties) 처리
   - 그래도 안되면 build.gradle의 라이브러리 의존성을 주석 implementation 'org.springframework.session:spring-session-data-redis'

