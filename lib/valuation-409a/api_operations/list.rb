module Valuation409a
  module APIOperations
    module List
      module ClassMethods
        def all(filters={}, api_key=nil)
          response, api_key = Valuation409a.request(:get, url, api_key, filters)
          Util.convert_to_valuation409a_object(response, api_key)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
