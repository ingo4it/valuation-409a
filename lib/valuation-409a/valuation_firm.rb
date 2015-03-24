module Valuation409a
  class ValuationFirm < APIResource
    include Valuation409a::APIOperations::List
    include Valuation409a::APIOperations::Create
    include Valuation409a::APIOperations::Update

    def self.latest(params={})

      response, api_key = Valuation409a.request(:post, self.latest_url, @api_key, params)
      Util.convert_to_valuation409a_object(response, api_key)
    end

    def self.new_lead(params={})
      response, api_key = Valuation409a.request(:post, self.new_lead_url, @api_key, params)
      Util.convert_to_valuation409a_object(response, api_key)
    end

    private

    def self.latest_url
      '/v1/valuation-firms/latest'
    end

    def self.new_lead_url
      '/v1/valuation-firms/new-lead'
    end

  end
end
