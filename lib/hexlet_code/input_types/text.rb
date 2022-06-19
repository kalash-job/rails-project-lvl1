# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Text
      DEFAULT_COLS_VALUE = '20'
      DEFAULT_ROWS_VALUE = '40'

      def self.get_input(input_name, model, options = {})
        input_options = {
          cols: DEFAULT_COLS_VALUE,
          rows: DEFAULT_ROWS_VALUE,
          name: input_name,
          id: input_name
        }
        textarea_value = model.public_send(input_name)
        Tag.build('textarea', input_options.merge(options)) { textarea_value }
      end
    end
  end
end
