# frozen_string_literal: true

require 'rspec'

RSpec.describe 'HexletCode' do
  before do
    user = Struct.new(:name, :job, :gender, :hobby, keyword_init: true)
    @user = user.new name: 'rob', job: 'hexlet', gender: ['m'], hobby: %w[2 3]
  end

  describe '#form_for without block' do
    subject { HexletCode.form_for @user, options }
    context 'without url' do
      let(:options) { {} }
      it 'create form without url' do
        expect(subject).to eq(get_fixture('form_for_without_url.html'))
      end
    end
    context 'with url' do
      let(:options) { { url: '/users' } }
      it 'create form with url' do
        expect(subject).to eq(get_fixture('form_for_with_url.html'))
      end
    end
  end
  describe '#form_for with block' do
    subject { HexletCode.form_for @user, &block }
    context 'contains inputs type text' do
      let(:block) { proc { |f| f.input :name } }
      it 'create form with input type text' do
        expect(subject).to eq(get_fixture('form_for_with_inputs_type_text.html'))
      end
    end
    context 'contains inputs textarea' do
      let(:block) do
        proc do |f|
          f.input :name
          f.input :job, as: :text, class: 'form-control', id: 'exampleFormControlTextarea1'
          f.submit
        end
      end
      it 'create form with input textarea' do
        expect(subject).to eq(get_fixture('form_for_with_inputs_textarea.html'))
      end
    end
    context 'contains select' do
      let(:block) do
        select_options_with_values = [['1', 'First select'], ['2', 'Second select'], ['3', 'Third select']]
        proc do |f|
          f.input :name
          f.input :hobby, as: :select, options: select_options_with_values, multiple: true
          f.input :gender, as: :select, class: 'form-control', options: %w[m f]
          f.submit 'Send', { name: 'sending' }
        end
      end
      it 'create form with select' do
        expect(subject).to eq(get_fixture('form_for_with_inputs_select.html'))
      end
    end
    context 'contains incorrect field' do
      let(:block) do
        proc do |f|
          f.input :name
          f.input :job, as: :text
          f.input :age
        end
      end
      it 'raises an error' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end
  end
end
