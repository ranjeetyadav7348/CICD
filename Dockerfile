# Stage 1: Build
FROM eclipse-temurin:17-jdk AS build
WORKDIR /build
COPY pom.xml .
COPY src ./src
RUN --mount=type=cache,target=/root/.m2 \
    apt-get update -qq && apt-get install -y maven -qq && \
    mvn -B clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /build/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
