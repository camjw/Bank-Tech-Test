# frozen_string_literal: true

# Error handling helpers for the BalanceCalculator class
module BalanceCalculatorErrorHelper
  UNORDERED_LIST_ERROR = 'Transactions can only have balances appended when '\
    'they are in reverse chronological order'

  private

  def transactions_ordered?(transactions)
    transactions.each_cons(2).all? { |first, second| first[0] >= second[0] }
  end
end
