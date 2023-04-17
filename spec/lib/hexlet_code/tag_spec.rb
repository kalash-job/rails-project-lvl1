# frozen_string_literal: true

require 'rspec'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Tag' do
  describe '#build' do
    subject { HexletCode::Tag.build(tag_name, options) }
    context 'unpair tags' do
      context 'without options' do
        let(:tag_name) { 'br' }
        let(:options) { {} }
        it 'creates tag br' do
          expect(subject).to eq('<br>')
        end
      end
      context 'with options' do
        let(:tag_name) { 'input' }
        let(:options) { { type: 'submit', value: 'Save' } }
        it 'creates tag input' do
          expect(subject).to eq('<input type="submit" value="Save">')
        end
      end
    end
    context 'pair tags' do
      let(:tag_name) { 'div' }
      let(:options) { {} }
      it 'creates tag div' do
        expect(subject).to eq('<div></div>')
      end
    end
  end
  describe '#build with block' do
    subject { HexletCode::Tag.build(tag_name, options, &block) }
    context 'with options' do
      let(:tag_name) { 'label' }
      let(:options) { { for: 'email' } }
      let(:block) { proc { 'Email' } }
      it 'creates tag label with value' do
        expect(subject).to eq('<label for="email">Email</label>')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
