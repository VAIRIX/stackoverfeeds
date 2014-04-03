module Stackoverfeeds
  class SoFeed < ActiveRecord::Base

    def self.public_feeds(limit = ENV['stackoverflow_feeds_number'].to_i)
      SoFeed.order('published DESC').limit(limit)
    end

  end
end
