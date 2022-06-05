# frozen_string_literal: true

module HexletCode
  module InputTypes
    class TypeText
      DEFAULT_OPTIONS = %w[name type value].freeze

      def self.get_input(input_name, model, options = {})
        input_options = {}
        input_options[:name] = input_name
        input_options[:type] = "text"
        input_options[:value] = model.public_send(input_name).nil? ? "" : model.public_send(input_name)
        options.each { |key, value| input_options[key] = value unless DEFAULT_OPTIONS.include?(key) }
        Tag.build("input", input_options)
      end
    end
  end
end
