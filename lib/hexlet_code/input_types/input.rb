# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Input
      def self.render(input_name, input_value, options = {})
        input = []
        input << render_label(input_name, options)
        input << render_input(input_name, input_value, options)
        input.join
      end

      def self.render_label(input_name, options = {})
        input_options = { for: options.fetch(:id, input_name) }
        Tag.build('label', input_options) { input_name.capitalize }
      end

      def self.render_input(input_name, input_value, options = {})
        raise NotImplementedError
      end
    end
  end
end
