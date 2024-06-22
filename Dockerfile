# Step 1: JAR 파일 빌드
FROM eclipse-temurin:17 AS build

# 작업 디렉토리 설정
WORKDIR /home/app/demo

# 프로젝트 파일을 컨테이너로 복사
COPY demo .

# Gradle 래퍼 스크립트에 실행 권한 부여
RUN chmod +x gradlew

# 프로젝트 빌드
RUN ./gradlew bootJar --no-daemon

# Step 2: Eclipse Adoptium Temurin JDK 17을 사용하여 최종 이미지 생성
FROM eclipse-temurin:17

# 빌드 이미지에서 생성된 JAR 파일 복사
COPY --from=build /home/app/demo/build/libs/*.jar /app.jar

# 애플리케이션이 실행될 포트 노출
EXPOSE 8080

# JAR 파일 실행
ENTRYPOINT ["java","-jar","/app.jar"]
