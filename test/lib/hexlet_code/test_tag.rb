# frozen_string_literal: true

require_relative '../../test_helper'

class TestTag < Minitest::Test
  def test_unpair_tag_creation
    assert { HexletCode::Tag.build('br') == '<br>' }
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">' }
  end

  def test_pair_tag_creation
    assert { HexletCode::Tag.build('div') == '<div></div>' }
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>' }
  end
end
