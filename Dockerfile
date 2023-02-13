FROM maven:3.8.3 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


FROM openjdk:17-jdk-slim
EXPOSE 8080
COPY --from=build /home/app/target/database-0.0.1-SNAPSHOT.jar /usr/local/lib/database.jar


ENTRYPOINT ["java","-jar","/usr/local/lib/database.jar"]