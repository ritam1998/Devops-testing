FROM openjdk:8-jdk-alpine
VOLUME /tmp

ADD build/libs/dev-ops-integration-0.0.1-SNAPSHOT.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]