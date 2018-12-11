desc "Setup of the database"
task :setup_db do
  puts "-------------------- Start  Setup -------------------"
  sh "rails db:drop"
  sh "rails db:create"
  sh "rails db:migrate"
  puts "---------------------- Finished ---------------------"
end

desc "Setup of the database"
task :setup_db_with_seeds do
  puts "-------------------- Start  Setup -------------------"
  sh "rails db:drop"
  sh "rails db:create"
  sh "rails db:migrate"
  sh "rails db:seed"
  puts "---------------------- Finished ---------------------"
end

