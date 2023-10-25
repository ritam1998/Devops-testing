FROM openjdk:8-jdk-alpine
VOLUME /tmp

ADD build/libs/*.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]