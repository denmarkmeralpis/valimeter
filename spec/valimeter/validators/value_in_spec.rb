require 'spec_helper'

module Valimeter
  module Validators
    RSpec.describe ValueIn do
      context 'when :value includes :passed_value' do
        let(:klass) do
          Class.new(Valimeter::Base) do
            valimates :status, value_in: ['active', 'voided', 'inactive']
          end
        end

        it 'returns true' do
          expect(klass.new(status: 'voided').call).to be_truthy
        end
      end

      context 'when :value does not contain :passed_value' do
        let(:klass) do
          Class.new(Valimeter::Base) do
            valimates :status, value_in: ['active', 'voided', 'inactive']
          end
        end

        it 'returns false' do
          expect(klass.new(status: 'deleted').call).to be_falsey
        end
      end

      context 'when :value_in is not an Array' do
        let(:klass) do
          Class.new(Valimeter::Base) do
            valimates :status, value_in: 'this-should-be-an-array'
          end
        end

        it 'raises an exception' do
          expect { klass.new(status: 'hello').call }.to raise_error(Valimeter::Error)
        end
      end
    end
  end
end
