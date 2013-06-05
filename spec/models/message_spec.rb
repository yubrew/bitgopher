require 'spec_helper'

describe Message do

  describe 'parse message' do

    context 'non-transaction message' do

      before(:each) do
        @m = FactoryGirl.create(:message)
        @m.parse
      end

      specify { @m.parsed.should eq true }

      specify { @m.is_transaction.should eq false }

    end

    context 'GETACCOUNTINFO info request' do

      before(:each) do
        @m = FactoryGirl.create(:info_message)
        @m.parse
      end

      specify { @m.parsed.should eq true }

      specify { @m.is_transaction.should eq true }

      # message created, to be sent to user
    end

    pending context 'HISTORY info request' do

      before(:each) do
        @m = FactoryGirl.create(:info_message, content: 'HISTORY')
        @m.parse
      end

      specify { @m.parsed.should eq true }

      specify { @m.is_transaction.should eq true }

      # correct message created, to be sent to user
    end

    context 'transaction message' do
      specify 'both users in system, new transaction created' do
      end

      specify 'new to_user, creates user' do
      end

      specify "new transaction with +tip @user 1 btc" do
        m = FactoryGirl.create(:transaction_message)
        m.parse
        Transaction.where(message_id: m.id).first.message.should eq m
      end

      specify "new transaction with +tip @user 0.001 btc" do
        m = FactoryGirl.create(:transaction_message, content: '+tip @user 0.001 btc')
        m.parse
        Transaction.where(message_id: m.id).first.message.should eq m
      end

      pending specify '+tip 1 btc reply, creates transaction' do
        m = FactoryGirl.create(:message, content: '+tip 1 btc')
        m.parse
        #Transaction.where(message_id: m.id).count.should eq 1
        #Transaction.where(message_id: m.id).first.message.should eq m
      end

      specify 'unparsable, nothing happens' do
      end
    end

    context 'bitcoin_transaction message' do
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
