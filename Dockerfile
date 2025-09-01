# Use the official Eclipse Temurin JDK 17 (Java Development Kit) base image

FROM eclipse-temurin:17-jdk-alpine

# Open port 8080 on the container (so outside services can connect)

EXPOSE 8080

# Run "ls" command during the build (mostly for debugging – it lists files)

RUN ls 

# Define an environment variable APP_HOME with the path where the app will live

ENV APP_HOME /usr/src/app

# Copy the application JAR file from local "app/" folder into the container
# and rename it as app.jar inside $APP_HOME

COPY app/*.jar $APP_HOME/app.jar

# Set the working directory to $APP_HOME
# Any subsequent commands (like CMD) will run from here

WORKDIR $APP_HOME

# Define the default command to run when the container starts:
# Launch the JAR file using java -jar

CMD ["java", "-jar", "app.jar"]
