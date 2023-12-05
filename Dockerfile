FROM gradle:8.5.0-jdk17

ARG BRANCH

WORKDIR /app

COPY build.gradle settings.gradle /app/

COPY src /app/src

RUN ./gradlew clean build

CMD ["java", "-jar", "app.jar", "-Dspring.profiles.active=core,${BRANCH}"]