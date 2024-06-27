FROM openjdk:11-jre-slim
//ARG JAR_FILE=target/*.jar
//COPY ${JAR_FILE} app.jar
//ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 9090
WORKDIR /app
ARG JAR=hello-0.0.1-SNAPSHOT.jar

COPY  /target/$JAR /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
