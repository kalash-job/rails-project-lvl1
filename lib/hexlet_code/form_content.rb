# frozen_string_literal: true

module HexletCode
  class FormContent
    DEFAULT_NAME = 'commit'
    DEFAULT_VALUE = 'Save'
    attr_reader :model, :form_content

    def initialize(form_model)
      @model = form_model
      @form_content = []
    end

    def input(input_name, options = {})
      @form_content << InputTypes::Label.get_input(input_name, options)
      type = "InputTypes::#{options.fetch(:as, :string).capitalize}"
      @form_content << HexletCode.const_get(type).get_input(input_name, @model, options)
    end

    def submit(value = DEFAULT_VALUE, options = {})
      options[:value] = value
      @form_content << InputTypes::Submit.get_input(options)
    end
  end
end
