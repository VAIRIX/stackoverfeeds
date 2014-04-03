require 'spec_helper'

describe Stackoverfeeds::SoFeed do

  describe 'attributes' do
    it { should respond_to :entry_id  }
    it { should respond_to :published }
    it { should respond_to :updated   }
    it { should respond_to :title     }
    it { should respond_to :author    }
    it { should respond_to :summary   }
  end

  describe 'methods' do
    let(:feeds_entries) do
      (1..12).each do
        Stackoverfeeds::SoFeed.make!
      end
    end

    it 'return the MAX permitted size even there are more (with parameter equals 5)' do
      feeds_entries
      expect(Stackoverfeeds::SoFeed.public_feeds(5).length).to eq(5)
    end

    it 'returns results in the correct order' do
      feeds_entries
      entry = Stackoverfeeds::SoFeed.make!(published: Time.now + 2.days)
      expect(Stackoverfeeds::SoFeed.public_feeds.first.id).to eq(entry.id)
    end
  end
end
