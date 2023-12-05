FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN echo "VALUE OF BRANCH: ${BRANCH}"

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build --no-demon

CMD ["java", "-jar", "exec-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=core,${BRANCH}"]