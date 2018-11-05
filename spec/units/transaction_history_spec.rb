# frozen_string_literal: true

require 'transaction_history'

RSpec.describe TransactionHistory do
  describe '#store_transaction' do
    it 'takes a transaction and stores it in an array' do
      subject.store_transaction(['01/01/1994', 100.0, 'deposit'])
      expect(subject.transactions).to eq [['01/01/1994', 100.0, 'deposit']]
    end
  end
end
