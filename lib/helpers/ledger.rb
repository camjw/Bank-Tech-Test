# frozen_string_literal: true

# Helper methods to append blanace to transactions
module Helpers
  module Ledger
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
end
