# frozen_string_literal: true

# Class to print the bank statements to the console
class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"
  def display_statement(transactions)
    parsed_transactions = parse_transactions(transactions)
  end

  private

  def sort_by_date(transactions)
    transactions.sort! { |first, second| second[0] <=> first[0] }
  end

  def parse_transactions(transactions)
    sort_by_date(transactions)
    calculate_balance(transactions)
  end
end
