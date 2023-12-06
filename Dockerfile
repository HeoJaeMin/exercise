FROM gradle:8.5.0-jdk17

ARG BRANCH

RUN echo "VALUE OF BRANCH: ${BRANCH}"

WORKDIR /app

COPY build.gradle settings.gradle gradle gradlew gradlew.bat /app/

COPY src /app/src

RUN gradle clean build --no-daemon

RUN if["${BRANCH}" = "live"]; then \
   EXPOSE 8083; \
   elif [ "${BRANCH}" = "qa"]; then\
   EXPOSE 8082;\
   else \
   EXPOSE 8081;\
   fi

ENTRYPOINT ["java", "-jar", "/app/build/libs/exec-0.0.1-SNAPSHOT.jar", "--spring.profiles.active=core,${BRANCH}"]