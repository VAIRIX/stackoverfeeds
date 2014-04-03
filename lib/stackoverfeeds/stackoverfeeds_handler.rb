require 'rest_client'
require 'feedjira'

module StackoverfeedsHandler

  SO_URL = "http://stackoverflow.com/feeds/user/#{ENV['user_number']}"

  def self.update_feeds
    StackoverfeedsHandler.fetch_and_create_feeds_enrties(SO_URL)
  end

  def self.fetch_and_create_feeds_enrties(url)
    feed = Feedjira::Feed.fetch_and_parse(url)
    StackoverfeedsHandler.add_entries(feed.entries)
  end

  private

  def self.add_entries(entries)
    entries.each do |entry|
      unless Stackoverfeeds::SoFeed.where(entry_id: entry.entry_id).first
        feed_entry = Stackoverfeeds::SoFeed.new
        feed_entry.entry_id = entry.entry_id
        feed_entry.published = entry.published
        feed_entry.updated = entry.updated
        feed_entry.title = entry.title
        feed_entry.author = entry.author
        feed_entry.summary = entry.summary
        feed_entry.save!
      end
    end
  end

end
