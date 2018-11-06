# frozen_string_literal: true

require 'interface'

RSpec.describe Interface do
  let(:mock_ledger) do
    double :mock_ledger, store_transaction: nil,
                         transaction_history:
                         ['01/01/1994', 100.0, 'deposit', 100.0]
  end
  let(:mock_printer) { double :mock_printer, display_statement: nil }

  subject do
    described_class.new(ledger: mock_ledger, printer: mock_printer)
  end

  describe '#transaction' do
    it 'instructs the TransactionHistory to store a transaction' do
      subject.transaction('01/01/1994', 100.0, 'deposit')
      data = ['01/01/1994', 100.0, 'deposit']
      expect(mock_ledger).to have_received(:store_transaction).with(data)
    end
  end

  describe '#display_statement' do
    it 'asks the TransactionHistory for the previous transactions' do
      subject.display_statement
      expect(mock_ledger).to have_received(:transaction_history)
    end
    it 'instructs the printer to display a statement' do
      subject.display_statement
      data = ['01/01/1994', 100.0, 'deposit', 100.0]
      expect(mock_printer).to have_received(:display_statement).with(data)
    end
  end
end
