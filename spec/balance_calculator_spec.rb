require 'balance_calculator'

RSpec.describe BalanceCalculator do
  describe '#append_balances' do
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
      subject.append_balances(transactions)
      expect(transactions).to eq expected_transactions
    end
  end
end
