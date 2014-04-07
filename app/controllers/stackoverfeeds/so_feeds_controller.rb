module Stackoverfeeds
  class SoFeedsController < ApplicationController

    def feed_summary
      entry_id = params[:entry_id]
      render text: Stackoverfeeds::SoFeed.find(entry_id).summary
    end

  end
end
