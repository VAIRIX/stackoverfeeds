Stackoverfeeds::Engine.routes.draw do
  match 'feed_summary', controller: 'so_feeds', action: 'feed_summary', as: 'feed_summary', via: :get
end
