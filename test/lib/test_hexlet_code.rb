# frozen_string_literal: true

require_relative "./../test_helper"

class TestHexletCode < Minitest::Test
  FIXTURES_FILES_PATH = "/../fixtures/files/"
  User = Struct.new(:name, :job, :gender, keyword_init: true)
  def setup
    @user = User.new name: "rob", job: "hexlet", gender: "m"
    @fixtures_file_path = "#{File.dirname(__FILE__)}#{FIXTURES_FILES_PATH}"
  end

  def test_form_for_without_url
    expected = File.read("#{@fixtures_file_path}form_for_without_url.html")
    form = HexletCode.form_for @user
    assert { form == expected }
  end

  def test_form_for_with_url
    expected = File.read("#{@fixtures_file_path}form_for_with_url.html")
    form = HexletCode.form_for @user, url: "/users"
    assert { form == expected }
  end
end
