#
# Requires gem "capistrano"
#
# Init Capfile with "capify" -command, then replace config/deploy.rb with this
#
#
# Usage
#
# First run: cap deploy:setup
#   This generates directory structure
#
# Then: cap deploy  !
#
# see cap -T for tasks


# Copy settings
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression, :gzip

# tunnel connection via public gateway
# note: ssh-key need s
set :gateway, "melkinpaasi.cs.helsinki.fi"

# needs to be set when rake is not in standard location
set :rake, "/opt/ruby-enterprise-1.8.7-2009.10/bin/rake"

# Server settings

set :application, "hali-ilmo2.0"

set :repository, "git://github.com/chawi/hali-ilmo2.0.git"
 #"git@git.mpa.fi:railsluento.git"
set :scm, "git"

# deploy to ilmo2, but link: /home/paksula/rails -> /home/paksula/ilmo2/current
# ln -s ilmo2/current rails
set :deploy_to, "/home/lwojala/hali-ilmo2.0"
set :user, "lwojala"


role :app, "rails.cs.helsinki.fi", :primary => true
role :db, "rails.cs.helsinki.fi", :primary => true


namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end


after "deploy:symlink", "deploy:migrate"

# namespace :app do
#   desc "Run sample data on production"
#   task :sample do
#     run "export RAILS_ENV=production ; cd #{current_path} ; rake db:seed"
#   end
# end

