# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  def self.form_for(user, options = {}, &block)
    url = options.fetch(:url, "#")
    "<form action=\"#{url}\" method=\"post\">\n</form>"
  end
end
