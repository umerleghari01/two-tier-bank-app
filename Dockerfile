# Base Image 
FROM maven:3.8.3-openjdk-17-slim  
# Set working directory

WORKDIR   /app

# Copy files from host to container (working directory path)

COPY   .    /app
# Run to compile code

RUN  mvn clean install -DskipTests=true
RUN mv  /app/target/*.jar   /app/target/app.jar
# Expose a port

EXPOSE  8081

# Set default command to run the compiled code

CMD  ["java", "-jar", "/app/target/app.jar"] 


