FROM adoptopenjdk:17-jre-hotspot

# Set the working directory in the container
WORKDIR /app

# Copy the packaged Spring Boot application JAR file into the container
COPY build/libs/*.jar app.jar

# Command to run the Spring Boot application when the container starts
CMD ["java", "-jar", "app.jar"]