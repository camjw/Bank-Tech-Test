# frozen_string_literal: true

# Helper methods to help display the statements
module PrinterOutputHelper
  STATEMENT_HEADER = "date || credit || debit || balance\n"

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
end
