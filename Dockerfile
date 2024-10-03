FROM ruby:2.7.0-alpine AS middleman-builder
WORKDIR /app
ENV RAILS_ENV production

RUN apk update && apk --update add ruby ruby-irb nodejs ruby-json ruby-rake \
   ruby-bigdecimal ruby-io-console libstdc++ tzdata  \
   libffi-dev libxml2-dev libxslt-dev

# Necessary for some gems which are compiled on bundle install
RUN apk add --virtual build-deps git build-base ruby-dev \
   libc-dev linux-headers && \
   gem install bundler -v 2.4.22 && \
   bundle config build.nokogiri --use-system-libraries

# Only do a bundle install if the gemfile changes
COPY Gemfile* /app/
RUN bundle install --clean --without development test
COPY . /app
RUN bundle exec middleman build --verbose
