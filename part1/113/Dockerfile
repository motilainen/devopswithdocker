FROM openjdk:8

EXPOSE 8080

COPY ./spring-example-project /usr/src/myapp
WORKDIR /usr/src/myapp
RUN /usr/src/myapp/mvnw package
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]