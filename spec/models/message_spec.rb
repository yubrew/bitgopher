require 'spec_helper'

describe Message do
  describe 'parse message' do
    specify 'raise parse flag' do
      m = FactoryGirl.create(:message)
      m.parse
      m.parsed.should eq true
    end
  end
end
