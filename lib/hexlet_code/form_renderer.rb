# frozen_string_literal: true

module HexletCode
  class FormRenderer
    attr_reader :model, :form_content

    def self.render(form_options, form_inner_content)
      options = {
        action: form_options.fetch(:url, '#'),
        method: form_options.fetch(:method, 'post')
      }.merge(form_options.except(:url, :method))
      Tag.build(:form, options) { get_form_content(form_inner_content).join }
    end

    private_class_method def self.get_form_content(form_inner_content)
      form_inner_content.each_with_object([]) do |tag, content|
        type = "InputTypes::#{tag[:options].fetch(:as, :string).capitalize}"
        tag_options = tag[:options].except(:as)
        input_value = tag[:input_value]
        content << HexletCode.const_get(type).render(tag[:input_name], input_value, tag_options)
      end
    end
  end
end
