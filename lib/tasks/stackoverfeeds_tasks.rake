namespace :stackoverfeeds do

  desc 'Update feeds from Stackoverflow'
  task update_feeds: :environment do
    require 'stackoverfeeds/stackoverfeeds_handler'
    StackoverfeedsHandler.update_feeds
  end

  desc 'Add cron task to update feeds'
  task schedule: :environment do
    exec("whenever -i -r #{Rails.env} -f config/stackoverfeeds/schedule.rb")
  end

end