module Stackoverfeeds
  module StackoverfeedsHelper
    def stackoverflow_feeds(limit=ENV['feeds_number'].to_i)
      @entries = Stackoverfeeds::SoFeed.public_feeds(limit)
      render partial: 'stackoverfeeds/stackoverflow_feeds'
    end
  end
end
