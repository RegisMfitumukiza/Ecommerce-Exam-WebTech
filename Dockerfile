# Use a base image with Java and Maven installed
FROM eclipse-temurin:17-jdk-jammy AS build

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the Maven project file
COPY Ecommerce-Exam-Project/pom.xml .

# Download and cache the dependencies
RUN mvn dependency:go-offline -B

# Copy the entire project
COPY Ecommerce-Exam-Project .

# Build the application
RUN mvn package -DskipTests

# Use a lightweight runtime image
FROM eclipse-temurin:17-jdk-jammy

# Set the working directory inside the container
WORKDIR /app

# Copy the built artifacts from the build stage
COPY --from=build /app/UserAdmin/target/UserAdmin-0.0.1-SNAPSHOT.jar /app/useradmin.jar
COPY --from=build /app/Client/target/Client-0.0.1-SNAPSHOT.jar /app/client.jar
COPY --from=build /app/Link/target/Link-0.0.1-SNAPSHOT.jar /app/link.jar

# Expose the ports your applications run on (replace with the actual ports used)
EXPOSE 8080 9090

# Set the entry point to run the main JAR file (adjust as needed)
ENTRYPOINT ["java", "-jar", "/app/client.jar"]