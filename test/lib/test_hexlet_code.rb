# frozen_string_literal: true

require_relative "./../test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  def setup
    @user = User.new name: "rob"
  end

  def test_form_for
    expected = "<form action=\"#\" method=\"post\">\n</form>"
    form = HexletCode.form_for @user
    assert { form == expected }
  end

  def test_form_for_with_url
    expected = "<form action=\"/users\" method=\"post\">\n</form>"
    form = HexletCode.form_for @user, url: "/users"
    assert { form == expected }
  end
end
