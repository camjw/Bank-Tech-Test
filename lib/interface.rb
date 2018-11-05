# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'printer'

# Interface class to interact with user
class Interface
  INVALID_TYPE_ERROR = "This method can only take 'deposit' and 'withdrawal'"\
    ' as third parameters'

  def initialize(history: TransactionHistory.new, printer: Printer.new)
    @history = history
    @printer = printer
  end

  def transaction(date, amount, type)
    check_for_valid_type(type)
    @history.store_transaction([date, amount, type])
  end

  def display_statement
    transactions = @history.transactions
    @printer.display_statement(transactions)
  end

  private

  def valid_transaction_type?(type)
    %w[deposit withdrawal].include?(type)
  end

  def check_for_valid_type(type)
    raise INVALID_TYPE_ERROR unless valid_transaction_type?(type)
  end
end
