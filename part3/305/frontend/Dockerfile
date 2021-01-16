FROM node:alpine

WORKDIR /app
EXPOSE 5000
ENV API_URL=http://localhost:8000
COPY ./frontend-example-docker/ /app/

RUN chown -R node /app \ 
    && rm -rf /var/lib/apt/lists/* \
    && npm install

USER node

CMD npm start