# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Label
      def self.get_input(input_name, options = {})
        input_options = { for: options.fetch(:id, input_name) }
        Tag.build('label', input_options) { input_name.capitalize }
      end
    end
  end
end
