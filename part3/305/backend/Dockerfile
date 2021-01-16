FROM node:alpine

WORKDIR /app
EXPOSE 8000
ENV FRONT_URL=http://localhost:5000
COPY ./backend-example-docker/ /app/

RUN chown -R node /app \ 
    && rm -rf /var/lib/apt/lists/* \
    && npm install

USER node

CMD npm start
