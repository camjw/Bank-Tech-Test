# frozen_string_literal: true

# A class to store all transactions made by the account
class TransactionHistory
  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def store_transaction(transaction)
    @transactions << transaction
  end
end
