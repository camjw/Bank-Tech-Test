# frozen_string_literal: true
require_relative 'balance_calculator'

# Class to print the bank statements to the console
class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize(calculator: BalanceCalculator.new)
    @calculator = calculator
  end

  def display_statement(transactions)
    print parse_transactions(transactions)
  end

  private

  def sort_by_date(transactions)
    transactions.sort! { |first, second| second[0] <=> first[0] }
  end

  def prettify_transaction(transaction)
    middle_section = ['', transaction[1]]
    middle_section.reverse! if transaction[2] == 'credit'
    return (transaction[0] + middle_section + transaction[3]).join(' ||')
  end

  def prettify_all_transactions(transactions)
    transactions.each do |transaction|
      transaction = prettify_transaction(transaction)
    end
  end

  def parse_transactions(transactions)
    sort_by_date(transactions)
    @calculator.append_balances(transactions)
    prettify_all_transactions(transactions)
  end
end
