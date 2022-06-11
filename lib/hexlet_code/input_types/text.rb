# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Text
      DEFAULT_OPTIONS = %i[cols rows name as id].freeze
      DEFAULT_COLS_VALUE = "20"
      DEFAULT_ROWS_VALUE = "40"

      def self.get_input(input_name, model, options = {})
        input_options = {
          cols: options.fetch(:cols, DEFAULT_COLS_VALUE),
          rows: options.fetch(:rows, DEFAULT_ROWS_VALUE),
          name: input_name,
          id: options.key?(:id) ? options.fetch(:id) : input_name
        }
        options.each { |key, value| input_options[key] = value unless DEFAULT_OPTIONS.include?(key) }
        textarea_value = model.public_send(input_name).nil? ? "" : model.public_send(input_name)
        Tag.build("textarea", input_options) { textarea_value }
      end
    end
  end
end
