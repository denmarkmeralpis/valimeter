# frozen_string_literal: true

module Valimeter
  module Validators
    class Datatype < Base
      def perform_validation
        @params[@field].is_a?(@value)
      end

      def error_message
        "Invalid datatype value for key: :#{@field}"
      end
    end
  end
end