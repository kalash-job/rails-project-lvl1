# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Label
      def self.get_input(input_name, options = {})
        input_options = {}
        input_options[:for] = options.key?(:id) ? options.fetch(:id) : input_name
        value = input_name.capitalize
        Tag.build('label', input_options) { value }
      end
    end
  end
end
