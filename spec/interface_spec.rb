# frozen_string_literal: true

require 'interface'

RSpec.describe Interface do
  let(:mock_transaction) { double :mock_transaction, store_transaction: nil }
  subject { described_class.new(history: mock_transaction) }

  describe '#deposit' do
    it 'instructs the TransactionHistory to store a deposit' do
      subject.deposit('01/01/1994', 100.0)
      data = ['01/01/1994', 100.0, 'deposit']
      expect(mock_transaction).to have_received(:store_transaction).with(data)
    end
  end

  describe '#withdrawal' do
    it 'instructs the TransactionHistory to store a withdrawal' do
      subject.withdrawal('01/01/1994', 100.0)
      data = ['01/01/1994', 100.0, 'withdrawal']
      expect(mock_transaction).to have_received(:store_transaction).with(data)
    end
  end
end
