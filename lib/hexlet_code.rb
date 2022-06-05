# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end
  autoload(:HexletCode, "hexlet_code/version.rb")
  autoload(:FormContent, "hexlet_code/form_content.rb")
  autoload(:Tag, "hexlet_code/tag.rb")

  def self.form_for(form_model, options = {})
    form_options = {}
    form_options[:action] = options.fetch(:url, "#")
    form_options[:method] = "post"
    model = FormContent.new(form_model)
    block_given? ? yield(model) : ""
    form_inner_content = model.form_content.join
    Tag.build("form", form_options) { form_inner_content }
  end
end
