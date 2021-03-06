module Playhouse
  module Support
    module DefaultHashValues
      def value_or_default(key, default)
        value_or_do(key) { default }
      end

      def value_or_error(key, error)
        value_or_do(key) { raise(error) }
      end

      def required_value(key)
        value_or_error(key, ArgumentError.new("Missing required argument #{key}"))
      end

      private

        def value_or_do(key)
          self[key].nil? ? yield : self[key]
        end
    end
  end
end