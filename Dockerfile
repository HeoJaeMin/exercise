FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN echo "VALUE OF BRANCH: ${BRANCH}"

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build --no-daemon

RUN if [ "$BRANCH" = "live" ]; then \
       PORT=8083; \
    elif [ "$BRANCH" = "qa" ]; then \
       PORT=8082; \
    else \
       PORT=8081; \
    fi && \
    echo "Using port $PORT" && \
    EXPOSE $PORT

ENTRYPOINT ["java", "-jar", "/app/build/libs/exec-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=core,${BRANCH}"]