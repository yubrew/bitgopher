require 'spec_helper'

describe Transaction do

  describe :validations do

    context 'from_user does not exist' do

      before(:each) do
        @t = FactoryGirl.build(:transaction, from_user_id: 1234123)
        @t.save
      end

      specify { @t.should_not be_valid }

      specify { @t.errors.messages.count.should eq 1 }

      specify { @t.errors.messages[:sender].should eq ['does not exist'] }

    end

  end

end
