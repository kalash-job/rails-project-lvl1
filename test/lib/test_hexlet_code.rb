# frozen_string_literal: true

require_relative './../test_helper'

class TestHexletCode < Minitest::Test
  SELECT_OPTIONS_WITH_VALUES = [['1', 'First select'], ['2', 'Second select'], ['3', 'Third select']].freeze
  SELECT_OPTIONS = %w[m f].freeze
  FIXTURES_FILES_PATH = '/../fixtures/files/'
  User = Struct.new(:name, :job, :gender, :hobby, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: ['m'], hobby: %w[2 3]
    @fixtures_file_path = "#{File.dirname(__FILE__)}#{FIXTURES_FILES_PATH}"
  end

  def test_form_for_without_url
    expected = File.read("#{@fixtures_file_path}form_for_without_url.html")
    form = HexletCode.form_for @user
    assert { form == expected }
  end

  def test_form_for_with_url
    expected = File.read("#{@fixtures_file_path}form_for_with_url.html")
    form = HexletCode.form_for @user, url: '/users'
    assert { form == expected }
  end

  def test_form_for_input_type_text
    expected = File.read("#{@fixtures_file_path}form_for_with_inputs_type_text.html")
    form = HexletCode.form_for @user do |f|
      f.input :name
    end
    assert { form == expected }
  end

  def test_form_for_input_textarea
    expected = File.read("#{@fixtures_file_path}form_for_with_inputs_textarea.html")
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text, class: 'form-control', id: 'exampleFormControlTextarea1'
      f.submit
    end
    assert { form == expected }
  end

  def test_form_for_select
    expected = File.read("#{@fixtures_file_path}form_for_with_inputs_select.html")
    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :hobby, as: :select, options: SELECT_OPTIONS_WITH_VALUES, multiple: true
      f.input :gender, as: :select, class: 'form-control', options: SELECT_OPTIONS
      f.submit 'Send', { name: 'sending' }
    end
    assert { form == expected }
  end

  def test_form_for_incorrect_field
    assert_raises(NoMethodError) do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
