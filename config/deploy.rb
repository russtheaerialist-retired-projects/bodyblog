set :application, "bodyblog"
set :repository,  "git://github.com/RussTheAerialist/bodyblog.git"
set :scm, :git

set :deploy_to, "/home/rhay/sites/bodyblog"
set :use_sudo, false

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

  task :setup_body_directory do
     run "mkdir -p #{shared_path}/images/body"
  end
  after "deploy:setup", :setup_body_directory

  task :link_body_directory do
     run "ln -s #{shared_path}/images/body #{release_path}"
  end
  after "deploy:update_code", :link_body_directory

  task :setup_production_database_configuration do
   mysql_password = Capistrano::CLI.password_prompt("Production MySQL password: ")
   require 'yaml'
   spec = { "production" => {
     "adapter" => "mysql",
     "database" => "bodyblog",
     "username" => "bodyblog",
     "password" => mysql_password } }
   run "mkdir -p #{shared_path}/config"
   put(spec.to_yaml, "#{shared_path}/config/database.yml")
 end
 after "deploy:setup", :setup_production_database_configuration

 task :copy_production_database_configuration do
   run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
 end
 after "deploy:update_code", :copy_production_database_configuration

task :set_intense_debate_account, :roles => :app do
    accountno = Capistrano::CLI.ui.ask("Your Intense Debate Account Number: ")
    set :accountno, accountno
    run "mv #{release_path}/app/controllers/application_controller.rb #{release_path}/app/controllers/application_controller.rb.orig"
    run "sed 's/SSacctnoSS/#{accountno}/g' < #{release_path}/app/controllers/application_controller.rb.orig > #{release_path}/app/controllers/application_controller.rb"
end
after "deploy:update_code", :set_intense_debate_account
