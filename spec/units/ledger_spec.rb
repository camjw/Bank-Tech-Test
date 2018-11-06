# frozen_string_literal: true

require 'ledger'

RSpec.describe Ledger do
  describe '#store_transaction' do
    it 'takes a transaction and stores it in an array' do
      subject.store_transaction(['01/01/1994', 100.0, 'deposit'])
      expect(subject.transaction_history).to eq [
        ['01/01/1994', 100.0, 'deposit', 100.0]
      ]
    end
  end
  describe '#transaction_history' do
    context 'when the transactions are in reverse chronological order' do
      it 'appends the running balance to a series of transactions' do
        subject.store_transaction(['03/01/1994', 100.0, 'deposit'])
        expected_output = [["03/01/1994", 100.0, "deposit", 100.0]]
        expect(subject.transaction_history).to eq expected_output
      end
    end
  end
end
