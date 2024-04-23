set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exex rake assets:clean
bundle exec rake db:migrate