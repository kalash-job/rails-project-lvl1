# frozen_string_literal: true

require_relative './../../test_helper'

class TestTag < Minitest::Test
  EXPECTED_INPUT_RESULT = { name: 'input', options: { type: 'submit', value: 'Save' }, tag_body: [] }.freeze
  EXPECTED_LABEL_RESULT = { name: 'label', options: { for: 'email' }, tag_body: 'Email' }.freeze

  def test_unpair_tag_creation
    assert { HexletCode::Tag.build('br') == { name: 'br', options: {}, tag_body: [] } }
    assert { HexletCode::Tag.build('input', type: 'submit', value: 'Save') == EXPECTED_INPUT_RESULT }
  end

  def test_pair_tag_creation
    assert { HexletCode::Tag.build('div') == { name: 'div', options: {}, tag_body: [] } }
    assert { HexletCode::Tag.build('label', for: 'email') { 'Email' } == EXPECTED_LABEL_RESULT }
  end
end
