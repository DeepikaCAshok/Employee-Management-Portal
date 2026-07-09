# Java 17 base image
FROM eclipse-temurin:17-jdk

# Application directory
WORKDIR /app

# Copy Spring Boot jar
COPY target/employee-management-0.0.1-SNAPSHOT.jar app.jar

# Expose Spring Boot port
EXPOSE 8080

# Start application
ENTRYPOINT ["java", "-jar", "app.jar"]
