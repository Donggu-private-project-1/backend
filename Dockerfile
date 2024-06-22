# Step 1: Build the JAR file
FROM gradle:7.6-jdk17 AS build

# Set the working directory
WORKDIR /home/gradle/project

# Copy the project files to the container
COPY --chown=gradle:gradle demo .

# Build the project
RUN gradle bootJar --no-daemon

# Step 2: Create the final image using IBM Semeru JDK 17
FROM icr.io/appcafe/ibm-semeru-runtimes:open-17-jdk

# Copy the built JAR file from the build image
COPY --from=build /home/gradle/project/build/libs/*.jar /app.jar

# Expose the port that the application will run on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java","-jar","/app.jar"]
