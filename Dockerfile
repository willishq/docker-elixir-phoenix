FROM elixir:1.10-alpine

RUN apk --no-cache add inotify-tools postgresql-client

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix hex.info

EXPOSE 4000

RUN mix archive.install hex phx_new 1.4.13 --force
