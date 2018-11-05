# frozen_string_literal: true

require 'interface'

RSpec.describe do
  describe 'the bank account app' do
    it 'includes all the functionality described in the spec' do
      account = Interface.new
      account.transaction('10/01/2012', 1000.00, 'deposit')
      account.transaction('13/01/2012', 2000.00, 'deposit')
      account.transaction('14/01/2012', 500.00, 'withdraw')
      statement =
        "date || credit || debit || balance\n"\
        "14/01/2012 || || 500.00 || 2500.00\n"\
        "13/01/2012 || 2000.00 || || 3000.00\n"\
        "10/01/2012 || 1000.00 || || 1000.00\n"
      expect { account.display_statement }.to output(statement).to_stdout
    end
  end
end
