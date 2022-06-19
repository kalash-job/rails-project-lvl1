# frozen_string_literal: true

module HexletCode
  class FormRenderer
    attr_reader :model, :form_content

    def self.render(form_options, form_inner_content, model)
      options = {
        action: form_options.fetch(:url, '#'),
        method: form_options.fetch(:method, 'post')
      }
      Tag.build(:form, options) { get_form_content(form_inner_content, model).join }
    end

    private_class_method def self.get_form_content(form_inner_content, model)
      form_inner_content.each_with_object([]) do |tag, content|
        type = "InputTypes::#{tag[:options].fetch(:as, :string).capitalize}"
        tag_options = tag[:options].except(:as)
        content << InputTypes::Label.get_input(tag[:input_name], tag_options) unless tag[:input_name].equal?(:submit)
        content << HexletCode.const_get(type).get_input(tag[:input_name], model, tag_options)
      end
    end
  end
end
