FROM ubuntu:16.04

WORKDIR /app

EXPOSE 5000
ENV API_URL=http://localhost:8000
COPY ./frontend-example-docker/ /app/

RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt-get install -y nodejs
RUN npm install

CMD npm start