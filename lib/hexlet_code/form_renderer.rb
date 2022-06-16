# frozen_string_literal: true

module HexletCode
  class FormRenderer
    UNPAIR_TAGS = %w[br hr img input keygen wbr].freeze
    ATTRIBUTES_WITHOUT_VALUES = %i[selected disabled multiple readonly required].freeze
    attr_reader :model, :form_content

    def self.render(tag)
      options_line = tag.key?(:options) ? render_options(tag[:options]) : ""
      tag_opening = "<#{tag[:name]}#{options_line}>"
      return tag_opening if UNPAIR_TAGS.include?(tag[:name])

      tag_closing = "</#{tag[:name]}>"
      tag_body = render_tag_body(tag[:tag_body])
      "#{tag_opening}#{tag_body}#{tag_closing}"
    end

    private_class_method def self.render_options(options)
      result_options = []
      options.each_pair do |key, value|
        result_options << (ATTRIBUTES_WITHOUT_VALUES.include?(key) ? key : "#{key}=\"#{value}\"")
      end
      result_options.empty? ? "" : " #{result_options.join(" ")}"
    end

    private_class_method def self.render_tag_body(tag_body)
      return tag_body unless tag_body.is_a?(Array)

      tag_body.map { |tag| render(tag) }.join
    end
  end
end
