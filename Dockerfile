FROM ruby:2-alpine

RUN apk update && apk add git docker

COPY . /gem

WORKDIR /gem

RUN gem build docker-ruby.gemspec
RUN gem install --local docker-ruby

CMD ["irb", "-I", ".", "-r", "./lib/docker/docker.rb"]
