# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'printer'
require_relative 'helpers/interface_error_helpers'

# Interface class to interact with user
class Interface
  include InterfaceErrorHelpers

  def initialize(history: TransactionHistory.new, printer: Printer.new)
    @history = history
    @printer = printer
  end

  def transaction(date, amount, type)
    check_validity(date, amount, type)
    @history.store_transaction([date, amount, type])
  end

  def display_statement
    transactions = @history.transactions
    @printer.display_statement(transactions)
  end
end
