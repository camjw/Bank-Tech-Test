require 'interface'

RSpec.describe Interface do
  let(:mock_transaction) { double(:mock_transaction) }
  let(subject) { described_class.new(history: mock_transaction) }

  before(:all) do
    allow(:mock_transaction).to receive(:store_transaction)
  end
  
  describe '#deposit' do
    it 'instructs the TransactionHistory to store a deposit' do
      subject.deposit('01/01/1994', 100.0)
      data = ['01/01/1994', 'deposit', 100.0]
      expect(mock_transaction).to have_received(:store_transaction).with(data)
    end
  end
end
