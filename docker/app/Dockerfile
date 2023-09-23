FROM ruby:2.6.10-slim-buster

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs shared-mime-info curl

# Setting env up
ENV RAILS_ROOT=/var/app
ENV RAILS_ENV=production
RUN mkdir -p $RAILS_ROOT
# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler:2.2.21
RUN bundle config set force_ruby_platform true
RUN gem install nokogiri -v 1.13.10 --platform=ruby
RUN bundle install

# Adding project files
ADD . .

#Log Config
RUN ln -sf /dev/stdout $RAILS_ROOT/log/production.log 

RUN bundle exec rails assets:precompile

ADD docker/app/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]