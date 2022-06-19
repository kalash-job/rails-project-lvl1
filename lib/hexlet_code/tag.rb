# frozen_string_literal: true

module HexletCode
  class Tag
    UNPAIR_TAGS = %w[br hr img input keygen wbr].freeze
    ATTRIBUTES_WITHOUT_VALUES = %i[selected disabled multiple readonly required].freeze

    def self.build(tag_name, options = {})
      options_line = get_options(options)
      tag_opening = "<#{tag_name}#{options_line}>"
      return tag_opening if UNPAIR_TAGS.include?(tag_name)

      tag_closing = "</#{tag_name}>"
      tag_body = block_given? ? yield : ''
      "#{tag_opening}#{tag_body}#{tag_closing}"
    end

    private_class_method def self.get_options(options)
      result_options = []
      options.each_pair do |key, value|
        result_options << (ATTRIBUTES_WITHOUT_VALUES.include?(key) ? key : "#{key}=\"#{value}\"")
      end
      result_options.empty? ? '' : " #{result_options.join(' ')}"
    end
  end
end
