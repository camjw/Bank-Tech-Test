# frozen_string_literal: true

require_relative 'ledger'
require_relative 'printer'
require_relative 'helpers/interface'

# Interface class to interact with user
class Interface
  include Helpers::Interface

  def initialize(ledger: Ledger.new, printer: Printer.new)
    @ledger = ledger
    @printer = printer
  end

  def transaction(date, amount, type)
    check_validity(date, amount, type)
    @ledger.store_transaction([date, amount, type])
  end

  def display_statement
    transactions = @ledger.transaction_history
    print transactions
    @printer.display_statement(transactions)
  end
end
