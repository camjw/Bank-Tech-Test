# frozen_string_literal: true
require_relative 'helpers/ledger'

# A class to store all transactions made by the account
class Ledger
  include Helpers::Ledger

  def initialize
    @transactions = []
  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def transaction_history
    add_balances(sort_by_date(@transactions))
  end
end
