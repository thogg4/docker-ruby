FROM ruby:2-alpine

RUN apk update && apk add docker

RUN mkdir /gem
WORKDIR /gem
COPY Gemfile /gem
COPY docker-ruby.gemspec /gem

RUN bundle install

COPY . /gem

CMD ["irb", "-I", "lib", "-r", "./lib/docker/docker.rb"]
