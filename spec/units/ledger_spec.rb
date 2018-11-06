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
  describe '#add_balances' do
    context 'when the transactions are in reverse chronological order' do
      it 'appends the running balance to a series of transactions' do
        transactions = [
          ['03/01/1994', 100.0, 'deposit'],
          ['02/01/1994', 150.0, 'withdrawal'],
          ['01/01/1994', 300.0, 'deposit']
        ]
        expected_transactions = [
          ['03/01/1994', 100.0, 'deposit', 250.00],
          ['02/01/1994', 150.0, 'withdrawal', 150.00],
          ['01/01/1994', 300.0, 'deposit', 300.00]
        ]
        subject.add_balances(transactions)
        expect(transactions).to eq expected_transactions
      end
    end
  end
end
