FROM gradle:8.5.0-jdk17

ARG BRANCH

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build --no-daemon

CD ./build/libs

CMD ["java", "-jar", "/app/build/libs/exec-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=core,${BRANCH}"]