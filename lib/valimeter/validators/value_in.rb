# frozen_string_literal: true

require 'active_support/core_ext/array/conversions'
require 'byebug'

module Valimeter
  module Validators
    class ValueIn < Base
      def perform_validation
        check_value_type!

        @value.include?(@passed_value)
      end

      def error_message
        "Unknown value: :#{@passed_value} for key :#{@field}. Valid values are: #{values}"
      end

      private

      def values
        @value.to_sentence(last_word_connector: ' or ')
      end

      def check_value_type!
        return if @value.is_a?(Array)

        raise ::Valimeter::Error, 'values_in value should be an Array'
      end
    end
  end
end
