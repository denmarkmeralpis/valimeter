# frozen_string_literal: true

require 'active_support/core_ext/class/attribute'

module Valimeter
  module Valimator
    class << self
      def included(base)
        base.extend(ClassMethod)
        base.class_eval do
          class_attribute :valimators, default: []
        end
      end
    end

    module ClassMethod
      def valimates(*fields, **valimators)
        fields.each do |field|
          valimators.each do |valimator, value|
            self.valimators << build_valimator(field, valimator, value)
          end
        end
      end

      def build_valimator(field, valimator, value)
        {
          field: field,
          name: valimator,
          value: value
        }
      end

      def inherited(subclass)
        subclass.valimators = self.valimators.clone || []
      end
    end
  end
end