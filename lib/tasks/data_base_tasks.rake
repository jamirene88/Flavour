namespace :database do
  desc "Setup of the database without seeding"
  task :create => :environment do
    puts "-------------------- Start  Setup -------------------"
    sh "rails db:drop"
    sh "rails db:create"
    puts "---------------------- Finished ---------------------"
  end

  desc "Migrating and seeding database"
  task :migrate_db => :environment do
    puts "-------------------- Start  Setup -------------------"
    sh "rails db:migrate"
    sh "rails db:seed"
    puts "---------------------- Finished ---------------------"
  end

  task :setup => [:create, :migrate_db]
end

desc "Complete Creation of a database with seeds"
task :database => 'database:setup'
