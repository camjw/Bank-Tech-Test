# frozen_string_literal: true

require_relative 'helpers/balance_calculator_error_helper'

# Class calculates and appends the balances to a list of transactions
class BalanceCalculator
  include BalanceCalculatorErrorHelper

  def append_balances(transactions)
    valid_transactions?(transactions)

    update_transactions(transactions)
  end

  private

  def update_transactions(transactions)
    balance = 0
    transactions.reverse_each do |tran|
      tran[2] == 'deposit' ? balance += tran[1] : balance -= tran[1]
      tran << balance
    end
  end
end
