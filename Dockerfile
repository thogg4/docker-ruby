FROM ruby:2-alpine

RUN apk update && apk add git

COPY . /gem

WORKDIR /gem

RUN gem build docker-ruby.gemspec
RUN gem install --local docker-ruby.gem
