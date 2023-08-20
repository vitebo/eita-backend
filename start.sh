#!/bin/bash
set -e

# export RAILS_ENV=production

# install gems
bundle check || bundle install

# setup-db
bundle exec rails db:create
bundle exec rails db:migrate
rake seed:migrate

# start project
rm -rf /app/tmp/pids/server.pid
bundle exec rails s -b 0.0.0.0 -p 3001
