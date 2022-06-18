# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'minitest-power_assert'

FIXTURES_FILES_PATH = '/fixtures/files/'

def get_fixture(file_name)
  fixtures_file_path = "#{File.dirname(__FILE__)}#{FIXTURES_FILES_PATH}"
  File.read("#{fixtures_file_path}#{file_name}")
end
