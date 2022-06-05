# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Text
      DEFAULT_OPTIONS = %i[cols rows name as].freeze

      def self.get_input(input_name, model, options = {})
        input_options = {}
        input_options[:cols] = options.fetch(:cols, "20")
        input_options[:rows] = options.fetch(:rows, "40")
        input_options[:name] = input_name
        options.each { |key, value| input_options[key] = value unless DEFAULT_OPTIONS.include?(key) }
        textarea_value = model.public_send(input_name).nil? ? "" : model.public_send(input_name)
        Tag.build("textarea", input_options) { textarea_value }
      end
    end
  end
end
