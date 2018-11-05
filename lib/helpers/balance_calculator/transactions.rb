# frozen_string_literal: true

# Helper methods to append blanace to transactions
module Helpers::BalanceCalculator::Transactions
  def append_balances(transactions)
    valid_transactions?(transactions)

    update_transactions(transactions)
  end

  private

  def update_transactions(transactions)
    balance = 0
    transactions.reverse_each do |tran|
      balance += tran[1] * (tran[2] == 'deposit' ? 1 : -1)
      tran << balance
    end
  end
end
