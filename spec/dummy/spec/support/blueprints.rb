require 'machinist/active_record'

  Stackoverfeeds::SoFeed.blueprint do
    entry_id  { 'tag:github.com,2008:CreateEvent/1946558445' }
    published { Time.now }
    updated   { Time.now }
    title     { 'vairix-mvillero created branch mvillero at vairix-garbeletche/vairix_test' }
    author    { 'vairix-mvillero' }
    summary   { '<div> <span> </span> </div>' }
  end
