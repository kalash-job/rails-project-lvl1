# frozen_string_literal: true

module HexletCode
  class FormContent
    autoload(:InputTypes, "input_types.rb")
    attr_reader :model, :form_content

    def initialize(form_model)
      @model = form_model
      @form_content = []
    end

    def input(input_name, options = {})
      return @form_content << InputTypes::TypeText.get_input(input_name, @model, options) unless options.key?(:as)

      type = "InputTypes::#{options.fetch(:as).capitalize}"
      @form_content << HexletCode.const_get(type).get_input(input_name, @model, options)
    end

    def submit(input_name, options = {})
      return @form_content << InputTypes::TypeText.get_input(input_name, @model, options) unless options.key?(:as)

      type = "InputTypes::#{options.fetch(:as).capitalize}"
      @form_content << HexletCode.const_get(type).get_input(input_name, @model, options)
    end
  end
end
