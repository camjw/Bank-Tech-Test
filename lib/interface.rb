# frozen_string_literal: true

require_relative 'transaction_history'

# Interface class to interact with user
class Interface
  INVALID_TYPE_ERROR = "This method can only take 'deposit' and 'withdrawal'"\
    ' as third parameters'

  def initialize(history: TransactionHistory.new)
    @history = history
  end

  def transaction(date, amount, type)
    check_for_valid_type(type)
    @history.store_transaction([date, amount, type])
  end

  private

  def valid_transaction_type?(type)
    %w[deposit withdrawal].include?(type)
  end

  def check_for_valid_type(type)
    raise INVALID_TYPE_ERROR unless valid_transaction_type?(type)
  end
end
