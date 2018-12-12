desc "Installs gems and js packs"
task :environment_setup do
  puts "-------------------- Start  Setup -------------------"
  sh "bundle install"
  sh "yarn install"
  puts "---------------------- Finished ---------------------"
end
