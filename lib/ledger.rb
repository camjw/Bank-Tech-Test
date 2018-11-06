# frozen_string_literal: true

# A class to store all transactions made by the account
class Ledger
  def initialize
    @transactions = []
  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def transaction_history
    add_balances(sort_by_date(@transactions))
  end

  private
  
  def add_balances(transactions)
    balance = 0
    transactions.reverse_each do |tran|
      balance += tran[1] * (tran[2] == 'deposit' ? 1 : -1)
      tran << balance
    end
  end

  def sort_by_date(transactions)
    transactions.sort! { |first, second| second[0] <=> first[0] }
  end
end
