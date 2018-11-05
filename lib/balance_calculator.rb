# frozen_string_literal: true

# Class calculates and appends the balances to a list of transactions
class BalanceCalculator
  def append_balances(transactions)
    balance = 0
    transactions.reverse_each do |tran|
      tran[2] == 'deposit' ? balance += tran[1] : balance -= tran[1]
      tran << balance
    end
  end
end
