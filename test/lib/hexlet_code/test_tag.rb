# frozen_string_literal: true

require_relative "./../../test_helper"
require_relative "./../../../lib/hexlet_code/tag"

class TestTag < Minitest::Test
  def setup
    @tag = HexletCode::Tag.new
  end

  def test_unpair_tag_creation
    assert { @tag.build("br") == "<br>" }
    assert { @tag.build("input", type: "submit", value: "Save") == '<input type="submit" value="Save">' }
  end
end
