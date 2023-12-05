FROM adoptopenjdk:17-jre-hotspot

ARG BRANCH

RUN ./gradlew clean build

WORKDIR /app

COPY build/libs/*.jar app.jar

CMD ["java", "-jar", "app.jar", "-Dspring.profiles.active=core,${BRANCH}"]