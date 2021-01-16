FROM ubuntu:16.04

WORKDIR /app
EXPOSE 8000
ENV FRONT_URL=http://localhost:5000
COPY ./backend-example-docker/ /app/

RUN apt-get update && apt-get install -y \
    curl ca-certificates && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt-get install -y nodejs && npm install && \
    apt-get purge -y --auto-remove curl && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m app && \
    chown -R app /app
    
USER app

CMD npm start