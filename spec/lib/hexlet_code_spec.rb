# frozen_string_literal: true

require 'rspec'

# rubocop:disable Metrics/BlockLength
User = Struct.new(:name, :job, :gender, :hobby, keyword_init: true)

RSpec.describe 'HexletCode' do
  let(:user) { User.new name: 'rob', job: 'hexlet', gender: ['m'], hobby: %w[2 3] }

  describe '#form_for without block' do
    context 'without url' do
      it 'create form without url' do
        form = HexletCode.form_for user, {}
        expect(form).to eq(get_fixture('form_for_without_url.html'))
      end
    end
    context 'with url' do
      it 'create form with url' do
        form = HexletCode.form_for user, { url: '/users' }
        expect(form).to eq(get_fixture('form_for_with_url.html'))
      end
    end
  end

  describe '#form_for with block' do
    context 'contains inputs type text' do
      it 'create form with input type text' do
        block = proc { |f| f.input :name }
        form = HexletCode.form_for user, &block
        expect(form).to eq(get_fixture('form_for_with_inputs_type_text.html'))
      end
    end
    context 'contains inputs textarea' do
      it 'create form with input textarea' do
        block = proc do |f|
          f.input :name
          f.input :job, as: :text, class: 'form-control', id: 'exampleFormControlTextarea1'
          f.submit
        end
        form = HexletCode.form_for user, &block
        expect(form).to eq(get_fixture('form_for_with_inputs_textarea.html'))
      end
    end
    context 'contains select' do
      it 'create form with select' do
        select_options_with_values = [['1', 'First select'], ['2', 'Second select'], ['3', 'Third select']]
        block = proc do |f|
          f.input :name
          f.input :hobby, as: :select, options: select_options_with_values, multiple: true
          f.input :gender, as: :select, class: 'form-control', options: %w[m f]
          f.submit 'Send', { name: 'sending' }
        end
        form = HexletCode.form_for user, &block
        expect(form).to eq(get_fixture('form_for_with_inputs_select.html'))
      end
    end
    context 'contains incorrect field' do
      it 'raises an error' do
        block = proc do |f|
          f.input :name
          f.input :job, as: :text
          f.input :age
        end
        expect { HexletCode.form_for user, &block }.to raise_error(NoMethodError)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
