require 'spec_helper'

module Valimeter
  RSpec.describe Base do
    describe '#call' do
      let(:klass) do
        Class.new(described_class) do
          valimates :name, presence: true
          valimates :price, datatype: Float
        end
      end

      context 'when valid' do
        let(:validator) { klass.new(name: 'Coca-Cola', price: 90.51) }

        it 'returns true' do
          expect(validator.call).to be_truthy
        end
      end

      context 'when invalid' do
        let(:validator) { klass.new(name: 'Coca-Cola', price: 'Not-a-Float') }

        it 'returns false' do
          expect(validator.call).to be_falsey
        end
      end

      context 'when unknown valimator' do
        let(:klass) do
          Class.new(described_class) do
            valimates :name, unknown: 'raise-exception'
          end
        end

        it 'raises an exception' do
          expect { klass.new(name: 'Coca-Cola').call }.to raise_error(Valimeter::Error)
        end
      end
    end
  end
end