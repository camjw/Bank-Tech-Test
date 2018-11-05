# frozen_string_literal: true

RSpec.describe InterfaceErrorHelpers do
  subject { Helper.new }

  describe '#check_validity' do
    context 'when called with an incorrect date' do
      it 'raises a date error' do
        expect { subject.check_validity('error', 100.0, 'deposit') }.to(
          raise_error 'This method can only take strings of the form '\
          " 'dd/mm/yyyy' as a first parameter"
        )
      end
    end
    context 'when called with an incorrect amount' do
      it 'raises an amount error' do
        expect { subject.check_validity('01/01/1994', 'error', 'deposit') }.to(
          raise_error 'This method can only take numbers with two decimal '\
            'places as a first parameter'
        )
      end
    end
    context 'when called with an incorrect transaction type' do
      it 'raises a transaction type error' do
        expect { subject.check_validity('01/01/1994', 100.0, 'error') }.to(
          raise_error "This method can only take 'deposit' and 'withdrawal' as"\
          ' a third parameter'
        )
      end
    end
  end 
end
