#!/bin/bash
set -e

# export RAILS_ENV=production

# setup-db
bundle exec rails db:create
bundle exec rails db:migrate

# start project
bundle exec rails s -b 0.0.0.0 -p 3001
