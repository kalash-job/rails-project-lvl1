# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Submit < Input
      DEFAULT_NAME = 'commit'
      DEFAULT_VALUE = 'Save'

      def self.render_input(input_name, _input_value, options = {})
        input_options = {
          name: DEFAULT_NAME,
          type: input_name.to_s,
          value: DEFAULT_VALUE
        }
        Tag.build('input', input_options.merge(options))
      end

      def self.render(input_name, input_value, options = {})
        render_input(input_name, input_value, options)
      end
    end
  end
end
