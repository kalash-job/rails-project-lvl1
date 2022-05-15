# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end
  autoload(:HexletCode, "./hexlet_code/version.rb")

  def self.form_for(_user, options = {}, &_block)
    url = options.fetch(:url, "#")
    "<form action=\"#{url}\" method=\"post\">\n</form>"
  end
end
