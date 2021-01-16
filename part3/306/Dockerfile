FROM node:alpine as build-stage

WORKDIR /usr/app
EXPOSE 5000
ENV API_URL=http://localhost:8000
COPY ./frontend-example-docker/ /usr/app/

RUN npm install && npm run build

FROM nginx

COPY --from=build-stage /usr/app/dist/ /usr/share/nginx/html

# start with: docker container run -it -p 8080:80 306-front