# frozen_string_literal: true

require_relative 'transaction_history'

# Interface class to interact with user
class Interface
  def initialize(history: TransactionHistory.new)
    @history = history
  end

  def transaction(date, amount, type)
  end

  private

  def valid_transaction_type?(type)
    ['deposit', 'withdrawal'].include?(type)
  end 
end
