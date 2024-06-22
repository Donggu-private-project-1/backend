# Step 1: Build the JAR file
FROM eclipse-temurin:17 AS build

# Set the working directory
WORKDIR /home/gradle/project

# Copy the project files to the container
COPY --chown=gradle:gradle demo .

# Build the project
RUN gradle bootJar --no-daemon

# Step 2: Create the final image using Eclipse Adoptium Temurin JDK 17
FROM eclipse-temurin:17

# Copy the built JAR file from the build image
COPY --from=build /home/gradle/project/build/libs/*.jar /app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java","-jar","/app.jar"]
