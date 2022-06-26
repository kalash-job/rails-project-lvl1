# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Text < Input
      DEFAULT_COLS_VALUE = '20'
      DEFAULT_ROWS_VALUE = '40'

      def self.render_input(input_name, input_value, options = {})
        input_options = {
          cols: DEFAULT_COLS_VALUE,
          rows: DEFAULT_ROWS_VALUE,
          name: input_name,
          id: input_name
        }
        Tag.build('textarea', input_options.merge(options)) { input_value }
      end
    end
  end
end
