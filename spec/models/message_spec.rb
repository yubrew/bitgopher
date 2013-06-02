require 'spec_helper'

describe Message do
  describe 'parse message' do
    specify 'raise parse flag' do
      m = FactoryGirl.create(:message)
      m.parse
      m.parsed.should eq true
    end

    context 'info request' do
      specify 'valid message creates info request' do
      end
    end

    context 'transaction' do
      specify 'both users in system, new transaction created' do
      end

      specify 'new to_user, creates user' do
      end

      specify 'unparsable, nothing happens' do
      end
    end

    context 'bitcoin_transaction' do
      context 'withdrawal' do

        specify 'valid withdrawal' do
        end

        specify 'invalid, replies with error' do
        end

      end

      context 'deposit' do
        specify 'creates bitcoin address' do
        end

        specify 'sends reply' do
        end

        specify 'updates balance' do
        end

        specify 'future deposit updates balance' do
        end
      end
    end
  end
end
