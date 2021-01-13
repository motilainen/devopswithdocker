FROM ruby:2.6.0

EXPOSE 3000
COPY ./rails-example-project /usr/src/myapp
WORKDIR /usr/src/myapp

RUN gem install bundler
RUN bundle install
RUN apt-get update && apt-get install -y nodejs
RUN rails db:migrate
CMD [ "rails", "s" ]