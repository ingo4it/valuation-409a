module Valuation409a
  class ValuationFirm < APIResource
    include Valuation409a::APIOperations::List
    include Valuation409a::APIOperations::Create
    include Valuation409a::APIOperations::Update

    def self.latest(params={})
      response, api_key = Valuation409a.request(:post, self.latest_url, @api_key, params)
      refresh_from(response, api_key)
      self
    end

    def self.new_lead(params={})
      response, api_key = Valuation409a.request(:post, self.new_lead_url, @api_key, params)
      refresh_from(response, api_key)
      self
    end

    private

    def self.latest_url
      url + '/latest'
    end

    def self.new_lead_url
      url + '/new-lead'
    end

  end
end
