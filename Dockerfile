# Step 1: Build the JAR file
FROM eclipse-temurin:17 AS build

# Set the working directory
WORKDIR /home/app/demo

# Copy the project files to the container
COPY demo .

RUN chmod +x gradlew

# Build the project
RUN ./gradlew bootJar --no-daemon

# Step 2: Create the final image using Eclipse Adoptium Temurin JDK 17
FROM eclipse-temurin:17

# Copy the built JAR file from the build image
COPY --from=build /home/app/demo/build/libs/*.jar /app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java","-jar","/app.jar"]
