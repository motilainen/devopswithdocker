FROM openjdk:8-alpine

EXPOSE 8080

COPY ./spring-example-project /usr/src/app
WORKDIR /usr/src/app

RUN adduser -D app \
    && chown -R app /usr/src/app \
    && /usr/src/app/mvnw package 

USER app
    
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
