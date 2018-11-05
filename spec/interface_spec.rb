# frozen_string_literal: true

require 'interface'

RSpec.describe Interface do
  let(:mock_history) do double :mock_history, store_transaction: nil,
    transactions: ['01/01/1994', 100.0, 'deposit']
  end
  let(:mock_printer) { double :mock_printer, display_statement: nil }

  subject do
    described_class.new(history: mock_history, printer: mock_printer)
  end

  describe '#transaction' do
    context 'when called with deposit' do
      it 'instructs the TransactionHistory to store a deposit' do
        subject.transaction('01/01/1994', 100.0, 'deposit')
        data = ['01/01/1994', 100.0, 'deposit']
        expect(mock_history).to have_received(:store_transaction).with(data)
      end
    end
    context 'when called with withdrawal' do
      it 'instructs the TransactionHistory to store a withdrawal' do
        subject.transaction('01/01/1994', 100.0, 'withdrawal')
        data = ['01/01/1994', 100.0, 'withdrawal']
        expect(mock_history).to have_received(:store_transaction).with(data)
      end
    end
    context 'when called with a different string' do
      it 'raises an error' do
        expect { subject.transaction('01/01/1994', 100.0, 'error') }.to(
          raise_error "This method can only take 'deposit' and 'withdrawal' as"\
          ' third parameters'
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
