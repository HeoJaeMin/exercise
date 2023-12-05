FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN ./gradlew clean build

WORKDIR /app

COPY build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar", "-Dspring.profiles.active=core,${BRANCH}"]