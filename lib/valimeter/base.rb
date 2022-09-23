# frozen_string_literal: true

require_relative 'valimator'
require_relative 'validator'

module Valimeter
  class Base
    include Valimeter::Valimator
    include Valimeter::Validator

    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      before_validation
      perform_validation
      all_valid?
    end

    def errors
      @errors ||= Array.new
    end

    def all_valid?
      errors.count.zero?
    end

    # add before validation callback
    def before_validation; end

    def perform_validation
      valimators.each do |valimator|
        if validator = defined_validators[valimator[:name]]
          perform_validator(valimator, validator)
        else
          raise ::Valimeter::Error, "Invalid valimator '#{valimator[:name]}'"
        end
      end
    end

    class << self
      def call(params)
        new(params).call
      end
    end

    private

    def perform_validator(valimator, validator)
      validator_class = Kernel.const_get(validator).new(@params, valimator)

      if validator_class.call
        true
      else
        errors << validator_class.error_message
        false
      end
    end
  end
end