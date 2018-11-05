# frozen_string_literal: true

require_relative 'helpers/balance_calculator/errors'
require_relative 'helpers/balance_calculator/transactions'

# Class calculates and appends the balances to a list of transactions
class BalanceCalculator
  include Helpers::BalanceCalculator
end
