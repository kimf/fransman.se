FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y nodejs
ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install
