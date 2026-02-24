# Multi-stage Dockerfile for building and running the Spring Boot app

# Build stage: uses Maven + JDK 21 to build the fat jar
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /workspace

# cache pom separately for better layer caching
COPY pom.xml ./
COPY src ./src

RUN mvn -B clean package -DskipTests

# Runtime stage: lightweight Temurin JRE
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy built jar from the build stage
ARG JAR_FILE=/workspace/target/*.jar
COPY --from=build ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
