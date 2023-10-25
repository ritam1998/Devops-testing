FROM openjdk:11

VOLUME /tmp

ADD build/libs/*.jar devops-integration.jar
ENTRYPOINT ["java","-jar","/devops-integration.jar"]