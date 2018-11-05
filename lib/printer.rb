# frozen_string_literal: true

require_relative 'balance_calculator'

# Class to print the bank statements to the console
class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def initialize(calculator: BalanceCalculator.new)
    @calculator = calculator
  end

  def display_statement(transactions)
    puts STATEMENT_HEADER
    puts parse_transactions(transactions)
  end

  private

  def sort_by_date(transactions)
    transactions.sort! { |first, second| second[0] <=> first[0] }
  end

  def prettify_transaction(trans)
    middle_cols = ['', format('%.2f', trans[1]) + ' ']
    middle_cols.reverse! if trans[2] == 'deposit'
    output_row = [trans[0] + ' '] + middle_cols + [format('%.2f', trans[3])]
    output_row.join('|| ')
  end

  def prettify_all_transactions(transactions)
    transactions.map { |transaction| prettify_transaction(transaction) }
  end

  def parse_transactions(transactions)
    sort_by_date(transactions)
    @calculator.append_balances(transactions)
    prettify_all_transactions(transactions)
  end
end
