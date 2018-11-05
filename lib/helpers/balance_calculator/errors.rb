# frozen_string_literal: true

# Error handling helpers for the BalanceCalculator class
module Helpers
  module BalanceCalculator
    module Errors
      UNORDERED_LIST_ERROR = 'Transactions can only have balances appended when '\
        'they are in reverse chronological order'

      def valid_transactions?(transactions)
        raise UNORDERED_LIST_ERROR unless transactions_ordered?(transactions)
      end

      private

      def transactions_ordered?(transactions)
        transactions.each_cons(2).all? { |first, second| first[0] >= second[0] }
      end
    end
  end
end 
