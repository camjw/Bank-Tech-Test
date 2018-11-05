# frozen_string_literal: true

require_relative 'helpers/balance_calculator/error_helper'
require_relative 'helpers/balance_calculator/transaction_helper'

# Class calculates and appends the balances to a list of transactions
class BalanceCalculator
  include BalanceCalculatorErrorHelper
  include BalanceCalculatorTransactionHelper
end
