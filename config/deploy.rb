set :application, "rails"
set :deploy_to, "/home/deployer/rails"
set :repository,  "git@github.com:JonasFromell/Swedimport.git"

set :real_revision, lambda{ source.query_revision(revision) { |cmd| capture(cmd) } }

ssh_options[:paranoid] = false
default_run_options[:pty] = true

set :scm, :git
set :git_shallow_clone, 1
set :keep_releases, 2
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "deployer"
set :password, "8w2u7757"
set :use_sudo, false
set :runner, "deployer"

role :web, "31.192.226.123"                          # Your HTTP server, Apache/etc
role :app, "31.192.226.123"                          # This may be the same as your `Web` server
role :db,  "31.192.226.123", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end