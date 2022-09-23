# frozen_string_literal: true

require_relative 'validators/datatype'
require_relative 'validators/presence'
require_relative 'validators/value_in'

module Valimeter
  module Validator
    class << self
      def included(base)
        base.extend(ClassMethod)
        base.class_eval do
          class_attribute :defined_validators, default: {}
          load_default_validators
        end
      end
    end

    module ClassMethod
      def load_default_validators
        self.defined_validators = {
          datatype: 'Valimeter::Validators::Datatype',
          presence: 'Valimeter::Validators::Presence',
          value_in: 'Valimeter::Validators::ValueIn'
        }
      end
    end
  end
end
