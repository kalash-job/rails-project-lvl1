# frozen_string_literal: true

module HexletCode
  class Tag
    def build(tag_name, options = {})
      tag_opening = "<#{tag_name}"
      tag_closing = ">"
      return "#{tag_opening}#{tag_closing}" if options.empty?

      result_options = []
      options.each_pair { |key, value| result_options << "#{key}=\"#{value}\"" }
      options_line = result_options.join(" ")
      "#{tag_opening} #{options_line}#{tag_closing}"
    end
  end
end
