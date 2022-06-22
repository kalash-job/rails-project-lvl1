# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Submit
      DEFAULT_NAME = 'commit'
      DEFAULT_VALUE = 'Save'

      def self.get_input(input_name, _input_value, options = {})
        input_options = {
          name: DEFAULT_NAME,
          type: input_name.to_s,
          value: DEFAULT_VALUE
        }
        Tag.build('input', input_options.merge(options))
      end
    end
  end
end
