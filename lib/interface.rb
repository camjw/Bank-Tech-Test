# frozen_string_literal: true

require_relative 'transaction_history'
require_relative 'printer'

# Interface class to interact with user
class Interface
  INVALID_DATE_ERROR = 'This method can only take strings of the form '\
    " 'dd/mm/yyyy' as a first parameter"
  INVALID_AMOUNT_ERROR = 'This method can only take numbers with two decimal '\
    'places as a first parameter'
  INVALID_TYPE_ERROR = "This method can only take 'deposit' and 'withdrawal'"\
    ' as a third parameter'

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

  private

  def valid_transaction_date?(date)
    day, month, year = date.split('/')
    Date.valid_date?(year.to_i, month.to_i, day.to_i)
  end

  def valid_transaction_amount?(amount)
    amount == ((amount * 100).to_i) / 100
  end

  def valid_transaction_type?(type)
    %w[deposit withdrawal].include?(type)
  end

  def check_for_valid_date(date)
    raise INVALID_DATE_ERROR unless valid_transaction_date?(date)
  end

  def check_for_valid_amount(amount)
    raise INVALID_AMOUNT_ERROR unless valid_transaction_amount?(amount)
  end

  def check_for_valid_type(type)
    raise INVALID_TYPE_ERROR unless valid_transaction_type?(type)
  end

  def check_validity(date, amount, type)
    check_for_valid_date(date)
    check_for_valid_amount(amount)
    check_for_valid_type(type)
  end
end
