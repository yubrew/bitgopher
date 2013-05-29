namespace :twitter do
  task :import_messages => :environment do
    Message.pull_messages_from_twitter
    puts 'finished'
  end

end
