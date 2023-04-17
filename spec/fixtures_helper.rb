# frozen_string_literal: true

module FixturesHelper
  FIXTURES_FILES_PATH = '/fixtures/files/'

  def get_fixture(file_name)
    fixtures_file_path = "#{File.dirname(__FILE__)}#{FIXTURES_FILES_PATH}"
    File.read("#{fixtures_file_path}#{file_name}")
  end
end
