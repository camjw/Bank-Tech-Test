# frozen_string_literal: true

RSpec.describe BalanceCalculatorErrorHelper do
  subject { Helper.new }

  describe '#valid_transactions?' do
    context 'when the transactions are not in order' do
      it 'raises an error' do
        transactions = [
          ['02/01/1994', 100.0, 'deposit'],
          ['03/01/1994', 150.0, 'withdrawal'],
          ['01/01/1994', 300.0, 'deposit']
        ]
        expect { subject.valid_transactions?(transactions) }.to raise_error(
          'Transactions can only have balances appended when they are in '\
          'reverse chronological order'
        )
      end
    end
  end
end
