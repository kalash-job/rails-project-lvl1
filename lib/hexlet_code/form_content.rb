# frozen_string_literal: true

module HexletCode
  class FormContent
    autoload(:InputTypes, "hexlet_code/input_types.rb")
    attr_reader :model, :form_content

    def initialize(form_model)
      @model = form_model
      @form_content = []
    end

    def input(input_name, options = {})
      @form_content << InputTypes::Label.get_input(input_name, options)
      return @form_content << InputTypes::TypeText.get_input(input_name, @model, options) unless options.key?(:as)

      type = "InputTypes::#{options.fetch(:as).capitalize}"
      @form_content << HexletCode.const_get(type).get_input(input_name, @model, options)
    end

    def submit(options = {})
      @form_content << InputTypes::Submit.get_input(options)
    end
  end
end
