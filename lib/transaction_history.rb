class TransactionHistory
  attr_reader :transactions
  def initialize
    @transactions = []
  end

  def store_transaction(transaction)
    @transactions << transaction
  end 
end
