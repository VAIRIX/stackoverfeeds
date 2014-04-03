module Stackoverfeeds
  class Engine < ::Rails::Engine
    isolate_namespace Stackoverfeeds

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :machinist, :dir => 'spec/support'
      g.assets false
      g.helper false
    end

  end
end
