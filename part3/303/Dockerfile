# FROM ubuntu:18.04
FROM docker

COPY ./script.exs /app
WORKDIR /app

ENV LC_ALL=C.UTF-8 
RUN apk add git elixir

CMD ["elixir", "script.exs"]