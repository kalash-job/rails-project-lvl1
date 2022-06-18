# frozen_string_literal: true

module HexletCode
  module InputTypes
    class Submit
      DEFAULT_OPTIONS = %w[name type value].freeze
      DEFAULT_NAME = 'commit'
      DEFAULT_VALUE = 'Save'

      def self.get_input(options = {})
        input_options = {}
        input_options[:name] = options.fetch(:name, DEFAULT_NAME)
        input_options[:type] = 'submit'
        input_options[:value] = options.fetch(:value, DEFAULT_VALUE)
        options.each { |key, value| input_options[key] = value unless DEFAULT_OPTIONS.include?(key) }
        Tag.build('input', input_options)
      end
    end
  end
end
