FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN echo "VALUE OF BRANCH: ${BRANCH}"

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build

CMD ["java", "-jar", "app.jar", "--spring.profiles.active=core,${BRANCH}"]