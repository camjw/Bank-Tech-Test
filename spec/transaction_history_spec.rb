require 'transaction_history'

RSpec.describe TransactionHistory do
  describe '#store_transaction' do
    it 'takes a transaction and stores it in an array' do
      subject.store_transaction(['01/01/1994', 'deposit', 100.0])
      expect(subject.transactions).to eq [['01/01/1994', 'deposit', 100.0]]
    end
  end
end
