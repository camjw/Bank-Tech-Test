# frozen_string_literal: true

# Class to print the bank statements to the console
class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def display_statement(transactions)
    puts STATEMENT_HEADER
    puts prettify_all_transactions(transactions)
  end

  private

  def prettify_transaction(transaction)
    return prettify_deposit(transaction) if transaction[2] == 'deposit'
    prettify_withdrawal(transaction)
  end

  def prettify_deposit(transaction)
    "#{transaction[0]} || #{format("%.2f",transaction[1])} || ||"\
      " #{format("%.2f",transaction[3])}"
  end

  def prettify_withdrawal(transaction)
    "#{transaction[0]} || || #{format("%.2f",transaction[1])} ||"\
      " #{format("%.2f",transaction[3])}"
  end

  def prettify_all_transactions(transactions)
    transactions.map { |transaction| prettify_transaction(transaction) }
  end
end
