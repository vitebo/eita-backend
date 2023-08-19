# syntax=docker/dockerfile:1
FROM ruby:2.7-alpine

ENV RAILS_SERVE_STATIC_FILES=true

RUN apk add \
    bash \
    build-base \
    postgresql-dev \
    tzdata \
    nodejs

RUN apk add --no-cache yarn

WORKDIR /app
COPY . /app
RUN gem install bundler
RUN bundle install

RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]

EXPOSE 3001 80
