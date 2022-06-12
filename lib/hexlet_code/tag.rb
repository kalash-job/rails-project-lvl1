# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(tag_name, options = {})
      tag = {
        name: tag_name,
        options: options
      }
      tag_body = block_given? ? yield : []
      tag[:tag_body] = tag_body.nil? ? [] : tag_body
      tag
    end
  end
end
