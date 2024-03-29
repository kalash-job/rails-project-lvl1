# frozen_string_literal: true

module HexletCode
  class FormContent
    attr_reader :model, :form_content

    def initialize(form_model)
      @model = form_model
      @form_content = []
    end

    def input(input_name, options = {})
      input_value = model.public_send(input_name)
      @form_content << { input_name:, options:, input_value: }
    end

    def submit(value = nil, options = {})
      submit_options = { as: :submit }
      submit_options[:value] = value unless value.nil?
      @form_content << { input_name: :submit, options: options.merge(submit_options) }
    end
  end
end
