require_relative 'transaction_history'

# Interface class to interact with user
class Interface
  def initialize(history: TransactionHistory.new)
    @history = history
  end

  def deposit(date, amount)
    @history.store_transaction([date, amount, 'deposit'])
  end
end
