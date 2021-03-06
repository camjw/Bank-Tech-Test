# frozen_string_literal: true

require 'printer'

RSpec.describe Printer do
  describe '#display_statement' do
    it 'takes an array of transactions and puts the bank statement to stdout' do
      transactions = [
        ['03/01/1994', 300.0, 'deposit', 250.0],
        ['02/01/1994', 150.0, 'withdrawal', -50.0],
        ['01/01/1994', 100.0, 'deposit', 100.0]
      ]
      expected_statement = "date || credit || debit || balance\n"\
        "03/01/1994 || 300.00 || || 250.00\n"\
        "02/01/1994 || || 150.00 || -50.00\n"\
        "01/01/1994 || 100.00 || || 100.00\n"
      expect { subject.display_statement(transactions) }.to output(
        expected_statement
      ).to_stdout
    end
  end
end
