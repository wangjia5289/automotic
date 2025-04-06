FROM maven:3.8.7-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:go-offline -B
COPY src /app/src
RUN mvn package -DskipTests
FROM eclipse-temurin:17-jre-alpine
LABEL maintainer="dev@example.com"
LABEL version="1.0"
RUN addgroup -S springboot && adduser -S springboot -G springboot
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
RUN chown -R springboot:springboot /app
USER springboot
EXPOSE 8080
HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q -O /dev/null http://localhost:8080/actuator/health || exit 1
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "app.jar"]
