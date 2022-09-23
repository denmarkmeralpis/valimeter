# frozen_string_literal: true

module Valimeter
  module Validators
    class Presence < Base
      def perform_validation
        !@value || @params.include?(@field)
      end

      def error_message
        "The key: :#{@field} is missing."
      end
    end
  end
end