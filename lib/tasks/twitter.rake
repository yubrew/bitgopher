namespace :twitter do
  task :import_messages => :environment do
    Message.pull_messages_from_twitter
    puts 'finished'
  end

  task :import_userstream => :environment do
    Message.pull_tweets
    puts 'finished tweets'
  end

end
