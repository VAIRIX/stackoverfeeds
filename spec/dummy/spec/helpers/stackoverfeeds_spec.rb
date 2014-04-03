require 'spec_helper'
require 'stackoverfeeds/stackoverfeeds_handler'

describe Stackoverfeeds::StackoverfeedsHelper do

  describe 'stackoverflow_feeds' do

    before :each do
      link ="File://#{Rails.root}/spec/resources/member.atom"
      StackoverfeedsHandler.fetch_and_create_feeds_enrties link
    end

    context 'check content correctness' do

      it 'has to render partial stackoverflow_feeds with atom entries' do
        expect(stackoverflow_feeds 20).to match /It makes only one query./
      end
    end
  end
end