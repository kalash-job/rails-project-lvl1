# frozen_string_literal: true

module HexletCode
  module InputTypes
    class String
      def self.get_input(input_name, model, options = {})
        input_options = {
          name: input_name,
          id: input_name,
          type: 'text',
          value: model.public_send(input_name)
        }
        Tag.build('input', input_options.merge(options))
      end
    end
  end
end
