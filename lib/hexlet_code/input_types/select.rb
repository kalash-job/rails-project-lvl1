# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Select
      DEFAULT_OPTIONS = %i[name as options selected id].freeze

      def self.get_input(input_name, model, options = {})
        input_options = {}
        input_options[:name] = input_name
        input_options[:id] = options.key?(:id) ? options.fetch(:id) : input_name
        selected_option = model.public_send(input_name).nil? ? [] : model.public_send(input_name)
        select_options = []
        options.each do |key, value|
          input_options[key] = value unless DEFAULT_OPTIONS.include?(key)
          select_options = get_select_options(value, selected_option) if key == :options
        end
        Tag.build("select", input_options) { select_options }
      end

      private_class_method def self.get_select_options(options, selected_option)
        options_tags = []
        options.each do |option|
          options_attributes = {}
          options_value, options_body = option.is_a?(Array) ? option : [option, option]
          options_attributes[:selected] = true if selected_option.include?(options_value)
          options_attributes[:value] = options_value
          options_tags << Tag.build("option", options_attributes) { options_body }
        end
        options_tags
      end
    end
  end
end
