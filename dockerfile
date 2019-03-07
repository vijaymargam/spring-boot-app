FROM frolvlad/alpine-java:jdk8-slim
WORKDIR /
VOLUME /opt
ADD http://172.31.16.98:8081/nexus/service/local/repositories/maven_spring_boot/content/com/spring-boot-aop/0.0.1/spring-boot-aop-0.0.1.jar /opt/.
EXPOSE 8080
CMD java -jar /opt/spring-boot-aop-0.0.1.jar
