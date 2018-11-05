# frozen_string_literal: true

require 'interface'

RSpec.describe Interface do
  let(:mock_history) do
    double :mock_history, store_transaction: nil,
                          transactions: ['01/01/1994', 100.0, 'deposit']
  end
  let(:mock_printer) { double :mock_printer, display_statement: nil }

  subject do
    described_class.new(history: mock_history, printer: mock_printer)
  end

  describe '#transaction' do
    it 'instructs the TransactionHistory to store a transaction' do
      subject.transaction('01/01/1994', 100.0, 'deposit')
      data = ['01/01/1994', 100.0, 'deposit']
      expect(mock_history).to have_received(:store_transaction).with(data)
    end
    context 'when called with an incorrect date' do
      it 'raises a date error' do
        expect { subject.transaction('error', 100.0, 'deposit') }.to(
          raise_error 'This method can only take strings of the form '\
          " 'dd/mm/yyyy' as a first parameter"
        )
      end
    end
    context 'when called with an incorrect amount' do
      it 'raises an amount error' do
        expect { subject.transaction('01/01/1994', 'error', 'deposit') }.to(
          raise_error 'This method can only take numbers with two decimal '\
            'places as a first parameter'
        )
      end
    end
    context 'when called with an incorrect transaction type' do
      it 'raises a transaction type error' do
        expect { subject.transaction('01/01/1994', 100.0, 'error') }.to(
          raise_error "This method can only take 'deposit' and 'withdrawal' as"\
          ' a third parameter'
        )
      end
    end
  end

  describe '#display_statement' do
    it 'asks the TransactionHistory for the previous transactions' do
      subject.display_statement
      expect(mock_history).to have_received(:transactions)
    end
    it 'instructs the printer to display a statement' do
      subject.display_statement
      data = ['01/01/1994', 100.0, 'deposit']
      expect(mock_printer).to have_received(:display_statement).with(data)
    end
  end
end
