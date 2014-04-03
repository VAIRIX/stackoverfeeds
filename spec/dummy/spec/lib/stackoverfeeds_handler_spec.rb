require 'spec_helper'
require 'stackoverfeeds/stackoverfeeds_handler'

describe StackoverfeedsHandler do

  describe '.fetch_and_create_feeds_enrties' do

    let(:link) { "File://#{Rails.root}/spec/resources/member.atom" }

    it 'has to fetch entries from feeds' do
      expect{ StackoverfeedsHandler.fetch_and_create_feeds_enrties(link) }.to change{ Stackoverfeeds::SoFeed.count }.by(11)
    end

  end

end

