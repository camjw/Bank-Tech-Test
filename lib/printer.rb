# frozen_string_literal: true

require_relative 'balance_calculator'
require_relative 'helpers/printer/outputs'

# Class to print the bank statements to the console
class Printer
  include Helpers::Printer

  def display_statement(transactions)
    puts STATEMENT_HEADER
    puts parse_transactions(transactions)
  end

  def initialize(calculator: BalanceCalculator.new)
    @calculator = calculator
  end

  private

  def parse_transactions(transactions)
    sort_by_date(transactions)
    @calculator.append_balances(transactions)
    prettify_all_transactions(transactions)
  end
end
