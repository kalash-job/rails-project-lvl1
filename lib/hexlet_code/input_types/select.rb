# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Select
      def self.get_input(input_name, input_value, options = {})
        input_options = {
          name: input_name,
          id: input_name
        }
        select_options = options.key?(:options) ? get_select_options(options.fetch(:options), input_value) : []
        Tag.build('select', input_options.merge(options.except(:options))) { select_options.join }
      end

      private_class_method def self.get_select_options(options, selected_options)
        options.each_with_object([]) do |option, options_tags|
          options_value, options_body = option.is_a?(Array) ? option : [option, option]
          options_attributes = selected_options.include?(options_value) ? { selected: true } : {}
          options_attributes[:value] = options_value
          options_tags << Tag.build('option', options_attributes) { options_body }
        end
      end
    end
  end
end
