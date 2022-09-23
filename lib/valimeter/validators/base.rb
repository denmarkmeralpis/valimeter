# frozen_string_literal: true

module Valimeter
  module Validators
    class Base
      class << self
        def call(params, options)
          new(params, options)
        end
      end

      def initialize(params, options)
        @params = params
        @field = options.fetch(:field)
        @name = options.fetch(:name)
        @value = options.fetch(:value)
        @passed_value = @params[@field]
      end

      def call
        perform_validation
      end
    end
  end
end