# frozen_string_literal: true

# Class to print the bank statements to the console
class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  def display_statement(transactions)
    sort_by_date(transactions)
  end

  private

  def sort_by_date(transactions)
    transactions.sort { |transaction| transaction[0] }
  end
end
