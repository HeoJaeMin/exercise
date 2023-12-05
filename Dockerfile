FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN echo "VALUE OF BRANCH: ${BRANCH}"

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build --no-daemon

CMD ["java", "-jar", "build/libs/*.jar", "--spring.profiles.active=core,${BRANCH}"]