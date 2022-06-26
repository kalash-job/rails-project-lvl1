# frozen_string_literal: true

module HexletCode
  module InputTypes
    class String < Input
      def self.render_input(input_name, input_value, options = {})
        input_options = {
          name: input_name,
          id: input_name,
          type: 'text',
          value: input_value
        }
        Tag.build('input', input_options.merge(options))
      end
    end
  end
end
