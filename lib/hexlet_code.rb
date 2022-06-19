# frozen_string_literal: true

module HexletCode
  autoload(:HexletCode, 'hexlet_code/version.rb')
  autoload(:FormContent, 'hexlet_code/form_content.rb')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:FormRenderer, 'hexlet_code/form_renderer.rb')
  autoload(:InputTypes, 'hexlet_code/input_types.rb')

  def self.form_for(form_model, options = {})
    model = FormContent.new(form_model)
    yield(model) if block_given?
    form_inner_content = model.form_content
    FormRenderer.render(options, form_inner_content, model.model)
  end
end
