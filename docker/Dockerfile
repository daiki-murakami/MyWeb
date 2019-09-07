FROM ruby:2.6.3
ENV LANG C.UTF-8
ENV APP_ROOT="/my_app" \
    CONTAINER_ROOT="./"
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && gem install bundler \
                rails:5.2.3 \
                nokogiri \
                mysql2:0.5.2
WORKDIR $APP_ROOT
COPY Gemfile Gemfile.lock $CONTAINER_ROOT
RUN bundle install
ENV RAILS_SERVE_STATIC_FILES=1
