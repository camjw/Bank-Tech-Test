# frozen_string_literal: true

# Class calculates and appends the balances to a list of transactions
class BalanceCalculator
  UNORDERED_LIST_ERROR = 'Transactions can only have balances appended when '\
    'they are in reverse chronological order'

  def append_balances(transactions)
    raise UNORDERED_LIST_ERROR unless transactions_ordered?(transactions)

    update_transactions(transactions)
  end

  private

  def update_transactions(transactions)
    balance = 0
    transactions.reverse_each do |tran|
      tran[2] == 'deposit' ? balance += tran[1] : balance -= tran[1]
      tran << balance
    end
  end

  def transactions_ordered?(transactions)
    transactions.each_cons(2).all? { |first, second| first[0] >= second[0] }
  end
end
