# Simple Spring Boot CI/CD Application

This project is a basic Spring Boot REST API with a CI/CD pipeline using GitHub Actions.

## Features
- Spring Boot 3 REST endpoint: `/api/hello`
- Unit/integration test with MockMvc
- CI pipeline: build + test on push and pull request
- CD pipeline: Docker image publish to GHCR on push to `main`

## Prerequisites
- Java 17
- Maven 3.9+
- Docker (optional, for container run)

## Run locally
1. Build and test:
   mvn clean verify

2. Run app:
   mvn spring-boot:run

3. Test endpoint:
   http://localhost:8080/api/hello

## Build Docker image locally
1. Build jar:
   mvn clean package

2. Build image:
   docker build -t cicd-app:local .

3. Run image:
   docker run -p 8080:8080 cicd-app:local

## CI/CD workflow
Workflow file:
- `.github/workflows/ci-cd.yml`

Pipeline behavior:
- On pull request to `main`: build and test
- On push to `main`: build, test, and publish Docker image to GHCR
