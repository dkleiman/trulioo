# frozen_string_literal: true

module Trulioo
  module API
    # Trulioo::Verifications manages the "Verifications" API endpoints. This
    # accesses the Normalized API.
    class Verifications < Trulioo::API::Base
      class << self
        def format_value(value)
          return true if value.is_a?(String) && /\Atrue\z/i.match(value)
          return false if value.is_a?(String) && /\Afalse\z/i.match(value)

          # Try parsing the value as JSON
          JSON.parse(value)
        rescue StandardError
          # Return the value if it's not JSON
          value
        end

        def parse_fields(fields, value_field)
          return [] unless fields
          fields.each_with_object({}) do |field, h|
            key = field['FieldName'].gsub(/([a-z\d])([A-Z])/, '\1_\2').downcase
            h[key] = format_value(field[value_field])
          end
        end
      end

      def transaction_record(transaction_id, option = nil)
        action = "transactionrecord/#{transaction_id}"
        action += "/#{option}" if option && option.to_sym.in?(options)
        Result.new(get(action, auth: true))
      end

      def verify(data)
        Result.new(post('verify', auth: true, body: data))
      end

      private

      def options
        %i[verbose withaddress]
      end

      def verifications_namespace
        @namespace = 'verifications'
      end
    end
  end
end
